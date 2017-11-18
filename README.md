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

### 配置hostapd

## 脚本

### 检查依赖脚本

```bash
soft-router check
```

### 启动软路由脚本

```bash
soft-router start
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
soft-router ss auto			# switch shadowsocks to auto mode (using gfwlist)
```
