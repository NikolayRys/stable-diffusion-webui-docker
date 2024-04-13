sudo mkdir ~/webui
sudo mount /dev/nvme2n1 ~/webui

sudo apt update && sudo apt -y install docker

CONFIG_JSON='{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },
    "data-root": "/home/ubuntu/webui/docker"
}'

echo "$CONFIG_JSON" | sudo tee /etc/docker/daemon.json > /dev/null
sudo systemctl restart docker

# Startup
cd ~/webui && PASS=K#p7^iXX%f3Y3r3S docker compose --profile auto up --build -d

echo "Done, WEBUI IS READY!