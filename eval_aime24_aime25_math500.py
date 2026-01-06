from evalscope import TaskConfig, run_task
task_config = TaskConfig(
    api_url='http://0.0.0.0:8802/v1/chat/completions', 
    model='qwen2.5-14b-instruct',  
    eval_type='openai_api',  
    datasets=['aime24', 'aime25', 'math_500'], 
    dataset_args={'math_500': {'few_shot_num': 0, 'subset_list': ['Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5']}},
    eval_batch_size=32
)
run_task(task_config)
