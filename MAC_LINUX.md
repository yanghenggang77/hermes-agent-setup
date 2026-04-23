# Mac / Linux 安装指南

> 适用于 macOS 和 Linux 用户，Windows 用户请参考 [SETUP.md](SETUP.md)

---

## macOS 安装

### 系统要求

- macOS 12.0 (Monterey) 或更高版本
- Apple Silicon (M1/M2/M3) 或 Intel 芯片
- 约 5GB 可用磁盘空间

### 第一步：安装 Homebrew（如果未安装）

打开终端（Terminal），粘贴：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 第二步：安装基础依赖

```bash
brew install git curl python@3.11 node
```

### 第三步：一键安装 Hermes Agent

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

### 第四步：配置模型

```bash
hermes setup
```

按提示选择 `openrouter`，输入 API Key。

### 第五步：启动飞书/微信

```bash
hermes gateway setup
```

---

## Linux (Ubuntu/Debian) 安装

### 系统要求

- Ubuntu 20.04+ 或 Debian 11+
- 约 5GB 可用磁盘空间
- 网络畅通

### 第一步：更新系统

```bash
sudo apt update && sudo apt upgrade -y
```

### 第二步：安装基础依赖

```bash
sudo apt install -y git curl python3.11 python3.11-venv build-essential
```

### 第三步：一键安装 Hermes Agent

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

### 第四步：配置模型

```bash
hermes setup
```

### 第五步：启动消息渠道

```bash
hermes gateway setup
```

---

## Linux (CentOS/RHEL/Fedora) 安装

### 第一步：安装 EPEL 和基础依赖

```bash
sudo dnf install -y epel-release
sudo dnf install -y git curl python3.11 python3.11-devel @development-tools
```

### 第二步：一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

### 第三步：配置

```bash
hermes setup
hermes gateway setup
```

---

## 通用验证清单

安装完成后，验证以下各项：

- [ ] `hermes --version` 显示版本号
- [ ] `hermes setup` 配置好模型
- [ ] 飞书/微信能收发消息

---

## 常见问题

**Q: macOS 报安全警告？**
A: 打开「系统偏好设置」→「安全性与隐私」，允许来自不明开发者的应用。

**Q: Linux 下找不到 hermes 命令？**
A: 运行 `source ~/.bashrc` 或重启终端。

**Q: 安装脚本失败？**
A: 确保网络能访问 GitHub，必要时配置代理。

---

## 视频教程

想录 Mac/Linux 版的安装视频？参考 [VIDEO_TUTORIAL.md](VIDEO_TUTORIAL.md)，流程类似，只需把 WSL2 步骤替换成本系统操作即可。

---

*遇到问题提交 Issue 或联系客服*
