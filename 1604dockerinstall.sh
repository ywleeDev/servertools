#!/bin/bash
#먼저, 필요한 패키지를 업데이트하고 apt 패키지를 사용하여 CA 인증서를 설치합니다:
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


#Dcker의 공식 GPG 키를 추가
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Docker repository를 APT 소스에 추가합니다
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#Docker 패키지 업데이트 및 설치
sudo apt-get update
sudo apt-get install docker-ce




