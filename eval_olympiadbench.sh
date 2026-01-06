set -ex

PROMPT_TYPE=$1
MODEL_NAME_OR_PATH=$2
MAX_TOKEN_NUM=$3

OUTPUT_DIR="./math_eval"

SPLIT="test"
NUM_TEST_SAMPLE=-1

# English open datasets
DATA_NAME="olympiadbench"
TOKENIZERS_PARALLELISM=false \
python3 -u math_eval.py \
    --model_name_or_path ${MODEL_NAME_OR_PATH} \
    --data_name ${DATA_NAME} \
    --output_dir ${OUTPUT_DIR} \
    --split ${SPLIT} \
    --prompt_type ${PROMPT_TYPE} \
    --num_test_sample ${NUM_TEST_SAMPLE} \
    --max_tokens_per_call ${MAX_TOKEN_NUM} \
    --seed 0 \
    --temperature 0 \
    --n_sampling 1 \
    --top_p 1 \
    --start 0 \
    --end -1 \
    --use_vllm \
    --save_outputs \
    --overwrite \
