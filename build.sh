local_sum="none"

if [ -f ubuntu-xenial-core-cloudimg-amd64-root.tar.gz ];then
  local_sum=$(sha256sum ubuntu-xenial-core-cloudimg-amd64-root.tar.gz | awk '{print $1}')
  remote_sum=$(curl -s https://partner-images.canonical.com/core/xenial/current/SHA256SUMS | grep ubuntu-xenial-core-cloudimg-amd64-root.tar.gz  | awk '{print $1}')
fi

if [ "$local_sum" != "$remote_sum" ];then
  echo $local_sum
  echo $remote_sum
  curl -O https://partner-images.canonical.com/core/xenial/current/ubuntu-xenial-core-cloudimg-amd64-root.tar.gz
fi


docker build -t dalehamel/ubuntu-docker-systemd-minimal:latest .
