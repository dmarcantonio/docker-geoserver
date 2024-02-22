#!/bin/bash

source /scripts/functions.sh

if [ -z "${ENABLE_JSONP}" ]; then
    ENABLE_JSONP=true
fi
log ENABLE_JSONP="${ENABLE_JSONP}"

if [ -z "${MAX_FILTER_RULES}" ]; then
  MAX_FILTER_RULES=20
fi
log MAX_FILTER_RULES="${MAX_FILTER_RULES}"

if [ -z "${OPTIMIZE_LINE_WIDTH}" ]; then
  OPTIMIZE_LINE_WIDTH=false
fi
log OPTIMIZE_LINE_WIDTH="${OPTIMIZE_LINE_WIDTH}"

if [ -z "${WMS_DIR_INTEGRATION}" ]; then
  WMS_DIR_INTEGRATION=false
fi

if [ -z "${REQUIRE_TILED_PARAMETER}" ]; then
  REQUIRE_TILED_PARAMETER=true
fi


if [ -z "${WMSC_ENABLED}" ]; then
  WMSC_ENABLED=true
fi

if [ -z "${DISKQUOTA_DISABLED}" ]; then
  DISKQUOTA_DISABLED=false
fi



if [ -z "${TMS_ENABLED}" ]; then
  TMS_ENABLED=true
fi


if [ -z "${SECURITY_ENABLED}" ]; then
  SECURITY_ENABLED=false
fi

if [ -z "${DISK_QUOTA_SIZE}" ]; then
  DISK_QUOTA_SIZE=20
fi
log DISK_QUOTA_SIZE="${DISK_QUOTA_SIZE}"

if [ -z "${DISK_QUOTA_FREQUENCY}" ]; then
  DISK_QUOTA_FREQUENCY=5
fi

if [ -z "${POSTGRES_SCHEMA}" ]; then
    POSTGRES_SCHEMA=public
fi

if [ -z "${SSL}" ]; then
  SSL=false
fi
log SSL="${SSL}"

if [ -z "${TOMCAT_EXTRAS}" ]; then
  TOMCAT_EXTRAS=true
fi
log TOMCAT_EXTRAS="${TOMCAT_EXTRAS}"

if [ -z "${ROOT_WEBAPP_REDIRECT}" ]; then
  ROOT_WEBAPP_REDIRECT=false
fi
log ROOT_WEBAPP_REDIRECT="${ROOT_WEBAPP_REDIRECT}"

if [ -z "${HTTP_PORT}" ]; then
  HTTP_PORT=8080
fi
log HTTP_PORT="${HTTP_PORT}"

if [ -z "${HTTP_PROXY_NAME}" ]; then
  HTTP_PROXY_NAME=
fi
log HTTP_PROXY_NAME="${HTTP_PROXY_NAME}"

if [ -z "${HTTP_PROXY_PORT}" ]; then
  HTTP_PROXY_PORT=
fi
log HTTP_PROXY_PORT="${HTTP_PROXY_PORT}"

if [ -z "${HTTP_SCHEME}" ]; then
  HTTP_SCHEME=http
fi
log HTTP_SCHEME="${HTTP_SCHEME}"

if [ -z "${HTTPS_SCHEME}" ]; then
  HTTPS_SCHEME=https
fi
log HTTPS_SCHEME="${HTTPS_SCHEME}"

if [ -z "${HTTP_REDIRECT_PORT}" ]; then
  HTTP_REDIRECT_PORT=
fi
log HTTP_REDIRECT_PORT="${HTTP_REDIRECT_PORT}"

if [ -z "${HTTP_CONNECTION_TIMEOUT}" ]; then
  HTTP_CONNECTION_TIMEOUT=20000
fi
log HTTP_CONNECTION_TIMEOUT="${HTTP_CONNECTION_TIMEOUT}"

if [ -z "${HTTPS_PORT}" ]; then
  HTTPS_PORT=8443
fi
log HTTPS_PORT="${HTTPS_PORT}"

if [ -z "${HTTPS_MAX_THREADS}" ]; then
  HTTPS_MAX_THREADS=150
fi
log HTTPS_MAX_THREADS="${HTTPS_MAX_THREADS}"

if [ -z "${HTTPS_CLIENT_AUTH}" ]; then
  HTTPS_CLIENT_AUTH=
fi
log HTTPS_CLIENT_AUTH="${HTTPS_CLIENT_AUTH}"

if [ -z "${HTTPS_PROXY_NAME}" ]; then
  HTTPS_PROXY_NAME=
fi
log HTTPS_PROXY_NAME="${HTTPS_PROXY_NAME}"

if [ -z "${HTTPS_PROXY_PORT}" ]; then
  HTTPS_PROXY_PORT=
