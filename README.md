# Linux 上的软路由配置脚本

## 前期配置

### 安装依赖

需要以下依赖，可以通过检查依赖脚本来检查系统是否已安装依赖

- `brctl`
- `dnsmasq`
- `hostapd`
- `ss-redir`
- `iptables`

### 配置dnsmasq

```bash
vim /etc/dnsmasq.conf

# 设置以下项
strict-order
dhcp-range=192.168.8.100,192.168.8.250,48h
listen-address=192.168.8.1
conf-dir=/etc/dnsmasq.d
```

### 配置hostapd

```bash
vim /etc/hostapd/hostapd.conf

# 设置以下项
interface=wlan0
driver=nl80211
ssid=mytest
country_code=CN
hw_mode=g
channel=acs_survey
acs_num_scans=5
auth_algs=3
ieee80211n=1
wmm_enabled=1
ht_capab=[HT40-][HT40+][TX-STBC][RX-STBC12][SHORT-GI-20][SHORT-GI-40][GF]
wpa=3
wpa_passphrase=12345678
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP CCMP
rsn_pairwise=CCMP
```

## 脚本

### 检查依赖脚本

```bash
soft-router check
```

### 启动软路由脚本

```bash
soft-router start
```

### 停止软路由脚本

```bash
soft-router stop
```

### 重启软路由脚本

```bash
soft-router restart
```

### 重启dnsmasq脚本

```bash
soft-router dnsmasq reload
```

### 获取运行状态脚本

```bash
soft-router status
```

### 切换shadowsocks运行状态/重启脚本

```bash
soft-router ss start		# start shadowsocks
soft-router ss stop			# stop shadowsocks
soft-router ss restart		# restart shadowsocks
soft-router ss status		# show shadowsocks status
soft-router ss global		# switch shadowsocks to global mode
soft-router ss auto		# switch shadowsocks to auto mode (using gfwlist)
soft-router ss up		# update gfwlist
```
