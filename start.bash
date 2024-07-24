sudo mkdir /home/ubuntu/webui
sudo mount /dev/nvme2n1 /home/ubuntu/webui

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
docker compose --profile auto -f /home/ubuntu/webui/docker-compose.yml up --build -d

echo "Done, WEBUI IS READY!"
