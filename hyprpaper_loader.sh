#!/bin/bash

directory="/home/tpp57/Pictures/Wallpapers/"

# ファイルをランダムに配列に読み込む
readarray -t random_files < <(find "$directory" -maxdepth 1 -type f -printf "%f\n" | shuf)

# 配列の長さを取得
length=${#random_files[@]}

while true; do
  for ((i=0; i<length; i++)); do
    hyprctl hyprpaper preload "${directory}/${random_files[i]}"
    hyprctl hyprpaper wallpaper "DP-1,${directory}/${random_files[i]}"
    hyprctl hyprpaper wallpaper "HDMI-A-1,${directory}/${random_files[i]}"
    sed -i "6c path=${directory}/${random_files[i]}" /home/tpp57/.config/hypr/hyprlock.conf
    matugen image "${directory}/${random_files[i]}"
    sleep 1s
    kitty @ set-colors --all --configured "/home/tpp57/.config/kitty/colors.conf"
    hyprctl reload
    sleep 1s
    hyprctl hyprpaper unload all
    sleep 1m
  done
done
