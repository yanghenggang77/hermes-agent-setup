#!/bin/bash
# Hermes Agent 一键安装脚本
# 运行方式:
#   Linux/macOS/WSL2:  curl -fsSL https://raw.githubusercontent.com/yanghenggang77/hermes-agent-setup/main/SCRIPTS/install.sh | bash
#
# 本脚本自动下载并执行官方安装脚本，同时做环境检查和安装后验证。

set -e

echo "🚀 Hermes Agent 安装脚本"
echo "========================"

# -------- 1. 环境检测 --------
if [[ "$OSTYPE" == darwin* ]]; then
  PLATFORM="macOS"
elif [[ "$OSTYPE" == linux-gnu* ]]; then
  PLATFORM="Linux"
elif command -v wsl.exe &> /dev/null; then
  PLATFORM="WSL2"
else
  echo "⚠️  警告: 本脚本支持 Linux/macOS/WSL2，当前环境可能不完全兼容"
  PLATFORM="unknown"
fi
echo "📍 检测到平台: $PLATFORM"

# -------- 2. 必要工具检查 --------
echo ""
echo "🔍 检查必要工具..."

MISSING=""
for cmd in git curl; do
  if ! command -v "$cmd" &> /dev/null; then
    MISSING="$MISSING $cmd"
  fi
done

if [ -n "$MISSING" ]; then
  echo "❌ 缺少以下工具:$MISSING"
  echo "请先安装后再运行本脚本"
  exit 1
fi
echo "✅ Git 和 Curl 已就绪"

# -------- 3. Python 版本检查（要求 3.11+）--------
echo ""
echo "🔍 检查 Python 版本..."
if command -v python3 &> /dev/null; then
  PYVER=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  PYVER_NUM=$(python3 -c 'import sys; print(sys.version_info.major * 100 + sys.version_info.minor)')
  if [ "$PYVER_NUM" -ge 311 ]; then
    echo "✅ Python $PYVER (符合要求)"
  else
    echo "⚠️  Python $PYVER 低于要求的 3.11，请升级后重试"
    echo "   建议: https://docs.python.org/3/using/index.html"
    exit 1
  fi
else
  echo "⚠️  未找到 Python3，将由官方安装脚本处理"
fi

# -------- 4. 更新系统包（非 upgrade，只更新索引）--------
echo ""
echo "📦 更新软件包索引..."
sudo apt update -qq

# -------- 5. 安装基础依赖 --------
echo "📦 安装基础依赖..."
sudo apt install -y -qq curl git build-essential

# -------- 6. 安装 uv --------
echo ""
echo "📦 安装 uv (Python 包管理器)..."
if command -v uv &> /dev/null; then
  echo "✅ uv 已安装: $(uv --version)"
else
  # 安装到 ~/.local/bin（不依赖 shell 扩展）
  curl -LsSf https://astral.sh/uv/install.sh | sh

  # 显式加 PATH，避免非交互式 shell 找不到 uv
  export PATH="$HOME/.local/bin:$PATH"

  if command -v uv &> /dev/null; then
    echo "✅ uv 安装成功: $(uv --version)"
  else
    echo "❌ uv 安装失败，请手动检查网络后重试"
    exit 1
  fi
fi

# -------- 7. 下载并执行官方安装脚本 --------
echo ""
echo "📦 下载官方安装脚本..."
INSTALL_SCRIPT_TMP=$(mktemp)
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh \
  -o "$INSTALL_SCRIPT_TMP"
chmod +x "$INSTALL_SCRIPT_TMP"

echo "📦 执行官方安装脚本（skip-setup 模式，不启动交互式配置）..."
if [ "$PYVER_NUM" -ge 311 ]; then
  # 官方脚本需要 Python 3.11+，已验证通过，传入 skip-setup 避免卡在交互
  bash "$INSTALL_SCRIPT_TMP" --skip-setup
else
  bash "$INSTALL_SCRIPT_TMP" --skip-setup
fi

rm -f "$INSTALL_SCRIPT_TMP"

# -------- 8. 验证安装 --------
echo ""
echo "🔍 验证安装结果..."

# 确保 PATH 包含 hermes 可能的位置
export PATH="$HOME/.local/bin:$HOME/.hermes/bin:$PATH"
source ~/.bashrc 2>/dev/null || true

if command -v hermes &> /dev/null; then
  echo "✅ hermes 命令找到: $(hermes --version 2>/dev/null || echo 'version OK')"
else
  # 尝试常见位置
  for p in "$HOME/.hermes/hermes-agent/.venv/bin/hermes" \
           "$HOME/.local/bin/hermes" \
           "$HOME/hermes-agent/.venv/bin/hermes"; do
    if [ -x "$p" ]; then
      echo "✅ hermes 找到: $p"
      ln -sf "$p" "$HOME/.local/bin/hermes" 2>/dev/null || true
      export PATH="$(dirname $p):$PATH"
      break
    fi
  done
fi

# Python 版本二次确认
PY_VER_OK=$(python3 -c 'import sys; sys.exit(0 if sys.version_info >= (3,11) else 1)' 2>/dev/null && echo "yes" || echo "no")
if [ "$PY_VER_OK" == "yes" ]; then
  echo "✅ Python 版本符合要求"
else
  echo "⚠️  Python 版本可能不足 3.11，请检查"
fi

echo ""
echo "========================"
echo "✅ 安装完成！"
echo ""
echo "下一步："
echo "1. 运行: hermes setup          # 配置模型 API"
echo "2. 运行: hermes gateway setup   # 配置消息渠道（飞书/微信）"
echo ""
echo "📚 完整文档: https://github.com/yanghenggang77/hermes-agent-setup"
echo "💬 遇到问题: 提交 Issue 或联系淘宝客服"
