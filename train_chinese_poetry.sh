
python train.py \
  --use_embedding \
  --input_file data/poetry.txt \
  --name poetry \
  --learning_rate 0.005 \
  --num_steps 26 \
  --num_seqs 32 \
  --max_steps 10000  2>&1| tee train_poetry_`date +%Y%m%d_%H_%M_%S`.log

