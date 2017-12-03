#tagname="victorgwli/char-rnn:tensorflow-1.4-gpu"
nvidia-docker run --privileged  -e DISPLAY  --net=host --ipc=host -it -v $HOME/.Xautority:/home/nvidia/.Xautoority -v `pwd`:/home/nvidia/samples/char-rnn $tagname /bin/bash
