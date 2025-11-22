# [Stage 1] Build 단계: Maven을 이용해 WAR 파일 생성
FROM maven:3.8-openjdk-8 AS build
WORKDIR /app

# 프로젝트 파일 복사 (pom.xml과 src 폴더)
COPY pom.xml .
COPY src ./src

# Maven으로 빌드 실행 (테스트 건너뛰고 패키징)
RUN mvn clean package -DskipTests

# [Stage 2] Run 단계: Tomcat으로 실행
FROM tomcat:9.0-jdk8-corretto

# 기존 톰캣 기본 앱 삭제
RUN rm -rf /usr/local/tomcat/webapps/*

# Stage 1에서 만든 WAR 파일을 가져와서 ROOT.war로 복사
# (target 폴더에 있는 .war로 끝나는 파일을 자동으로 찾아서 복사함)
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# 톰캣 실행
CMD ["catalina.sh", "run"]