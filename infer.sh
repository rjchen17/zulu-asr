python /workspace/fairseq/examples/speech_recognition/infer.py \
    $DATA_PATH \ 
    --gen-subset all \
    --path $MODEL_PATH \ 
    --results-path $RESULTS_PATH \ 
    --task audio_finetuning \
    --nbest 1 \
    --w2l-decoder viterbi \
    --criterion ctc \
    --labels ltr \
    --max-tokens 5000000 \
    --post-process letter

