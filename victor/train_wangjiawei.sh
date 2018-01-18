
python train.py \
  --use_embedding \
  --input_file data/WangJiaWeiJingXianDianYIngDuiBai.txt \
  --name WangJiaWei \
  --learning_rate 0.005 \
  --num_steps 26 \
  --num_seqs 32 \
  --max_steps 200000  2>&1| tee train_WangJiaWei_`date +%Y%m%d_%H_%M_%S`.log

