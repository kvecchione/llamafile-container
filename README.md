llamafile Container Image
---

## Overview
Based on https://github.com/Mozilla-Ocho/llamafile file-based LLM, this image will download the llamafile executable to /data/llamafile. /data can be a volume to prevent redownload on container restart. The download URL can be changed with the `LLAMAFILE_URL` environment variable. URL comparison is used to determine if a new version needs to be downloaded.

The llamafile endpoint listens via HTTP on port 8080.

## Example Usage
`docker run -it -p 8080:8080 -v data:/data ghcr.io/kvecchione/llamafile-container:main`