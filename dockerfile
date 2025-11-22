# 1. 베이스 이미지: Java 8이 포함된 Tomcat 9
FROM tomcat:9.0-jdk8-corretto

# 2. 기존의 불필요한 파일 삭제
RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/web-project2-2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# 4. 톰캣 실행
CMD ["catalina.sh", "run"]