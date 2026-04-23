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

## 🚀 5分钟快速上手（零基础友好）

详见 [QUICKSTART.md](QUICKSTART.md)

---

## 📁 文件结构

```
hermes-agent-setup/
├── README.md              # 套餐说明（你在这里）
├── QUICKSTART.md          # 5分钟快速上手（零基础友好）
├── SETUP.md               # Windows 详细安装步骤（WSL2）
├── MAC_LINUX.md           # Mac / Linux 详细安装指南
├── FEISHU.md              # 飞书机器人配置指南
├── WECHAT.md              # 微信接入配置指南
├── VIDEO_TUTORIAL.md      # 视频教程脚本（录屏参考）
├── TAOBAO_LISTING.md      # 淘宝/京东商品描述文案
├── SCRIPTS/
│   └── install.sh         # 一键安装脚本（全平台通用）
└── TEMPLATES/
    └── .env.example       # 环境变量模板
```

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

### 第四步：配置消息渠道

**飞书配置** → 查看 [FEISHU.md](FEISHU.md)

**微信配置** → 查看 [WECHAT.md](WECHAT.md)

---

## ❓ 常见问题

**Q: 我是 Mac 用户，能装吗？**
A: 能！参考 [MAC_LINUX.md](MAC_LINUX.md)，macOS 安装步骤比 Windows 还简单。


**Q: 我是 Linux 用户，能装吗？**
A: 能！参考 [MAC_LINUX.md](MAC_LINUX.md)，支持 Ubuntu / Debian / CentOS / Fedora。


**Q: 安装失败怎么办？**
A: 把错误截图发给我，远程帮你排查

**Q: 需要多久能装好？**
A: Windows 约 30 分钟，Mac/Linux 约 15 分钟

**Q: 支持哪些模型？**
A: OpenAI / Anthropic / MiniMax / 阿里云百炼 / 智谱GLM / OpenRouter

**Q: 有京东链接吗？**
A: 有的！https://item.jd.com/10218720171806.html

---

## 🛒 购买方式

- **淘宝**：https://item.taobao.com/item.htm?ft=t&id=1042814128061
- **京东**：https://item.jd.com/10218720171806.html

下单后联系客服，获取安装套件和一对一指导。

---

## 📹 视频教程

想录视频教客户？可以参考 [VIDEO_TUTORIAL.md](VIDEO_TUTORIAL.md)，里面有录屏脚本和工具推荐。

---

*有问题？提交 Issue 或联系客服*
