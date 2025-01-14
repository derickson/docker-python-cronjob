FROM python:3.6
RUN apt-get update && apt-get -y install cron vim pip
RUN python3 -m pip install --user --upgrade pip
WORKDIR /app
COPY crontab /etc/cron.d/crontab
COPY hello.py /app/hello.py
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab

# run crond as main process of container
CMD ["cron", "-f"]
# CMD /bin/sh


