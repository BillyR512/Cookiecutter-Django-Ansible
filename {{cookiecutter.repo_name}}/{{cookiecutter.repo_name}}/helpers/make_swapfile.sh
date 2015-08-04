sudo dd if=/dev/zero of=/swapfile1 bs=1024 count=524288
sudo chown root:root /swapfile1
sudo chmod 0600 /swapfile1
sudo mkswap /swapfile1
sudo swapon /swapfile1
