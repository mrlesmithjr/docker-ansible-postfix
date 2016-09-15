#!/bin/ash

if [ ! -n "$POSTFIX_RELAYHOST" -a ! -n "$POSTFIX_REWRITE_DOMAIN" ]; then
ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
--extra-vars "postfix_conf_dir=$POSTFIX_CONF_DIR \
postfix_mynetworks='$POSTFIX_MYNETWORKS'"
fi

if [ -n "$POSTFIX_RELAYHOST" -a ! -n "$POSTFIX_REWRITE_DOMAIN" ]; then
ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
--extra-vars "postfix_conf_dir=$POSTFIX_CONF_DIR \
postfix_mynetworks='$POSTFIX_MYNETWORKS' postfix_relayhost=$POSTFIX_RELAYHOST"
fi

if [ ! -n "$POSTFIX_RELAYHOST" -a -n "$POSTFIX_REWRITE_DOMAIN" ]; then
ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
--extra-vars "postfix_conf_dir=$POSTFIX_CONF_DIR \
postfix_mynetworks='$POSTFIX_MYNETWORKS' postfix_rewrite_domain=$POSTFIX_REWRITE_DOMAIN"
fi

if [ -n "$POSTFIX_RELAYHOST" -a -n "$POSTFIX_REWRITE_DOMAIN" ]; then
ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
--extra-vars "postfix_conf_dir=$POSTFIX_CONF_DIR \
postfix_mynetworks='$POSTFIX_MYNETWORKS' postfix_relayhost=$POSTFIX_RELAYHOST \
postfix_rewrite_domain=$POSTFIX_REWRITE_DOMAIN"
fi

exec supervisord -n

# start postfix
#/usr/sbin/service postfix start

# wait for startup
#sleep 10

# watch for postfix exit
#while kill -0 $(pidof master) 2>/dev/null; do
#	sleep 1
#done
