FROM alpine:3.18

ARG FTP_USER
ARG FTP_PASS
ARG FTP_HOME

RUN apk add --update --no-cache vsftpd\
	&& mkdir -p ${FTP_HOME}\
	&& addgroup -S ${FTP_USER} || echo "Group ${FTP_USER} already exist"\
	&& adduser -S -D -h ${FTP_HOME} -G ${FTP_USER} ${FTP_USER} || echo "User ${FTP_USER} already exist"\
	&& chown -R ${FTP_USER}:${FTP_USER} ${FTP_HOME}\
	&& echo "${FTP_USER}:${FTP_PASS}" | chpasswd

ADD config/vsftpd.conf /etc/vsftpd/vsftpd.conf
# ADD config/vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT ["vsftpd"]
