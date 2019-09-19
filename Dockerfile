FROM python:3.6-slim

LABEL maintainer="FAF Community"
LABEL version="0.0.1"
LABEL description="Exe uploader"

EXPOSE 13667

COPY . /var/exe-uploader
RUN apt-get update && apt-get install -y git && \
    pip3 install pipenv && \
    cd /var/exe-uploader && pipenv install --deploy --system && \
    apt-get remove -y git python3-pip && \
    apt-get autoremove -y && \
    chmod u+x /var/exe-uploader/run.sh

CMD /var/exe-uploader/run.sh
