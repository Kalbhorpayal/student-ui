FROM ubuntu as builder
RUN apt-get update && apt-get install -y java-11-amazon-corretto-devel.x86_64 && apt-get install maven -y 
COPY . /mnt/student-ui/.
WORKDIR /mnt/student-ui
RUN mvn package

FROM tomcat 
COPY --from=builder /mnt/student-ui/target/*.war webapps/.
