#!/bin/bash

# 현재 시간을 얻는 함수
get_current_time() {
    date +%Y%m%d%H%M%S
}

while true; do
    current_time=$(get_current_time)
    # 2) 0.8 초마다 /sys/kernel/debug/tracing/trace파일을 복사하여 /home/cow/servertools/trace(현재시간)붙여넣기
    cp /sys/kernel/debug/tracing/trace /home/cow/servertools/trace${current_time} &
   sleep 60  
done
