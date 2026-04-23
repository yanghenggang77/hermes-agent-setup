# 详细安装步骤

> 环境要求：Windows 10/11，启用 WSL2

---

## 第一阶段：WSL2 环境配置

### 1.1 启用 WSL2 功能

以**管理员身份**打开 PowerShell，执行：

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### 1.2 重启电脑

这是必须的，否则虚拟化功能不会生效。

### 1.3 设置 WSL2 为默认版本

重启后，打开 PowerShell（普通用户即可）：

```powershell
wsl --set-default-version 2
```

验证：
```powershell
wsl -l -v
```
应看到 VERSION 2。

### 1.4 安装 Ubuntu 22.04

打开 Microsoft Store，搜索 "Ubuntu"，安装 **Ubuntu 22.04 LTS**。

首次启动时创建 Linux 用户名和密码（请牢记）。

---

## 第二阶段：安装 Hermes Agent

### 2.1 更新系统包

在 Ubuntu 终端中：

```bash
sudo apt update
```

### 2.2 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

这个脚本自动完成：
- 安装 uv（Python 包管理器）
- 安装 Python 3.11+
- 克隆 Hermes Agent 仓库
- 创建虚拟环境
- 安装所有依赖

### 2.3 验证安装

```bash
source ~/.bashrc
hermes --version
```

应输出 `hermes 0.8.x`

### 2.4 配置模型 API

```bash
hermes setup
```

按提示选择模型提供商，输入 API Key。

**推荐**：使用 [OpenRouter](https://openrouter.ai) 作为统一入口，一个 Key 通吃所有模型。

---

## 第三阶段：飞书机器人接入

### 3.1 创建飞书应用

1. 打开 [飞书开放平台](https://open.feishu.cn/app)
2. 创建企业自建应用
3. 开启**机器人能力**

### 3.2 配置权限

在「权限管理」中申请：
- `im:message:send_as_bot`
- `im:message:read`
- `contact:user:readonly`

### 3.3 获取凭证

在「凭证与基础信息」页面记下：
- App ID
- App Secret

### 3.4 配置 Gateway

在 Ubuntu 终端运行：

```bash
hermes gateway setup
```

选择 `feishu`，输入 App ID 和 App Secret。

### 3.5 订阅事件

在飞书开放平台 → 「事件与回调」：
- 订阅方式选择「长连接」
- 勾选 `im.message.receive_v1`

### 3.6 测试

在飞书中向机器人发送「你好」，应收到回复。

---

## 第四阶段：微信接入

参见 [WECHAT.md](WECHAT.md)

---

## 验证清单

- [ ] WSL2 已启用，`wsl -l -v` 显示 VERSION 2
- [ ] Ubuntu 22.04 已安装并初始化
- [ ] `hermes --version` 能看到版本号
- [ ] `hermes setup` 配置好模型 API
- [ ] 飞书机器人能接收消息并回复

---

*遇到问题提交 Issue，联系客服获取远程支持*
