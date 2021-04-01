mkdir -p /root/.ssh
aws s3 cp s3://shamsi-project2/keys/id_rsa /root/.ssh/
aws s3 cp s3://shamsi-project2/keys/id_rsa.pub /root/.ssh/
chmod 0600 /root/.ssh
chmod 0600 /root/.ssh/*