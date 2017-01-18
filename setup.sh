#!/bin/bash



export VRAPTOR_ENV="${VRAPTOR_ENV:-production}"

export MAMUTE_ADDRESS="${MAMUTE_ADDRESS:-http://localhost}"
export MAMUTE_PORT="${MAMUTE_PORT:-80}"
export PORT="${MAMUTE_PORT}"

export MAMUTE_DB_HOST="${MAMUTE_DB_HOST:-mysql}"
export MAMUTE_DB_PORT="${MAMUTE_DB_PORT:-3306}"
export MAMUTE_DB_USERNAME="${MAMUTE_DB_USERNAME:-mamute}"
export MAMUTE_DB_PASSWORD="${MAMUTE_DB_PASSWORD:-mamute}"
export MAMUTE_DB_NAME="${MAMUTE_DB_NAME:-mamute}"
export MAMUTE_DB_SHOW_SQL="${MAMUTE_DB_SHOW_SQL:-false}"
export MAMUTE_DB_FORMAT_SQL="${MAMUTE_DB_FORMAT_SQL:-false}"

export MAMUTE_MAIL_SERVER="${MAMUTE_MAIL_SERVER:-mail}"
export MAMUTE_MAIL_PORT="${MAMUTE_MAIL_PORT:-25}"
export MAMUTE_MAIL_USE_TLS="${MAMUTE_MAIL_USE_TLS:-false}"
export MAMUTE_MAIL_USERNAME="${MAMUTE_MAIL_USERNAME:-mail}"
export MAMUTE_MAIL_PASSWORD="${MAMUTE_MAIL_PASSWORD:-mail}"
export MAMUTE_MAIL_FROM="${MAMUTE_MAIL_FROM:-no-reply@mamute.example.com}"
export MAMUTE_MAIL_FROM_NAME="${MAMUTE_MAIL_FROM_NAME:-Mamute}"

export MAMUTE_ATTACHMENTS_ROOT_FS_PATH="${MAMUTE_ATTACHMENTS_ROOT_FS_PATH:-/var/lib/mamute/attachments}"
export MAMUTE_AUTH_DB="${MAMUTE_AUTH_DB:-true}"
export MAMUTE_DELETABLE_QUESTIONS="${MAMUTE_DELETABLE_QUESTIONS:-true}"
export MAMUTE_FEATURE_FACEBOOK_LOGIN="${MAMUTE_FACEBOOK_LOGIN:-false}"
export MAMUTE_FEATURE_GOOGLE_LOGIN="${MAMUTE_FEATURE_GOOGLE_LOGIN:-false}"
export MAMUTE_FEATURE_GOOGLE_SEARCH="${MAMUTE_FEATURE_GOOGLE_SEARCH:-false}"
export MAMUTE_FEATURE_LOGIN_REQUIRED="${MAMUTE_FEATURE_LOGIN_REQUIRED:-true}"
export MAMUTE_FEATURE_SIGNUP="${MAMUTE_FEATURE_SIGNUP:-false}"
export MAMUTE_FEATURE_SOLR="${MAMUTE_FEATURE_SOLR:-true}"
export MAMUTE_FEATURE_TAGS_MANDATORY="${MAMUTE_TAGS_MANDATORY:-true}"
export MAMUTE_GOOGLE_LOGIN_CLIENT_ID="${MAMUTE_GOOGLE_LOGIN_CLIENT_ID:-''}"
export MAMUTE_GOOGLE_LOGIN_CLIENT_SECRET="${MAMUTE_GOOGLE_LOGIN_CLIENT_SECRET:-''}"
export MAMUTE_HOME_URL="${MAMUTE_HOME_URL:-/}"
export MAMUTE_SOLR_EMBEDDED="${MAMUTE_SOLR_EMBEDDED:-true}"
export MAMUTE_USE_ROUTE_PARSER_HACK="${MAMUTE_USE_ROUTE_PARSER_HACK:-false}"

