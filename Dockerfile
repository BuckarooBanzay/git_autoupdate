FROM alpine:3.12.1

# prepare minute job dir for crond
RUN mkdir /etc/periodic/minute
RUN echo "* * * * * run-parts /etc/periodic/minute" >> /etc/crontabs/root

# add deps
RUN apk add git

# add local files
COPY ./entrypoint.sh /entrypoint.sh
COPY ./jobs/update.sh /etc/periodic/minute/update
RUN chmod 755 /etc/periodic/minute/update

CMD ["/entrypoint.sh"]
