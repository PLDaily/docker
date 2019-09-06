## Docker 教程

### 安装

- ubuntu 下的[安装](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-from-a-package)

- mac 下的[安装]( https://download.docker.com/mac/stable/Docker.dmg)

### 基本信息

> Docker 版本

```sh
docker version
```

> Docker 状态

```sh
docker info
```

### 镜像

> 拉取镜像

```sh
docker pull hello-world
```

> 查看拉取的镜像

```sh
docker images
```

> 删除镜像

```sh
docker rmi 镜像名
```

### 容器

> 基本镜像创建容器

```sh
docker run [--rm] -dt [-p 主机端口:容器端口] [--name 容器别名] [-v 主机/目录:容器/目录] 容器名 [/bin/sh]    # '[]'表示可选选项. rm: 容器stop后自动销毁; d: 后台运行; p: 端口映射; v: 目录映射, 持久化存储; 容器名后接在容器内需要运行的程序/命令
```

```sh
docker run -dt -p 80:80 --name test ubuntu    # 示例
```

> 查看容器

```sh
docker ps (正在运行)
```

```sh
docker ps -a (所有)
```

> 进入容器

```sh
docker exec -it 容器名 /bin/sh    # 接入后台运行的容器shell
```

> 开启关闭容器

```sh
docker stop/start 容器名    # 关闭或重新启动容器
```

> 退出容器

```sh
exit
```

> 删除容器

```sh
docker rm [-f] 容器名    # 删除容器, 会丢失里面的数据, f: 强制
```

### 创建镜像

> 新建 dockerfile 文件

```dockerfile
FROM node:10.16.0-slim@sha256:e1a87966f616295140efb069385fabfe9f73a43719b607ed3bc8d057a20e5431

EXPOSE 8888
RUN  apt-get update \
     && apt-get install -y vim \
     && apt-get install -y procps

ADD . /src
WORKDIR /src

RUN yarn
CMD ["node", "server.js"]
```

> docker build

```sh
docker build -f /path/to/a/Dockerfile -t name .    # -t为该docker的name，.代表当前目录
```

> 推到 docker hub

```sh
docker push [docker name]
```

### docker-compose

> 配置示例

```yml
version: "2.2"
services:
  app:
    container_name: "ubuntu"
    image: ubuntu
    ports:
      -  8888:8888
    volumes:
      - /tmp/logs:/src/logs
    restart: always
```

> 启动服务

```sh
docker-compose up -d
```

> 停止服务

```sh
docker-compose down
```

### docker login

```sh
docker login --username pldaily hub.docker.com
```

### ip 转发

```sh
vim /etc/sysctl.conf
net.ipv4.ip_forward = 1
sysctl -p /etc/sysctl.conf
```

启用 ip 转发功能，否则流量到宿主机后无法转发到 docker container 上。

### nginx 代理

```sh
sh http.sh      # http 代理
```

```sh
sh https.sh      # https 代理
```
