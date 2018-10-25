FROM centos:latest

## 1. copy aliyun centos yum
RUN rm /etc/yum.repos.d/*

### 
# ADD CentOS-Base.repo /etc/yum.repos.d/
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum makecache

## 2. install nessaray tools
RUN yum install -y openss openssh-clients openssh-server sudo java-1.8.0-openjdk

## 3. init env: sshkey
RUN ssh-keygen -N '' -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
 ssh-keygen -N '' -q -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
 ssh-keygen -N '' -q -t rsa -f /etc/ssh/ssh_host_rsa_key && \
 ssh-keygen -N '' -q -t rsa -f /root/.ssh/id_rsa && \
 echo "root:devops2018" | chpasswd

## install tomcat
RUN curl -o /usr/local/apache-tomcat-8.0.39.tar.gz http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.39/bin/apache-tomcat-8.0.39.tar.gz && \
cd /usr/local/ && tar -xzvf apache-tomcat-8.0.39.tar.gz && rm -f apache-tomcat-8.0.39.tar.gz && ln -s apache-tomcat-8.0.39 tomcat

## 4. Add deployment codes. It will make the container always running
ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
