#!/bin/bash
DEPLOY_PATH=$(ls /tmp/*.jar)
echo "deploy_path: $DEPLOY_PATH"
JAR_NAME=$(basename $DEPLOY_PATH)
echo "> build file name : $JAR_NAME"

echo "> gs-spring-boot-initial-0.0.1-SNAPSHOT.jar Changed.."
APPLICATION_HOME=/home/ec2-user/
APPLICATION_JAR_NAME=gs-spring-boot-initial-0.0.1-SNAPSHOT.jar
APPLICATION_JAR=$APPLICATION_HOME$APPLICATION_JAR_NAME

cp $DEPLOY_PATH $APPLICATION_JAR

echo "> stop application if running.."
pgrep -f $APPLICATION_JAR_NAME | xargs kill

echo "> $APPLICATION_JAR deploy"
sudo -u ec2-user nohup java -jar $APPLICATION_JAR > /dev/null 2> /dev/null < /dev/null &
