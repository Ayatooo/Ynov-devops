FROM wordpress:cli-2.7.1-php8.0

ENV WP_URL="localhost:1234" \
    WP_USER=admin \
    WP_PASSWORD=password \
    WP_EMAIL=zebou@loux.com \
    WP_TITLE=Devops \
    WP_DESCRIPTION="Voici une desciption custom tah les fous" \
    WP_DEBUG=true \
    WP_THEME=twentynineteen \
    WP_PLUGINS="leaflet-map quote-tweet"

# copy install script with permissions
COPY docker-install.sh /usr/local/bin/
USER root
RUN chmod 755 /usr/local/bin/docker-install.sh
RUN mv /usr/local/bin/wp /usr/local/bin/_wp && \
  echo -e '#!/bin/sh\n_wp --allow-root "$@"' > /usr/local/bin/wp && \
  chmod +x /usr/local/bin/wp

CMD [ "docker-install.sh" ]