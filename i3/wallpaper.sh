#!/bin/bash

# 一定要加上面的声明  #！用来声明使用shell脚本执行
# 否则i3wm 无法执行该脚本

# 使用feh 等间隔 改变壁纸
_wallpaper(){
    shopt -s nullglob

    # 图片路径
    path=${HOME}/Pictures/imgs

    # 间隔30秒切换一张壁纸
    interval=300s

    if [[ -n $(which feh) ]]
    then
        if [[ -d ${path} ]]
        then
            cd ${path}
            while true
            do
                files=()
                for i in *.jpg *.png; do
                    [[ -f ${i} ]] && files+=("${i}")
                done
                range=${#files[@]}
                ((range)) && feh --bg-scale "${files[RANDOM % range]}"
                sleep ${interval}
            done
        fi
    fi
}
_wallpaper

