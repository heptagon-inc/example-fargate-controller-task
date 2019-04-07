FROM amazonlinux:2

ADD task1.sh /opt/

CMD ["/opt/task1.sh"]
