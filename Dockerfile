#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
ARG IMAGE_VERSION=9.0-jdk11-openjdk-slim-bullseye
ARG JAVA_HOME=/usr/local/openjdk-11
FROM tomcat:$IMAGE_VERSION

LABEL maintainer="Tim Sutton<tim@linfiniti.com>"

ARG GS_VERSION=2.21.1
ARG WAR_URL=https://downloads.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/geoserver-${GS_VERSION}-war.zip
ARG STABLE_PLUGIN_BASE_URL=https://sonik.dl.sourceforge.net
ARG DOWNLOAD_ALL_STABLE_EXTENSIONS=1
ARG DOWNLOAD_ALL_COMMUNITY_EXTENSIONS=1
ARG HTTPS_PORT=8443

ARG GEOSERVER_UID=1000
ARG GEOSERVER_GID=10001
ARG USER=geoserveruser
ARG GROUP_NAME=geoserverusers

ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -r ${GROUP_NAME} -g ${GEOSERVER_GID}
RUN useradd -l -m -d /home/${USER}/ -u ${GEOSERVER_UID} --gid ${GEOSERVER_GID} -s /bin/bash -G ${GROUP_NAME} ${USER}

#Install extra fonts to use with sld font markers
RUN set -eux; \
    apt-get update; \
    apt-get -y install aptitude; \
    aptitude -y install \
        locales gnupg2 wget ca-certificates rpl pwgen software-properties-common  iputils-ping \
        apt-transport-https curl gettext fonts-cantarell lmodern ttf-aenigma \
        ttf-bitstream-vera ttf-sjfonts tv-fonts  libapr1-dev libssl-dev  \
        wget zip unzip curl xsltproc certbot  cabextract gettext postgresql-client figlet gosu; \
    # Install gdal3 - bullseye doesn't build libgdal-java anymore so we can't upgrade
    curl https://deb.meteo.guru/velivole-keyring.asc |  apt-key add - \
    && echo "deb https://deb.meteo.guru/debian buster main" > /etc/apt/sources.list.d/meteo.guru.list \
    && aptitude update \
    && aptitude -y install gdal-bin libgdal-java; \
    dpkg-divert --local --rename --add /sbin/initctl \
    && (echo "Yes, do as I say!" | aptitude remove login) \
    && aptitude clean \
    && rm -rf /var/lib/apt/lists/*; \
    # verify that the binary works
	gosu nobody true

ENV \
    JAVA_HOME=${JAVA_HOME} \
    DEBIAN_FRONTEND=noninteractive \
    GEOSERVER_DATA_DIR=/opt/geoserver/data_dir \
    GDAL_DATA=/usr/share/gdal \
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/tomcat/native-jni-lib:/usr/lib/jni:/usr/local/apr/lib:/opt/libjpeg-turbo/lib64:/usr/lib:/usr/lib/x86_64-linux-gnu" \
    FOOTPRINTS_DATA_DIR=/opt/footprints_dir \
    GEOWEBCACHE_CACHE_DIR=/opt/geoserver/data_dir/gwc \
    CERT_DIR=/etc/certs \
    RANDFILE=/etc/certs/.rnd \
    FONTS_DIR=/opt/fonts \
    GEOSERVER_HOME=/geoserver \
    EXTRA_CONFIG_DIR=/settings \
    COMMUNITY_PLUGINS_DIR=/community_plugins  \
    STABLE_PLUGINS_DIR=/stable_plugins


WORKDIR /scripts
ADD resources /tmp/resources
ADD build_data /build_data
ADD scripts /scripts

RUN groupadd -r ${GROUP_NAME} -g ${GEOSERVER_GID} && \
    useradd -l -m -d /home/${USER}/ -u ${GEOSERVER_UID} --gid ${GEOSERVER_GID} -s /bin/bash -G ${GROUP_NAME} ${USER}; \
    mkdir -p  ${GEOSERVER_DATA_DIR} ${CERT_DIR} ${FOOTPRINTS_DATA_DIR} ${FONTS_DIR} \
             ${GEOWEBCACHE_CACHE_DIR} ${GEOSERVER_HOME} ${EXTRA_CONFIG_DIR} ${COMMUNITY_PLUGINS_DIR} ${STABLE_PLUGINS_DIR}; \
    cp /build_data/stable_plugins.txt /stable_plugins && cp /build_data/community_plugins.txt /community_plugins && \
    cp /build_data/letsencrypt-tomcat.xsl ${CATALINA_HOME}/conf/ssl-tomcat.xsl; \
    echo $GS_VERSION > /scripts/geoserver_version.txt ;\
    chmod +x /scripts/*.sh;/scripts/setup.sh \
    && aptitude clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;chown -R ${USER_NAME}:${GEO_GROUP_NAME} \
    ${CATALINA_HOME} ${FOOTPRINTS_DATA_DIR} ${GEOSERVER_DATA_DIR} \
    ${CERT_DIR} ${FONTS_DIR}  /home/${USER_NAME}/ ${COMMUNITY_PLUGINS_DIR} ${STABLE_PLUGINS_DIR} \
    ${GEOSERVER_HOME} ${EXTRA_CONFIG_DIR}  /usr/share/fonts/ /scripts /tomcat_apps.zip \
    /tmp/ ${GEOWEBCACHE_CACHE_DIR};chmod o+rw ${CERT_DIR}

# RUN echo $GS_VERSION > /scripts/geoserver_version.txt ;\
#     chmod +x /scripts/*.sh;/scripts/setup.sh \
#     && aptitude clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE  $HTTPS_PORT


# Create directories
# RUN mkdir -p ${GEOSERVER_DATA_DIR} ${CERT_DIR} ${FOOTPRINTS_DATA_DIR} ${FONTS_DIR} ${GEOWEBCACHE_CACHE_DIR} \
# ${GEOSERVER_HOME} ${EXTRA_CONFIG_DIR}

RUN chmod g=u /etc/passwd

# RUN chgrp -R 0 ${CATALINA_HOME} ${FOOTPRINTS_DATA_DIR} ${GEOSERVER_DATA_DIR} \
#     ${CERT_DIR} ${FONTS_DIR}  /home/${USER_NAME}/ ${COMMUNITY_PLUGINS_DIR} ${STABLE_PLUGINS_DIR} \
#     ${GEOSERVER_HOME} ${EXTRA_CONFIG_DIR}  /usr/share/fonts/ /scripts /tomcat_apps.zip \
#     /tmp/ ${GEOWEBCACHE_CACHE_DIR};chmod o+rw ${CERT_DIR}

USER ${GEOSERVER_GID}:0
RUN echo 'figlet -t "Kartoza Docker GeoServer"' >> ~/.bashrc
# VOLUME ["${GEOSERVER_DATA_DIR}", "${CERT_DIR}", "${FOOTPRINTS_DATA_DIR}", "${FONTS_DIR}"]
WORKDIR ${GEOSERVER_HOME}

ENTRYPOINT ["/bin/bash", "/scripts/entrypoint.sh"]
