FROM haproxy

WORKDIR /

ADD ./confd /usr/bin/confd
ADD ./config /etc/confd
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /usr/bin/confd /entrypoint.sh

EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD ["cat", "/var/run/haproxy.pid"]
CMD ["confd"]
