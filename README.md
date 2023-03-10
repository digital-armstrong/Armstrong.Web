[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fdigital-armstrong%2FArmstrong.Web%2Fbadge%3Fref%3Ddevelop&style=flat)](https://actions-badge.atrox.dev/digital-armstrong/Armstrong.Web/goto?ref=develop)

# Armstrong.Web

![cover](https://user-images.githubusercontent.com/46975515/218666180-742098ba-98f2-4979-960b-6a706436372f.png)

A web-patform for ARMStrong. This web-platform should be included client 
for ARMStrong, OMIT and assistant for shield "D".

## Before start

### Configuring your workspace:

#### Install and configure Docker and Docker-Compose;

Installing:

```bash
sudo dnf remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-selinux \
                docker-engine-selinux \
                docker-engine

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Fixing problem:

```bash
usermod -a -G docker $USER
```

Start after system be load:

```bash
sudo systemctl enable docker
```

#### Install [ZSH and Oh-my-zsh](https://ohmyz.sh/)

Install:

```bash
sudo dnf install zsh
```

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Set as default shell:

```bash
chsh -s $(which zsh)
```

#### Install [git-flow](https://github.com/petervanderdoes/gitflow-avh)

Install:

```bash
$ wget -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && sudo bash gitflow-installer.sh install stable; rm gitflow-installer.sh
```

### Read manual

- [Git-flow](https://jeffkreeftmeijer.com/git-flow/) 
- [Git-flow usage](https://github.com/petervanderdoes/gitflow-avh#git-flow-usage)