fi
log HTTPS_PROXY_PORT="${HTTPS_PROXY_PORT}"

if [ -z "${JKS_FILE}" ]; then
  JKS_FILE=letsencrypt.jks
fi
log JKS_FILE="${JKS_FILE}"

file_env 'JKS_KEY_PASSWORD'
if [ -z "${JKS_KEY_PASSWORD}" ]; then
  JKS_KEY_PASSWORD='geoserver'
fi
log JKS_KEY_PASSWORD="${JKS_KEY_PASSWORD}"

if [ -z "${KEY_ALIAS}" ]; then
  KEY_ALIAS=letsencrypt
fi
log KEY_ALIAS="${KEY_ALIAS}"

file_env 'JKS_STORE_PASSWORD'
if [ -z "${JKS_STORE_PASSWORD}" ]; then
    JKS_STORE_PASSWORD='geoserver'
fi
log JKS_STORE_PASSWORD="${JKS_STORE_PASSWORD}"

if [ -z "${P12_FILE}" ]; then
    P12_FILE=letsencrypt.p12
fi
log P12_FILE="${P12_FILE}"

file_env 'PKCS12_PASSWORD'
if [ -z "${PKCS12_PASSWORD}" ]; then
    PKCS12_PASSWORD='geoserver'
fi
log PKCS12_PASSWORD="${PKCS12_PASSWORD}"


if [ -z "${ENCODING}" ]; then
    ENCODING='UTF8'
fi
log ENCODING="${ENCODING}"

if [ -z "${TIMEZONE}" ]; then
    TIMEZONE='GMT'
fi
log TIMEZONE="${TIMEZONE}"

if [ -z "${LANGUAGE}" ]; then
    LANGUAGE='en'
fi
log LANGUAGE="${LANGUAGE}"

if [ -z "${REGION}" ]; then
    REGION='US'
fi
log REGION="${REGION}"

if [ -z "${COUNTRY}" ]; then
    COUNTRY='US'
fi
log COUNTRY="${COUNTRY}"

if [ -z "${CHARACTER_ENCODING}" ]; then
    CHARACTER_ENCODING='UTF-8'
fi
log CHARACTER_ENCODING="${CHARACTER_ENCODING}"

if [ -z "${CLUSTERING}" ]; then
    CLUSTERING=false
fi
log CLUSTERING="${CLUSTERING}"

if [ -z "${CLUSTER_DURABILITY}" ]; then
    CLUSTER_DURABILITY=true
fi
log CLUSTER_DURABILITY="${CLUSTER_DURABILITY}"

if [ -z "${BROKER_URL}" ]; then
    BROKER_URL=
fi
log BROKER_URL="${BROKER_URL}"

if [ -z "${READONLY}" ]; then
    READONLY=disabled
fi
log READONLY="${READONLY}"


if [ -z "${TOGGLE_MASTER}" ]; then
    TOGGLE_MASTER=true
fi
log TOGGLE_MASTER="${TOGGLE_MASTER}"

if [ -z "${TOGGLE_SLAVE}" ]; then
    TOGGLE_SLAVE=true
fi
log TOGGLE_SLAVE="${TOGGLE_SLAVE}"

if [ -z "${EMBEDDED_BROKER}" ]; then
    EMBEDDED_BROKER=enabled
fi
log EMBEDDED_BROKER="${EMBEDDED_BROKER}"

if [ -z "${CLUSTER_CONNECTION_RETRY_COUNT}" ]; then
    CLUSTER_CONNECTION_RETRY_COUNT=10
fi
log CLUSTER_CONNECTION_RETRY_COUNT="${CLUSTER_CONNECTION_RETRY_COUNT}"

if [ -z "${CLUSTER_CONNECTION_MAX_WAIT}" ]; then
    CLUSTER_CONNECTION_MAX_WAIT=500
fi
log CLUSTER_CONNECTION_MAX_WAIT="${CLUSTER_CONNECTION_MAX_WAIT}"

if [ -z "${DB_BACKEND}" ]; then
    DB_BACKEND=
fi
log DB_BACKEND="${DB_BACKEND}"

if [ -z "${LOGIN_STATUS}" ]; then
    LOGIN_STATUS=on
fi
log LOGIN_STATUS="${LOGIN_STATUS}"

if [ -z "${DISABLE_WEB_INTERFACE}" ]; then
    DISABLE_WEB_INTERFACE=false
fi
log DISABLE_WEB_INTERFACE="${DISABLE_WEB_INTERFACE}"

if [ -z "${RECREATE_DATADIR}" ]; then
    RECREATE_DATADIR=false
fi
log RECREATE_DATADIR="${RECREATE_DATADIR}"

if [ -z "${RECREATE_DISKQUOTA}" ]; then
    RECREATE_DISKQUOTA=false
