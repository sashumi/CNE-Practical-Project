FROM amazonlinux:2.0.20200722.0

RUN yum -y update && \
    amazon-linux-extras install epel

RUN yum -y update && yum install -y curl file ftp git gnupg2 unzip wget which \
        zip zlib zlib-devel jq openssh-clients openssl openssl-devel \
        openssl-libs rsync telnet && \
    yum clean all && rm -rf /var/cache/yum

# found on a blog
RUN amazon-linux-extras install python3.8 && \
    alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 && \
    python3 -m pip install --upgrade pip setuptools wheel

COPY files/requirements.txt /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt

COPY files/ansible.cfg /etc/ansible/ansible.cfg
