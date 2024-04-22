
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

2. Create volume directories

```sh
mkdir -p ./data/alertmanager
mkdir -p ./data/loki
mkdir -p ./data/promtail
mkdir -p ./data/prometheus
```

3. Update configuration

3.1. For Loki configuration
```sh

```