fi

if [ -z "${RESET_ADMIN_CREDENTIALS}" ]; then
  RESET_ADMIN_CREDENTIALS=false
fi
log RESET_ADMIN_CREDENTIALS="${RESET_ADMIN_CREDENTIALS}"

if [ -z "${INITIAL_MEMORY}" ]; then
    INITIAL_MEMORY="2G"
fi
log INITIAL_MEMORY="${INITIAL_MEMORY}"

if [ -z "${MAXIMUM_MEMORY}" ]; then
    MAXIMUM_MEMORY="4G"
fi
log MAXIMUM_MEMORY="${MAXIMUM_MEMORY}"

if [ -z "${XFRAME_OPTIONS}" ]; then
    XFRAME_OPTIONS=true
fi
log XFRAME_OPTIONS="${XFRAME_OPTIONS}"

if [ -z "${REQUEST_TIMEOUT}" ]; then
    REQUEST_TIMEOUT=60
fi
log REQUEST_TIMEOUT="${REQUEST_TIMEOUT}"

if [ -z "${PARALLEL_REQUEST}" ]; then
    PARALLEL_REQUEST=100
fi
log PARALLEL_REQUEST="${PARALLEL_REQUEST}"

if [ -z "${GETMAP}" ]; then
    GETMAP=10
fi
log GETMAP="${GETMAP}"

if [ -z "${REQUEST_EXCEL}" ]; then
    REQUEST_EXCEL=4
fi
log REQUEST_EXCEL="${REQUEST_EXCEL}"

if [ -z "${SINGLE_USER}" ]; then
    SINGLE_USER=6
fi
log SINGLE_USER="${SINGLE_USER}"

if [ -z "${GWC_REQUEST}" ]; then
    GWC_REQUEST=16
fi
log GWC_REQUEST="${GWC_REQUEST}"

if [ -z "${WPS_REQUEST}" ]; then
    WPS_REQUEST='1000/d;30s'
fi
log WPS_REQUEST="${WPS_REQUEST}"

if [ -z "${S3_SERVER_URL}" ]; then
    S3_SERVER_URL=''
fi
log S3_SERVER_URL="${S3_SERVER_URL}"

file_env 'S3_USERNAME'
if [ -z "${S3_USERNAME}" ]; then
    S3_USERNAME=''
fi
log S3_USERNAME="${S3_USERNAME}"

file_env 'S3_PASSWORD'
if [ -z "${S3_PASSWORD}" ]; then
    S3_PASSWORD=''
fi
log S3_PASSWORD="${S3_PASSWORD}"

if [ -z "${SAMPLE_DATA}" ]; then
    SAMPLE_DATA=false
fi
log SAMPLE_DATA="${SAMPLE_DATA}"

if [ -z "${GEOSERVER_FILEBROWSER_HIDEFS}" ]; then
    GEOSERVER_FILEBROWSER_HIDEFS=false
fi
log GEOSERVER_FILEBROWSER_HIDEFS="${GEOSERVER_FILEBROWSER_HIDEFS}"

if [ -z "${PROXY_BASE_URL_PARAMETRIZATION}" ]; then
    PROXY_BASE_URL_PARAMETRIZATION=false
fi
log PROXY_BASE_URL_PARAMETRIZATION="${PROXY_BASE_URL_PARAMETRIZATION}"

if [ -z "${GEOSERVER_LEVEL}" ]; then
    GEOSERVER_LEVEL=DEFAULT_LOGGING
fi
log GEOSERVER_LEVEL="${GEOSERVER_LEVEL}"


if [ -z "${ACTIVATE_ALL_COMMUNITY_EXTENSIONS}" ]; then
    ACTIVATE_ALL_COMMUNITY_EXTENSIONS=false
fi
log ACTIVATE_ALL_COMMUNITY_EXTENSIONS="${ACTIVATE_ALL_COMMUNITY_EXTENSIONS}"

if [ -z "${ACTIVATE_ALL_STABLE_EXTENSIONS}" ]; then
    ACTIVATE_ALL_STABLE_EXTENSIONS=false
fi
log ACTIVATE_ALL_STABLE_EXTENSIONS="${ACTIVATE_ALL_STABLE_EXTENSIONS}"

file_env 'TOMCAT_PASSWORD'
log TOMCAT_PASSWORD="${TOMCAT_PASSWORD}"

file_env 'TOMCAT_USER'
if [ -z "${TOMCAT_USER}" ]; then
    TOMCAT_USER='tomcat'
fi
log TOMCAT_USER="${TOMCAT_USER}"


if [ -z "${GEOSERVER_ADMIN_USER}" ]; then
    GEOSERVER_ADMIN_USER='admin'
