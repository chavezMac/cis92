FROM docker.io/ubuntu:20.04
 
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt install -y python3-pip tzdata
RUN python3 -m pip install django

COPY app/ /app

WORKDIR /app

RUN django-admin startproject mysite

RUN mv entrypoint.sh mysite/
WORKDIR /app/mysite
RUN chmod 744 entrypoint.sh

ENTRYPOINT ["/bin/bash"]
CMD ["./entrypoint.sh"]


