
# Setup NFS server in Ubuntu
```sh

sudo apt install nfs-kernel-server -y

sudo systemctl start nfs-kernel-server.service

sudo nano /etc/exports

/minikube *(rw,async,no_subtree_check,no_root_squash)

sudo mkdir -p /minikube
chmod -R 777 /minikube

sudo exportfs -a

telnet localhost 2049

```

# Mount NFS server using NFS client in Mac

```sh
telnet qt 2049

mkdir -p /Users/qt/Downloads/nfs
sudo chown -R $USER /Users/qt/Downloads/nfs

sudo mount -t nfs -o resvport,rw,noowners qt:/minikube/ /Users/qt/Downloads/nfs

showmount -e qt

# unmount
sudo umount -f /Users/qt/Downloads/nfs
```
