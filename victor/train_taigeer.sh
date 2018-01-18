
python train.py \
  --use_embedding \
  --input_file data/TaiGeErShiJi.txt \
  --name TaiGeErShiJi \
  --learning_rate 0.005 \
  --num_steps 52 \
  --num_seqs 64 \
  --max_steps 200000  2>&1| tee train_TaiGeErShiJi_`date +%Y%m%d_%H_%M_%S`.log

