#!/usr/bin/env bash

set -Eeuo pipefail

# TODO: maybe just use the .gitignore file to create all of these
mkdir -vp /data/.cache \
  /data/embeddings \
  /data/config/ \
  /data/models/ \
  /data/models/Stable-diffusion \
  /data/models/GFPGAN \
  /data/models/RealESRGAN \
  /data/models/LDSR \
  /data/models/VAE

echo "Downloading, this might take a while..."

aria2c -x 10 --disable-ipv6 --input-file /docker/models_links.txt --dir /data/models --continue
aria2c -x 10 --disable-ipv6 --input-file /docker/embeddings_links.txt --dir /data/embeddings --continue

echo "Downlading git repos..."
git clone https://github.com/Mikubill/sd-webui-controlnet.git /data/config/auto/extensions/sd-webui-controlnet
git clone https://github.com/Bing-su/adetailer.git /data/config/auto/extensions/adetailer
git clone https://github.com/adieyal/sd-dynamic-prompts.git /data/config/auto/extensions/sd-dynamic-prompts
git clone https://github.com/ArtVentureX/sd-webui-agent-scheduler.git /data/config/auto/extensions/sd-webui-agent-scheduler
git clone https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper.git /data/config/auto/extensions/Stable-Diffusion-Webui-Civitai-Helper
echo "Done!"