
1. Install configuration files
```sh
mkdir -p config config/grafana/configs/ config/prometheus
# download alert manager config
wget https://raw.githubusercontent.com/prometheus/alertmanager/main/doc/examples/simple.yml -O config/alertmanager/alertmanager.yaml
# download loki config
wget https://raw.githubusercontent.com/grafana/loki/v2.9.2/cmd/loki/loki-local-config.yaml -O config/loki/loki-config.yaml
# download promtail config
wget https://raw.githubusercontent.com/grafana/loki/v2.9.2/clients/cmd/promtail/promtail-docker-config.yaml -O config/promtail/promtail-config.yaml
# download prometheus config
wget https://raw.githubusercontent.com/prometheus/prometheus/main/documentation/examples/prometheus.yml -O config/prometheus/prometheus.yaml
# download grafana config
mkdir -p config/grafana/
wget https://raw.githubusercontent.com/grafana/grafana/main/conf/sample.ini -O config/grafana/configs/grafana.ini
```

2. Setup Apache and Nginx locally
```sh
sudo apt install apache2 -y
sudo nano /etc/apache2/ports.conf # edit from 80 to 8001
# create custom apache static content dir
sudo mkdir -p /var/www/html/apache
sudo chown -R $USER /var/www/html/apache
sudo echo "Hello, this is APACHE server" > /var/www/html/apache/index.html
sudo nano /etc/apache2/sites-enabled/000-default.conf
# set `<VirtualHost *:8001>`
# set `DocumentRoot /var/www/html`
sudo service apache2 restart


sudo apt install nginx -y
sudo chown -R $USER:www-data /var/www # set permission for static dir
# create custom nginx static content dir
sudo mkdir -p /var/www/html/nginx
sudo echo "Hello, this is NGINX server" > /var/www/html/nginx/index.html
sudo nano /etc/nginx/sites-available/default 
# change from `listen 80 default_server` to `listen 8002 default_server`
# set `root /var/www/html/nginx;`
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl restart nginx
```

3. Enable apache status

3.1. Manually in Container
```sh
# update /usr/local/apache2/conf/extra/httpd-info.conf
vi /usr/local/apache2/conf/extra/httpd-info.conf

<Location /server-status>
    SetHandler server-status
    Require all granted
</Location>

# update the below file (for apache in ubuntu)
sudo nano /etc/apache2/mods-available/status.conf
```

3.2. Using automated script
```sh
sudo apt install -y python-is-python3
sudo apt install python3-pip -y
pip install apache_conf_parser
```

4. Enable nginx status

3.1. Manually in container
```sh
docker exec -it nginx bash

apt update -y
apt install -y vim

vi /etc/nginx/conf.d/default.conf

# add following lines 
location /server-status {
    stub_status;
}

exit

docker restart nginx

curl localhost:82/server-status
```

3.2. Manually in host
```sh
sudo vi /etc/nginx/sites-available/default

# add following lines 
location /server-status {
    stub_status;
}

sudo systemctl restart nginx
curl localhost:8002/server-status
```
