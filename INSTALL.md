# GitHub 上传指南

## 第一步：在 GitHub 创建新仓库

1. 访问：https://github.com/new
2. 仓库名称：`pr-campaign-planner`
3. 描述：`品牌公关宣传策划技能 - Claude Code 技能`
4. 可见性：Public（公开）或 Private（私有）
5. **不要**勾选 "Add a README file"（我们已经有了）
6. 点击 "Create repository"

## 第二步：推送到 GitHub

创建仓库后，GitHub 会显示推送命令。执行以下命令：

```bash
cd /tmp/pr-campaign-planner

# 添加远程仓库（替换成你的用户名）
git remote add origin https://github.com/maomaodjj/pr-campaign-planner.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

## 第三步：验证

访问：https://github.com/maomaodjj/pr-campaign-planner

你应该看到：
- ✅ SKILL.md
- ✅ README.md
- ✅ evals/evals.json
- ✅ INSTALL.md（本文件）

## 在另一台电脑上安装

### 方法一：使用 curl 下载（推荐）

```bash
# 创建技能目录
mkdir -p ~/.claude/skills/pr-campaign-planner

# 下载文件
curl -sL "https://raw.githubusercontent.com/maomaodjj/pr-campaign-planner/main/SKILL.md" -o ~/.claude/skills/pr-campaign-planner/SKILL.md
curl -sL "https://raw.githubusercontent.com/maomaodjj/pr-campaign-planner/main/README.md" -o ~/.claude/skills/pr-campaign-planner/README.md

# 创建 evals 目录并下载
mkdir -p ~/.claude/skills/pr-campaign-planner/evals
curl -sL "https://raw.githubusercontent.com/maomaodjj/pr-campaign-planner/main/evals/evals.json" -o ~/.claude/skills/pr-campaign-planner/evals/evals.json

# 验证安装
ls -la ~/.claude/skills/pr-campaign-planner/
```

### 方法二：使用 git clone

```bash
# 克隆到临时目录
cd /tmp
git clone https://github.com/maomaodjj/pr-campaign-planner.git

# 复制到技能目录
mkdir -p ~/.claude/skills/pr-campaign-planner
cp -r /tmp/pr-campaign-planner/* ~/.claude/skills/pr-campaign-planner/

# 验证安装
ls -la ~/.claude/skills/pr-campaign-planner/
```

### 方法三：使用 skill-creator 安装（如果已安装）

```bash
# 使用 skill-creator 从 GitHub 安装
claude skill install https://github.com/maomaodjj/pr-campaign-planner
```

## 依赖技能提醒

本技能需要以下依赖技能才能正常工作：
- `financial-news-writer`
- `news-editor`
- `compliance-reviewer`

如果这些技能还未安装，需要先安装它们。

## 常见问题

**Q: 推送时出现 403 错误？**
A: 可能需要使用 Personal Access Token。在 GitHub 设置中创建 token，然后使用：
```bash
git remote set-url origin https://<TOKEN>@github.com/maomaodjj/pr-campaign-planner.git
git push -u origin main
```

**Q: 如何更新技能？**
A: 在另一台电脑上运行：
```bash
cd ~/.claude/skills/pr-campaign-planner
git pull origin main
```

或使用 curl 重新下载文件。

**Q: 技能不生效？**
A: 检查技能目录结构是否正确，确保 SKILL.md 在技能根目录下。
