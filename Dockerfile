FROM nginx

ENV VERSION=$PIWIK_VERSION

COPY nginx.conf /etc/nginx/nginx.conf
COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

