FROM alpine:3.18

RUN apk add --update --no-cache vsftpd ncftp

COPY config/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY config/vsftpd.conf /etc/vsftpd.conf

ARG FTP_USER
ARG FTP_PASS
ARG FTP_HOME

#RUN addgroup -g ${GID} -S ${FTP_USER}

#RUN adduser -D -G ${FTP_USER} -h ${FTP_HOME} -s /bin/false -u ${UID} ${FTP_USER}

RUN mkdir -p ${FTP_HOME} && chown -R ${FTP_USER}:${FTP_USER} ${FTP_HOME}
RUN echo "${FTP_USER}:${FTP_PASS}" | chpasswd

ENTRYPOINT ["vsftpd"]
