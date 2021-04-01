FROM amazonlinux:latest

RUN yum -y install git unzip curl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"\
        -o "awscliv2.zip" &&\
        unzip awscliv2.zip && ./aws/install

RUN yum install -y yum-utils && \
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo &&\
    yum -y install terraform

COPY getset_rsa_keys.sh /root/getset_rsa_keys.sh
RUN chmod +x /root/getset_rsa_keys.sh

COPY .bashrc /root/.bashrc
COPY .bash_profile /root/.bash_profile

# Using Dockerfile collected from Github suitable for development
# https://github.com/imehedi/dev-docker/blob/master/Dockerfile

RUN yum -y update && \
    amazon-linux-extras install epel

RUN yum -y update && \
    yum -y install \
        file ftp git gnupg2 wget which \
        zip zlib zlib-devel jq openssh-clients openssl openssl-devel \
        openssl-libs rsync telnet && \
    yum clean all && rm -rf /var/cache/yum

RUN amazon-linux-extras install python3.8 && \
    alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 && \
    python3 -m pip install --upgrade pip setuptools wheel

COPY files/requirements.txt /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt

COPY files/ansible.cfg /etc/ansible/ansible.cfg