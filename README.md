# pr-campaign-planner

品牌公关宣传策划技能 - 用于 Claude Code

## 功能说明

本技能帮助品牌公关人员将新闻宣传需求转化为结构化的任务文档，并协调相关技能完成新闻稿的撰写、编辑和合规审查。

## 使用场景

当用户需要进行新闻宣传、媒体报道、活动宣传、需要发布新闻稿、撰写新闻宣传文章时使用本技能。

**触发词**：
- "我要写一篇新闻稿"
- "需要媒体报道XX活动/事件"
- "新闻宣传需求"
- "发新闻稿"
- "媒体投稿"
- "宣传活动"
- "公关稿件"

## 工作流程

### 第一阶段：需求收集与文档生成
1. 理解用户需求
2. 生成结构化任务文档（保存到桌面）
3. 列出需要用户确认的信息
4. 等待用户确认

### 第二阶段：内容生产（用户确认后执行）
1. 调用 `financial-news-writer` 技能 - 撰写新闻稿初稿
2. 调用 `news-editor` 技能 - 润色编辑、起标题
3. 调用 `compliance-reviewer` 技能 - 合规审查
4. 产出最终稿件

## 支持的新闻类型

- **活动类**：论坛、峰会、分会场参与
- **产品升级类**：产品发布、功能升级
- **领导演讲类**：高管演讲观点提炼
- **项目宣传类**：战略合作、基地启动、项目发布
- **获奖传播类**：奖项公布、榜单入选
- **产品推介类**：引导用户使用体验、教程推广

## 安装方法

### 方法一：使用 GitHub 仓库安装

1. 克隆仓库到本地：
```bash
cd /tmp
git clone https://github.com/maomaodjj/pr-campaign-planner.git
```

2. 复制到 Claude Code 技能目录：
```bash
mkdir -p ~/.claude/skills/pr-campaign-planner
cp -r /tmp/pr-campaign-planner/* ~/.claude/skills/pr-campaign-planner/
```

3. 验证安装：
```bash
ls -la ~/.claude/skills/pr-campaign-planner/
# 应该看到：SKILL.md, evals/, README.md
```

### 方法二：手动下载安装

1. 下载 SKILL.md 文件
2. 创建技能目录：
```bash
mkdir -p ~/.claude/skills/pr-campaign-planner
```

3. 将下载的文件移动到技能目录

## 依赖技能

本技能依赖以下技能（需要单独安装）：
- `financial-news-writer` - 金融新闻稿撰写
- `news-editor` - 新闻稿编辑润色
- `compliance-reviewer` - 合规审查

## 技能来源

本技能基于 Superpowers 框架创建，专为品牌公关人员设计。

## 许可证

MIT License

## 作者

Created for Claude Code users
