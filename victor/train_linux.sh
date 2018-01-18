python train.py  \
  --input_file data/linux.txt \
  --num_steps 100 \
  --name linux \
  --learning_rate 0.01 \
  --num_seqs 32 \
  --max_steps 20000  2>&1 |tee train_linux_`date +%Y%m%d-%H_%M_%S`.log
