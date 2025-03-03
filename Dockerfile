FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

#ssh
EXPOSE 22
#ptvsd
EXPOSE 4022
# for Nsight Eclipse
EXPOSE 2345
#

#    echo "search nvidia.com" > /etc/resolv.conf \
#    echo "nameserver 10.19.185.252" >/etc/resolv.conf \
#
RUN apt-get update && apt-get install -y mesa-utils libglu1-mesa freeglut3 sudo git openssh-server curl python python-dev build-essential wget vim \
    && rm -rf /var/lib/apt/lists/* 



# Install pip3 first so that pip == pip2 when done.
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip install --no-cache-dir --upgrade  numpy pexpect psutil future IPython \
         tensorflow-gpu==1.4 ptvsd scipy tqdm 


#Fix ptvsd
COPY ptvsd_debugger.patch /tmp/ptvsd_debugger.patch
RUN  patch /usr/local/lib/python2.7/dist-packages/ptvsd/debugger.py /tmp/ptvsd_debugger.patch && \
     rm /tmp/ptvsd_debugger.patch

# Replace 1000 with UID and GROUPS got rom step #1


RUN export uid=1000 gid=1000 user=nvidia&& \
    mkdir -p /home/${user} && \
    echo "${user}:x:${uid}:${gid}:Default,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user} && \
    chmod 0440 /etc/sudoers.d/${user} && \
    chown ${uid}:${gid} -R /home/${user} && \
    mkdir -p /home/${user}/samples/
USER nvidia
ENV HOME /home/nvidia

WORKDIR /home/nvidia/samples/
CMD /bin/bash
