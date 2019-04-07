FROM amazonlinux:2

ADD task1.sh /opt/

RUN chmod +x /opt/task1.sh && yum install -y awscli

CMD ["/opt/task1.sh"]