export MAMUTE_PERMISSION_RULE_CREATE_COMMENT="${MAMUTE_PERMISSION_RULE_CREATE_COMMENT:-0}"
export MAMUTE_PERMISSION_RULE_VOTE_UP="${MAMUTE_PERMISSION_RULE_VOTE_UP:-0}"
export MAMUTE_PERMISSION_RULE_VOTE_DOWN="${MAMUTE_PERMISSION_RULE_VOTE_DOWN:-0}"
export MAMUTE_PERMISSION_RULE_ANSWER_OWN_QUESTION="${MAMUTE_PERMISSION_RULE_ANSWER_OWN_QUESTION:-0}"
export MAMUTE_PERMISSION_RULE_CREATE_FLAG="${MAMUTE_PERMISSION_RULE_CREATE_FLAG:-0}"
export MAMUTE_PERMISSION_RULE_EDIT_QUESTION="${MAMUTE_PERMISSION_RULE_EDIT_QUESTION:-0}"
export MAMUTE_PERMISSION_RULE_EDIT_ANSWER="${MAMUTE_PERMISSION_RULE_EDIT_ANSWER:-0}"
export MAMUTE_PERMISSION_RULE_MODERATE_EDITS="${MAMUTE_PERMISSION_RULE_MODERATE_EDITS:-0}"
export MAMUTE_PERMISSION_RULE_INACTIVATE_QUESTION="${MAMUTE_PERMISSION_RULE_INACTIVATE_QUESTION:-0}"



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

attachments.root.fs.path = ${MAMUTE_ATTACHMENTS_ROOT_FS_PATH}
deletable.questions = ${MAMUTE_DELETABLE_QUESTIONS}
feature.auth.db = ${MAMUTE_AUTH_DB}
feature.facebook.login = ${MAMUTE_FEATURE_FACEBOOK_LOGIN}
feature.google_search = ${MAMUTE_FEATURE_GOOGLE_SEARCH}
feature.login.required = ${MAMUTE_FEATURE_LOGIN_REQUIRED}
feature.signup = ${MAMUTE_FEATURE_SIGNUP}
feature.solr = ${MAMUTE_FEATURE_SOLR}
feature.tags.mandatory = ${MAMUTE_FEATURE_TAGS_MANDATORY}
home.url = ${MAMUTE_HOME_URL}
host = ${MAMUTE_ADDRESS}
mail_logo_url = ${MAMUTE_ADDRESS}/imgs/logo-mail.png
solr.embedded = ${MAMUTE_SOLR_EMBEDDED}
use.routes.parser.hack = ${MAMUTE_USE_ROUTE_PARSER_HACK}

vraptor.simplemail.main.server = ${MAMUTE_MAIL_SERVER}
vraptor.simplemail.main.port = ${MAMUTE_MAIL_PORT}
vraptor.simplemail.main.tls = ${MAMUTE_MAIL_USE_TLS}
vraptor.simplemail.main.username = ${MAMUTE_MAIL_USERNAME}
vraptor.simplemail.main.password = ${MAMUTE_MAIL_PASSWORD}

vraptor.errorcontrol.error.subject = Mamute error
vraptor.simplemail.main.from = ${MAMUTE_MAIL_FROM}
vraptor.simplemail.main.from.name = ${MAMUTE_MAIL_FROM_NAME}

feature.google.login = ${MAMUTE_FEATURE_GOOGLE_LOGIN}
google.redirect_uri = /sign-up/google/
google.client_id = ${MAMUTE_GOOGLE_LOGIN_CLIENT_ID}
google.client_secret = ${MAMUTE_GOOGLE_LOGIN_CLIENT_SECRET}

permission.rule.create_comment = ${MAMUTE_PERMISSION_RULE_CREATE_COMMENT}
permission.rule.vote_up = ${MAMUTE_PERMISSION_RULE_VOTE_UP}
permission.rule.vote_down = ${MAMUTE_PERMISSION_RULE_VOTE_DOWN}
permission.rule.answer_own_question = ${MAMUTE_PERMISSION_RULE_ANSWER_OWN_QUESTION}
permission.rule.create_flag = ${MAMUTE_PERMISSION_RULE_CREATE_FLAG}
permission.rule.edit_question = ${MAMUTE_PERMISSION_RULE_EDIT_QUESTION}
permission.rule.edit_answer = ${MAMUTE_PERMISSION_RULE_EDIT_ANSWER}
permission.rule.moderate_edits = ${MAMUTE_PERMISSION_RULE_MODERATE_EDITS}
permission.rule.inactivate_question = ${MAMUTE_PERMISSION_RULE_INACTIVATE_QUESTION}

EOF


exec './run.sh' "${@}"