fi
log GEOSERVER_ADMIN_USER="${GEOSERVER_ADMIN_USER}"

file_env 'GEOSERVER_ADMIN_PASSWORD'
log GEOSERVER_ADMIN_PASSWORD="${GEOSERVER_ADMIN_PASSWORD}"

if [ -z "${CSRF_WHITELIST}" ]; then
    CSRF_WHITELIST=
fi
log CSRF_WHITELIST="${CSRF_WHITELIST}"

if [ -z "${INITIAL_HEAP_OCCUPANCY_PERCENT}" ]; then
    INITIAL_HEAP_OCCUPANCY_PERCENT=45
fi
log INITIAL_HEAP_OCCUPANCY_PERCENT="${INITIAL_HEAP_OCCUPANCY_PERCENT}"

if [ -z "${ADDITIONAL_JAVA_STARTUP_OPTIONS}" ]; then
    ADDITIONAL_JAVA_STARTUP_OPTIONS=''
fi
log ADDITIONAL_JAVA_STARTUP_OPTIONS="${ADDITIONAL_JAVA_STARTUP_OPTIONS}"

if [ -z "${CSRF_WHITELIST}" ]; then
    CSRF_WHITELIST=
fi
log CSRF_WHITELIST="${CSRF_WHITELIST}"

if [ -z "${POSTGRES_JNDI}" ]; then
    POSTGRES_JNDI=false
fi
log POSTGRES_JNDI="${POSTGRES_JNDI}"

if [ -z "${SSL_MODE}" ]; then
    SSL_MODE=disable
fi
log SSL_MODE="${SSL_MODE}"

if [ -z ${HASHING_ALGORITHM} ];then
    HASHING_ALGORITHM='SHA-256'
fi
log HASHING_ALGORITHM="${HASHING_ALGORITHM}"

if [ -z "${USE_DATETIME_IN_SHAPEFILE}" ]; then
    USE_DATETIME_IN_SHAPEFILE=true
fi
log USE_DATETIME_IN_SHAPEFILE="${USE_DATETIME_IN_SHAPEFILE}"

if [ -z "${FORCE_DOWNLOAD_STABLE_EXTENSIONS}" ]; then
    FORCE_DOWNLOAD_STABLE_EXTENSIONS=false
fi
log FORCE_DOWNLOAD_STABLE_EXTENSIONS="${FORCE_DOWNLOAD_STABLE_EXTENSIONS}"

if [ -z "${FORCE_DOWNLOAD_COMMUNITY_EXTENSIONS}" ]; then
    FORCE_DOWNLOAD_COMMUNITY_EXTENSIONS=false
fi
log FORCE_DOWNLOAD_COMMUNITY_EXTENSIONS="${FORCE_DOWNLOAD_COMMUNITY_EXTENSIONS}"

if [ -z "${DISABLE_CORS}" ]; then
  DISABLE_CORS=false
fi

if [ -z "${DISABLE_SECURITY_FILTER}" ]; then
  DISABLE_SECURITY_FILTER=false
fi
if [ -z "${ACTIVATE_PROXY_HEADERS}" ]; then
  ACTIVATE_PROXY_HEADERS=false
fi

if [ -z "${UPDATE_LOGGING_PROFILES}" ]; then
  UPDATE_LOGGING_PROFILES=false
fi

if [ -z "${RELINQUISH_LOG4J_CONTROL}" ]; then
  RELINQUISH_LOG4J_CONTROL=false
fi

if [ -z "${USE_DEFAULT_CREDENTIALS}" ]; then
  USE_DEFAULT_CREDENTIALS=false
fi

if [ -z "${CHOWN_DATA_DIR}" ]; then
  CHOWN_DATA_DIR=true
fi

if [ -z "${CHOWN_GWC_DATA_DIR}" ]; then
  CHOWN_GWC_DATA_DIR=true
fi

if [ -z "${GEOSERVER_CONTEXT_ROOT}" ]; then
  # For runtime only, do not change at build-time.
  GEOSERVER_CONTEXT_ROOT=geoserver
fi

if [ -z "${SHOW_PASSWORD}" ]; then
  # For runtime only, do not change at build-time.
  SHOW_PASSWORD=true
fi

if [ -z "${RUN_AS_ROOT}" ]; then
  RUN_AS_ROOT=false
fi

if [ -z "${JDBC_CONFIG_ENABLED}" ]; then
  JDBC_CONFIG_ENABLED=true
fi

if [ -z "${JDBC_STORE_ENABLED}" ]; then
  JDBC_STORE_ENABLED=true
fi

if [ -z "${JDBC_IGNORE_PATHS}" ]; then
  JDBC_IGNORE_PATHS='data,jdbcstore,jdbcconfig,temp,tmp,logs'
fi
