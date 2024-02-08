#!/bin/bash

# .configディレクトリ内のファイルとディレクトリをループ
for item in .config/*
do
  # すでにそのパスが存在する場合はスキップ
  if [ -e ~/.config/${item##*/} ] 
  then
    continue
  fi

  # シンボリックリンクを作成
  ln -s $PWD/$item ~/.config/${item##*/}
done

# .bash_profileと.bashrcをリンク
ln -s $PWD/.bash_profile ~/.bash_profile
ln -s $PWD/.bashrc ~/.bashrc
