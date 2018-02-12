# Linuxkit builder on packet.net

## How to

- Set your project id in `profile`
- Put your packet API Key in `./app/api.key`
- Put a ssh key pair in `./ssh` (id_rsa and id_rsa.pub)
- Launch `./in.sh` to launch a container with the needed tools (terraform)
- In the container launch `./create.sh`, it will provision an arm8 machine and compile linuxkit on it