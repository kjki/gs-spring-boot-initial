#!/bin/bash
DEPLOY_PATH=$(ls /tmp/*.jar)
echo "deploy_path: $DEPLOY_PATH"
JAR_NAME=$(basename $DEPLOY_PATH)
echo "> build ���ϸ�: $JAR_NAME"

echo "> spring-boot-demo.jar ��ü"
APPLICATION_HOME=/home/ec2-user/
APPLICATION_JAR_NAME=demo.jar
APPLICATION_JAR=$APPLICATION_HOME$APPLICATION_JAR_NAME

cp $DEPLOY_PATH $APPLICATION_JAR

echo "> �������� ���ø����̼��� �����ϴ� ��� ����"
pgrep -f $APPLICATION_JAR_NAME | xargs kill

echo "> $APPLICATION_JAR ����"
sudo -u ec2-user nohup java -jar $APPLICATION_JAR > /dev/null 2> /dev/null < /dev/null &
