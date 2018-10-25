FROM centos:latest

## 1. copy aliyun centos yum
RUN rm /etc/yum.repos.d/*

### 
# ADD CentOS-Base.repo /etc/yum.repos.d/
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum makecache

## 2. install nessaray tools
RUN yum install -y openss openssh-clients openssh-server expect sudo ansible

## 3. init env: sshkey; 
RUN ssh-keygen -N '' -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
 ssh-keygen -N '' -q -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
 ssh-keygen -N '' -q -t rsa -f /etc/ssh/ssh_host_rsa_key && \
 ssh-keygen -N '' -q -t rsa -f /root/.ssh/id_rsa && \
 echo "root:devops2018" | chpasswd

# copy an expect shell script for auto inputing password when ssh to other container
ADD copy_id.expect /root/deploy/
RUN chmod +x /root/deploy/copy_id.expect

## 4. Add deployment codes. It will make the container always running
ADD run.sh /run.sh
RUN chmod +x /run.sh    

CMD [ "/run.sh" ]
