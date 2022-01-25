FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y wget gnupg lsb-release 

RUN wget -qO- https://apt.hyperion-project.org/hyperion.pub.key | gpg --dearmor -o /usr/share/keyrings/hyperion.pub.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/hyperion.pub.gpg] https://apt.hyperion-project.org/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hyperion.list

RUN apt-get update && apt-get install -y hyperion

ENTRYPOINT ["hyperiond", "--userdata", "/etc/hyperion"]
