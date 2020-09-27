#!/usr/bin/env bash
*********************************************
Git
*********************************************
git log --pretty=format:"%h - %an, %ar : %s"
git commit --amend

git remote show origin #远程分支的信息
git remote rm paul  ## 删除remote name

git tag -a v1.4 -m 'my version 1.4' #附注标签
git tag v1.4  #轻量标签

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global alias.unstage 'reset HEAD --' #取消暂存名

git checkout -b iss53
git push origin --delete serverfix //删除远程分支名

git reset --hard HEAD^

git checkout


git push -u origin master

git revert vs git reset


git branch --merged
git branch -d calc-divide
git branch -a
git push origin --delete calc-divide


git merge login


