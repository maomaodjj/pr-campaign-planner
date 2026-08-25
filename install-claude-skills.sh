#!/bin/bash
# Claude Code 技能批量安装脚本
# 安装 pr-campaign-planner 和 compliance-reviewer 两个技能

set -e

echo "=========================================="
echo "🚀 Claude Code 技能批量安装"
echo "=========================================="
echo ""

# 配置
GITHUB_USER="maomaodjj"
SKILLS_BASE_DIR="$HOME/.claude/skills"

# 技能列表
declare -A SKILLS=(
  ["pr-campaign-planner"]="pr-campaign-planner"
  ["compliance-reviewer"]="compliance-reviewer"
)

# ============================================
# 技能1: pr-campaign-planner
# ============================================
install_pr_campaign_planner() {
    local SKILL_DIR="$SKILLS_BASE_DIR/pr-campaign-planner"
    local REPO="$GITHUB_USER/pr-campaign-planner"

    echo "📦 安装 pr-campaign-planner（品牌公关宣传策划）..."

    # 创建目录
    mkdir -p "$SKILL_DIR"
    mkdir -p "$SKILL_DIR/evals"

    # 下载主要文件
    echo "   ⬇️  下载 SKILL.md..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/SKILL.md" -o "$SKILL_DIR/SKILL.md"

    echo "   ⬇️  下载 README.md..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/README.md" -o "$SKILL_DIR/README.md"

    echo "   ⬇️  下载 INSTALL.md..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/INSTALL.md" -o "$SKILL_DIR/INSTALL.md"

    # 下载 evals 文件
    echo "   ⬇️  下载 evals/evals.json..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/evals/evals.json" -o "$SKILL_DIR/evals/evals.json"

    echo "   ✅ pr-campaign-planner 安装完成"
}

# ============================================
# 技能2: compliance-reviewer
# ============================================
install_compliance_reviewer() {
    local SKILL_DIR="$SKILLS_BASE_DIR/compliance-reviewer"
    local REPO="$GITHUB_USER/compliance-reviewer"

    echo "📦 安装 compliance-reviewer（金融合规审查）..."

    # 创建目录
    mkdir -p "$SKILL_DIR"
    mkdir -p "$SKILL_DIR/evals"
    mkdir -p "$SKILL_DIR/references"
    mkdir -p "$SKILL_DIR/scripts"

    # 下载主要文件
    echo "   ⬇️  下载 SKILL.md..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/SKILL.md" -o "$SKILL_DIR/SKILL.md"

    echo "   ⬇️  下载 README.md..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/README.md" -o "$SKILL_DIR/README.md"

    echo "   ⬇️  下载 INSTALL.md..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/INSTALL.md" -o "$SKILL_DIR/INSTALL.md"

    # 下载 evals 文件
    echo "   ⬇️  下载 evals 文件..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/evals/evals.json" -o "$SKILL_DIR/evals/evals.json"
    curl -sL "https://raw.githubusercontent.com/$REPO/main/evals/test_article_auto_fix.md" -o "$SKILL_DIR/evals/test_article_auto_fix.md"
    curl -sL "https://raw.githubusercontent.com/$REPO/main/evals/test_article_finance.md" -o "$SKILL_DIR/evals/test_article_finance.md"
    curl -sL "https://raw.githubusercontent.com/$REPO/main/evals/test_article_with_violations.md" -o "$SKILL_DIR/evals/test_article_with_violations.md"
    curl -sL "https://raw.githubusercontent.com/$REPO/main/evals/test_article_with_violations_fixed.md" -o "$SKILL_DIR/evals/test_article_with_violations_fixed.md"

    # 下载 references 文件
    echo "   ⬇️  下载 references 文件..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/references/geoflow-integration.md" -o "$SKILL_DIR/references/geoflow-integration.md"

    # 下载 scripts 文件
    echo "   ⬇️  下载 scripts 文件..."
    curl -sL "https://raw.githubusercontent.com/$REPO/main/scripts/compliance_check.py" -o "$SKILL_DIR/scripts/compliance_check.py"
    curl -sL "https://raw.githubusercontent.com/$REPO/main/scripts/compliance_check_v2.py" -o "$SKILL_DIR/scripts/compliance_check_v2.py"

    # 设置执行权限
    chmod +x "$SKILL_DIR/scripts/"*.py

    echo "   ✅ compliance-reviewer 安装完成"
}

# ============================================
# 主安装流程
# ============================================
main() {
    # 检查基础目录
    if [ ! -d "$SKILLS_BASE_DIR" ]; then
        echo "⚠️  Claude Code 技能目录不存在，正在创建..."
        mkdir -p "$SKILLS_BASE_DIR"
    fi

    # 安装技能1
    install_pr_campaign_planner
    echo ""

    # 安装技能2
    install_compliance_reviewer
    echo ""

    # ============================================
    # 验证安装
    # ============================================
    echo "=========================================="
    echo "🔍 验证安装..."
    echo "=========================================="
    echo ""

    echo "📁 pr-campaign-planner:"
    if [ -d "$SKILLS_BASE_DIR/pr-campaign-planner" ]; then
        echo "   ✅ 目录存在"
        ls -1 "$SKILLS_BASE_DIR/pr-campaign-planner/" | sed 's/^/      - /'
    else
        echo "   ❌ 目录不存在"
    fi
    echo ""

    echo "📁 compliance-reviewer:"
    if [ -d "$SKILLS_BASE_DIR/compliance-reviewer" ]; then
        echo "   ✅ 目录存在"
        echo "      - SKILL.md"
        echo "      - README.md"
        echo "      - INSTALL.md"
        echo "      - evals/ (5个文件)"
        echo "      - references/ (1个文件)"
        echo "      - scripts/ (2个文件)"
    else
        echo "   ❌ 目录不存在"
    fi
    echo ""

    echo "=========================================="
    echo "🎉 安装完成！"
    echo "=========================================="
    echo ""
    echo "已安装技能："
    echo "  1. pr-campaign-planner - 品牌公关宣传策划"
    echo "  2. compliance-reviewer - 金融合规审查"
    echo ""
    echo "重启 Claude Code 后即可使用这些技能。"
}

# 运行主程序
main
