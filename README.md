# Hermes Agent 远程安装部署套件

> 飞书 + 微信消息渠道配置，开箱即用

---

## 📦 套餐说明

| 套餐 | 价格 | 内容 |
|------|------|------|
| 标准版 | ¥30 | 远程安装指导 + 安装脚本 |
| 专业版 | ¥150 | 标准版 + 飞书机器人配置 |
| 全配版 | ¥450 | 专业版 + 微信渠道 + 永久技术支持 |

---

## 🚀 快速开始

### 第一步：检查你的电脑环境

要求：
- Windows 10/11 系统
- 已安装 Git（控制面板 → 程序 → Git）
- 网络畅通

### 第二步：启用 WSL2（必须）

打开 **PowerShell（管理员）**，运行：

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

**重启电脑**，然后在 PowerShell 中运行：

```powershell
wsl --set-default-version 2
wsl --install -d Ubuntu-22.04 --web-download
```

### 第三步：运行一键安装脚本

打开 Ubuntu 终端，运行：

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```

安装完成后验证：

```bash
hermes --version
```

### 第四步：配置消息渠道

**飞书配置** → 查看 [FEISHU.md](FEISHU.md)

**微信配置** → 查看 [WECHAT.md](WECHAT.md)

---

## 📁 文件结构

```
hermes-agent-setup/
├── README.md              # 本文件
├── SETUP.md               # 详细安装步骤
├── FEISHU.md              # 飞书机器人配置指南
├── WECHAT.md              # 微信接入配置指南
├── SCRIPTS/
│   ├── install.sh         # 一键安装脚本
│   ├── setup-feishu.sh    # 飞书配置脚本
│   └── setup-wechat.sh    # 微信配置脚本
└── TEMPLATES/
    └── .env.example       # 环境变量模板
```

---

## ❓ 常见问题

**Q: 安装失败怎么办？**
A: 把错误截图发给我，远程帮你排查

**Q: 需要多久能装好？**
A: 标准环境约 30 分钟，网络慢约 60 分钟

**Q: 支持哪些模型？**
A: OpenAI / Anthropic / MiniMax / 阿里云百炼 / 智谱GLM / OpenRouter

---

## 🛒 购买方式

淘宝/闲鱼搜索：**hermes-agent爱马仕自学习型AI智能体远程代安装部署**

下单后联系客服，获取安装套件和一对一指导。

---

*有问题？提交 Issue 或联系客服*
