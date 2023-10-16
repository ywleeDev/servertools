#!/bin/bash

# 현재 시간을 얻는 함수
get_current_time() {
    date +%Y%m%d%H%M%S
}

while true; do
    current_time=$(get_current_time)
    # 1) 0.8 초마다 /sys/kernel/debug/tracing/trace파일을 복사하여 /home/cow/servertools/trace(현재시간)붙여넣기
    #scp -r /home/cow/servertools/tracedata${current_time} ywlee@155.230.91.207:/home/ywlee/
   echo $(current_time)
   sleep 60  
done
