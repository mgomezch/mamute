#!/bin/bash


cat > 'WEB-INF/classes/production/hibernate.cfg.xml' <<EOF
<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE hibernate-configuration PUBLIC
  "-//Hibernate/Hibernate Configuration DTD//EN"
  "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
  <session-factory>
    <property name="connection.url">jdbc:mysql://${MAMUTE_DB_HOST}:${MAMUTE_DB_PORT}/${MAMUTE_DB_NAME}</property>
    <property name="connection.driver_class">com.mysql.jdbc.Driver</property>
    <property name="dialect">org.hibernate.dialect.MySQL5InnoDBDialect</property>
    <property name="connection.username">${MAMUTE_DB_USERNAME}</property>
    <property name="connection.password">${MAMUTE_DB_PASSWORD}</property>
    <property name="show_sql">${MAMUTE_DB_SHOW_SQL}</property>
    <property name="format_sql">${MAMUTE_DB_FORMAT_SQL}false</property>
    <property name="hibernate.cache.region.factory_class">org.hibernate.cache.ehcache.EhCacheRegionFactory</property>
    <property name="hibernate.cache.use_query_cache">false</property>
    <property name="hibernate.cache.use_second_level_cache">false</property>
    <property name="hibernate.generate_statistics">false</property>
    <property name="connection.provider_class">org.hibernate.service.jdbc.connections.internal.C3P0ConnectionProvider</property>
    <property name="c3p0.acquire_increment">1</property>
    <property name="c3p0.idle_test_period">100</property>
    <property name="c3p0.max_size">100</property>
    <property name="c3p0.min_size">10</property>
    <property name="c3p0.timeout">100</property>
  </session-factory>
</hibernate-configuration>
EOF


cat > 'WEB-INF/classes/production.properties' <<EOF
host = https://${MAMUTE_HOST}:${MAMUTE_PORT}
home.url = ${MAMUTE_HOME_URL}
mail_logo_url = http://${MAMUTE_HOST}:${MAMUTE_PORT}/imgs/logo-mail.png
use.routes.parser.hack = ${MAMUTE_USE_ROUTE_PARSER_HACK}
feature.auth.db = ${MAMUTE_AUTH_DB}
feature.facebook.login = ${MAMUTE_FACEBOOK_LOGIN}
feature.solr = ${MAMUTE_FEATURE_SOLR}
feature.signup = ${MAMUTE_FEATURE_SIGNUP}
deletable.questions = ${MAMUTE_DELETABLE_QUESTIONS}
attachments.root.fs.path = ${MAMUTE_ATTACHMENTS_ROOT_FS_PATH}

vraptor.simplemail.main.server = ${MAMUTE_MAIL_SERVER}
vraptor.simplemail.main.port = ${MAMUTE_MAIL_PORT}
vraptor.simplemail.main.tls = ${MAMUTE_MAIL_USE_TLS}
vraptor.simplemail.main.username = ${MAMUTE_MAIL_USERNAME}
vraptor.simplemail.main.password = ${MAMUTE_MAIL_PASSWORD}

vraptor.errorcontrol.error.subject = Mamute error
vraptor.simplemail.main.from = ${MAMUTE_MAIL_FROM}
vraptor.simplemail.main.from.name = ${MAMUTE_MAIL_FROM_NAME}

feature.google.login = ${MAMUTE_GOOGLE_AUTH}
google.redirect_uri = /sign-up/google/
google.client_id = ${MAMUTE_GOOGLE_LOGIN_CLIENT_ID}
google.client_secret = ${MAMUTE_GOOGLE_LOGIN_CLIENT_SECRET}
EOF


exec './run.sh' "${@}"
