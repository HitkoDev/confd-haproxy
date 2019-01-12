FROM haproxy

WORKDIR /

ADD ./confd /usr/bin/confd
ADD ./config /etc/confd
ADD ./entrypoint.sh /entrypoint.sh
ADD ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
RUN chmod a+x /usr/bin/confd /entrypoint.sh

EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/entrypoint.sh"]
CMD ["confd"]
