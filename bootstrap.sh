#!/bin/sh

if [[ -z "$LLAMAFILE_URL" ]];then
    echo "Using default URL"
    LLAMAFILE_URL="https://huggingface.co/jartine/llava-v1.5-7B-GGUF/resolve/main/llava-v1.5-7b-q4-server.llamafile?download=true"
fi

if [[ -f /data/llamafile.txt ]];then
    LLAMAFILE_LOCAL=`cat /data/llamafile.txt`
else
    LLAMAFILE_LOCAL="null"
fi

if [[ "$LLAMAFILE_LOCAL" != "$LLAMAFILE_URL" ]];then
    echo "Downloading llamafile from $LLAMAFILE_URL"
    wget $LLAMAFILE_URL -O /data/llamafile
    echo $LLAMAFILE_URL > /data/llamafile.txt
else
    echo "Already downloaded, skipping redownload"
fi

chmod 700 "/data/llamafile"

sh -c "/data/llamafile --host 0.0.0.0"