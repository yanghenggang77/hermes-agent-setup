#!/bin/bash
# Hermes Agent 一键安装脚本
# 运行方式: curl -fsSL https://raw.githubusercontent.com/yanghenggang77/hermes-agent-setup/main/SCRIPTS/install.sh | bash

set -e

echo "🚀 开始安装 Hermes Agent..."

# 检查系统
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "⚠️  警告: 本脚本设计用于 Linux/WSL2 环境"
fi

# 检查 Git
if ! command -v git &> /dev/null; then
    echo "❌ 请先安装 Git: https://git-scm.com/download"
    exit 1
fi

# 检查 WSL
if command -v wsl.exe &> /dev/null; then
    echo "✅ 检测到 WSL2 环境"
fi

# 更新系统
echo "📦 更新系统包..."
sudo apt update && sudo apt upgrade -y

# 安装基础依赖
echo "📦 安装基础依赖..."
sudo apt install -y curl git build-essential

# 安装 uv (Python 包管理器)
echo "📦 安装 uv..."
if command -v uv &> /dev/null; then
    echo "✅ uv 已安装"
else
    curl -LsSf https://astral.sh/uv/install.sh | sh
    source ~/.bashrc
fi

# 克隆 Hermes Agent 仓库
echo "📦 克隆 Hermes Agent..."
if [ -d ~/hermes-agent ]; then
    echo "⚠️  heremes-agent 目录已存在，正在更新..."
    cd ~/hermes-agent
    git pull
else
    git clone https://github.com/NousResearch/hermes-agent ~/hermes-agent
    cd ~/hermes-agent
fi

# 创建虚拟环境
echo "📦 创建 Python 虚拟环境..."
uv venv
source .venv/bin/activate

# 安装依赖
echo "📦 安装 Python 依赖..."
uv pip install -r requirements.txt

# 安装 Hermes Agent CLI
echo "📦 安装 Hermes CLI..."
uv pip install -e .

echo ""
echo "✅ 安装完成！"
echo ""
echo "下一步："
echo "1. 运行 hermes setup 配置模型 API"
echo "2. 运行 hermes gateway setup 配置消息渠道"
echo ""
echo "文档: https://github.com/yanghenggang77/hermes-agent-setup"
