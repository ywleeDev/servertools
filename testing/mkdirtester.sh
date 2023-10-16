#!/bin/bash

# 현재 시간을 얻는 함수
get_current_time() {
    date +%Y%m%d%H%M%S
}

while true; do
    current_time=$(get_current_time)
    
    # 3) /home/cow/servertools/경로에 testdir경로를 만들고 mkdir $(현재시간)을 하여 디렉토리를 만들기 
    mkdir -p "/home/cow/servertools/testdir/${current_time}" &
   sleep 1  
done
