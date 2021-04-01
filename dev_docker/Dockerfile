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
