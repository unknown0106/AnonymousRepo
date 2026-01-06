# Model Evaluation Guide

Due to GitHub's 2GB file size limit for individual files, we were unable to upload the complete model files to this repository. The model files have been uploaded to ModelScope instead. This repository contains the updated README documentation and code files. This guide provides a complete setup process for evaluating model performance on the  **AIME24**,  **AIME25**, **MATH-500**, and **OlympiadBench** benchmarks.

---

### Prerequisites
```bash
# Clone the model repository
git clone https://www.modelscope.cn/unknown0106/AnonymousRepo.git
```

### Create Conda Environment
```bash
conda create -n vllm python=3.11 -y
conda activate vllm
```

### Install vLLM Inference Engine
```bash
pip install vllm==0.11.0 
```
### Install EvalScope Evaluation Library
```bash
pip install evalscope==1.3.0
```

### Deploy Qwen-2.5-Math Evaluation Framework
```bash
git clone https://github.com/QwenLM/Qwen2.5-Math

```


## Evaluation Configuration
```bash
# evaluation for AIME24, AIME25, and MATH500
## start server
VLLM_USE_MODELSCOPE=True CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python -m vllm.entrypoints.openai.api_server --model $MODEL_PATH --served-model-name qwen2.5-14b-instruct --trust_remote_code --port 8802 --tensor-parallel-size 8
## start evaluation
python eval_aime24_aime25_math500.py

# evaluation for OlympiadBench
mv eval_olympiadbench.sh  Qwen2.5-Math/sh/
cd Qwen2.5-Math

## Start evaluation
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 bash sh/eval_olympiadbench.sh "qwen25-math-cot" $MODEL_PATH 32768 
```
