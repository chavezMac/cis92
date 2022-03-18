FROM docker.io/ubuntu:20.04
 
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt install -y python3-pip tzdata postgresql-client
RUN python3 -m pip install django psycopg2-binary

COPY app/ /app

WORKDIR /app

RUN mv entrypoint.sh mysite/
WORKDIR /app/mysite
RUN chmod 744 entrypoint.sh

ENTRYPOINT ["/bin/bash"]
CMD ["entrypoint.sh"]


