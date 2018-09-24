# alpine-ansible

1. Build

 docker build -t sfgroups/alpine-ansible:0.1 .


2. Run

```bash
    docker run --rm -it \
        -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
        -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
        -v ~/.kube:/.kube \
        -v $(pwd):/ansible/playbooks \
        sfgroups/docker-ansible:0.1 site.yaml
```
