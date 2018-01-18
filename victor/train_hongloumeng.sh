python train.py \
  --use_embedding True \
  --input_file data/hongloumeng.txt \
  --num_steps 80 \
  --name hongloumeng \
  --learning_rate 0.005 \
  --num_seqs 32 \
  --num_layers 3 \
  --embedding_size 256 \
  --lstm_size 256 \
  --max_steps 200000 2>&1| tee train_hongloumeng_`date +%Y%m%d_%H_%M_%S`.log
