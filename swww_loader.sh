#!/bin/bash

directory="/home/tpp57/Pictures/Wallpapers"

# ファイルをランダムに配列に読み込む
readarray -t random_files < <(find "$directory" -maxdepth 1 -type f -printf "%f\n" | shuf)

# 配列の長さを取得
length=${#random_files[@]}

while true; do
  for ((i=0; i<length; i++)); do
    if [ $? -eq 0 ]; then
      matugen image "${directory}/${random_files[i]}"
      swww img "${directory}/${random_files[i]}"  
      sed -i "6c path=${directory}/${random_files[i]}" /home/tpp57/.config/hypr/hyprlock.conf
      sleep 1s
      kitty @ set-colors --all --configured "/home/tpp57/.config/kitty/colors.conf"
      sleep 1s
      sleep 1m
    else
      sleep 1m
    fi
  done
done

