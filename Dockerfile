FROM photoprism/photoprism-arm64:20210128

RUN apt-get update

RUN apt-get install -y cron rsyslog

ENV WORKDIR /photoprism/cron

RUN mkdir -p ${WORKDIR}

ADD cron ${WORKDIR}

RUN chmod +x ${WORKDIR}/*.sh

RUN crontab ${WORKDIR}/crontab

CMD ${WORKDIR}/start.sh