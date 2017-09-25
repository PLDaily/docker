### docker安装启动

ubuntu下的[安装](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-from-a-package)

Mac下的[安装](https://download.docker.com/mac/stable/Docker.dmg)

mac下通过Docker Quickstart Terminal.app启动

国内镜像: [网易蜂巢](https://c.163.com/hub#/m/library/)

### 基本信息

> docker版本

```
docker version
```

> Docker 状态

```
docker info
```

### 镜像

> 拉取镜像

```
docker pull hello-world
```

> 查看拉取的镜像

```
docker images
```

> 删除镜像

```
docker rim 镜像名 
```

### 容器

> 基本镜像创建容器

```
docker run [--rm] -dt [-p 主机端口:容器端口] [--name 容器别名] [-v 主机/目录:容器/目录] 容器名 [/bin/sh]    # '[]'表示可选选项. rm: 容器stop后自动销毁; d: 后台运行; p: 端口映射; v: 目录映射, 持久化存储; 容器名后接在容器内需要运行的程序/命令
```

> 查看容器

```
docker ps(正在运行)
```

```
docker ps -a (所有)
```

> 进入容器

```
docker exec -it 容器名 /bin/sh    # 接入后台运行的容器shell
```

> 开启关闭容器

```
docker stop/start 容器名    # 关闭或重新启动容器
```

> 退出容器

```
exit
```

> 删除容器

```
docker rm [-f] 容器名    # 删除容器, 会丢失里面的数据, f: 强制
```

### 创建镜像

> 新建dockerfile文件

```
From hub.c.163.com/library/ubuntu

MAINTAINER PLDaily "pcd12321@gmail.com"

RUN apt-get update

RUN apt-get install -y nginx

EXPOSE 80

```

> docker build

```
docker build -t="pladily/static_web" . #-t为该docker的name，.代表当前目录
```

> 推到docker hub

```
docker push pldaily/static_web
```

### 示例

- 登陆

```
docker login -u gitlab-ci -p y$4E*^MwFl7NqAL oa.52liuda.com:25000
```

- 拉取

```
docker pull oa.52liuda.com:25000/ops/mobile:bloat
```

- 创建容器

```
docker run -d -p 80:80 --name h5test oa.52liuda.com:25000/ops/mobile:bloat
```

- 进入容器

```
docker exec -it h5test /bin/bash
```

