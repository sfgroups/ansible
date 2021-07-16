# Ansible Docker

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

Build Ansible on CentOS 8, Python 3.9 and Ansible 2.11.2

Reference:
https://tecadmin.net/install-python-3-9-on-centos-8/

```bash
wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz 
tar xzf Python-3.9.6.tgz 
cd Python-3.9.6
sudo ./configure --with-system-ffi --with-computed-gotos --enable-loadable-sqlite-extensions  --enable-optimizations
sudo make -j ${nproc}
sudo make altinstall
```
# Create Virutal env
```bash
/usr/local/bin/python3.9 -m venv /opt/tools/ansible
source /opt/tools/ansible/bin/activate 
/opt/tools/ansible/bin/pip3.9 install ansible pywinrm requests-ntlm   requests requests-credssp  
chown -R 755 /opt/tools/ansible 
```

# Testing
```bash   
ansible localhost -m ping
```
