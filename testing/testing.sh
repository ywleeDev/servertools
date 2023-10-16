#!/bin/bash

# 현재 시간을 얻는 함수
get_current_time() {
    date +%Y%m%d%H%M%S
}

while true; do
    current_time=$(get_current_time)

    # 1) 1분마다 /home/cow/servertools/tracedata(현재시간)경로를 155.230.91.207에 /home/ywlee/tracedata 경로로 백업
	코드 수정필요.    
    rsync -avz /home/cow/servertools/tracedata${current_time} ywlee@155.230.91.207:/home/ywlee/tracedata &
    scp -r /home/cow/servertools/tracedata${current_time} ywlee@155.230.91.207:/home/ywlee/
    
    # 2) 0.8 초마다 /sys/kernel/debug/tracing/trace파일을 복사하여 /home/cow/servertools/trace(현재시간)붙여넣기
    cp /sys/kernel/debug/tracing/trace /home/cow/servertools/trace${current_time} &
    
    # 3) /home/cow/servertools/경로에 testdir경로를 만들고 mkdir $(현재시간)을 하여 디렉토리를 만들기 
    mkdir -p "/home/cow/servertools/testdir/${current_time}" &

    # 4) /home/cow/servertools/testdir 경로에 있는 폴더를 제거하기 (1분 후)
     sleep 60 && rm -rf "/home/cow/servertools/testdir/${current_time}" &

     #5 localhost:8080 wget 반복하기 
     wget localhost:8080 & 

     #6 dirtycow 파일 무한 컴파일하기 
     gcc dirtycow.c -o dirtycow & 

   sleep 60  
done
