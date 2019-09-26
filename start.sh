appName="pilot"
word="1"
echo "$word"
word=`docker ps -a -q --no-trunc --filter name=^/"$appName"$`
echo "$word"
if [ -z "$word" ];
then
    echo "해당 컨테이너가 존재하지 않아 실행-------------------------------------"
elif [ -n "$word" ];
then
    echo "해당 컨테이너가 존재하여 정지시키고 삭제--------------------------------"
    /usr/bin/docker stop "$word"
    /usr/bin/docker rm "$word"
elif [ "$word" == "1" ];
then
    echo "컨테이너 에러로 종료하고 삭제------------------------------------------"
    /usr/bin/docker stop "$word"
    /usr/bin/docker rm "$word"
fi
/home/centos/apache-maven-3.6.2/binmvn clean package -P spring-boot docker:build
/usr/bin/docker run -p 8761:8761 -d --name "$appName" "$appName":latest
