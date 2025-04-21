#!/bin/bash

# 1. 构建站点
echo "🛠 构建 Hugo 静态文件中..."
hugo || { echo "❌ Hugo 构建失败！"; exit 1; }

# 2. 进入 public 目录
cd public || { echo "❌ 无法进入 public 目录！"; exit 1; }

# 3. 初始化 Git
echo "🔄 初始化 Git 并提交到 gh-pages..."
git init
git remote add origin git@github.com:roryshanshan/hydraulic-oil-pressing-machine.git

# 4. 切换分支
git checkout gh-pages || git checkout -b gh-pages

# 5. 提交并推送
git add .
git commit -m "🚀 Deploy site to GitHub Pages"
git push -f origin gh-pages || { echo "❌ 推送失败！"; exit 1; }

# 6. 返回根目录
cd ..

echo "✅ 部署完成！请访问：https://roryshanshan.github.io/hydraulic-oil-pressing-machine/"