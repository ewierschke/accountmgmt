get_sasl_password:
  cmd.run:
    - name: aws s3 cp s3://{{ salt.pillar.get('accountmgmt:lookup:config_bucket') }}/sasl_passwd /etc/postfix/sasl_passwd

change_sasl_permissions:
  file.managed:
    - name: /etc/postfix/sasl_passwd
    - mode: 600
    - replace: False

get_postfix_config_script:
  cmd.run:
    - name: aws s3 cp s3://{{ salt.pillar.get('accountmgmt:lookup:config_bucket') }}/postfix_conf.sh /usr/local/bin/postfix_conf.sh

change_postfix_config_permissions:
  file.managed:
    - name: /usr/local/bin/postfix_conf.sh
    - mode: 700
    - replace: False

temporary_sleep_for_postfix:
  cmd.run:
    - name: sleep 5

execute_postfix_config_script:
  cmd.run:
    - name: /usr/local/bin/postfix_conf.sh

postmap_sasl:
  cmd.run:
    - name: postmap /etc/postfix/sasl_passwd

selinux_java_tolcl_postfix:
  cmd.run:
    - name: setsebool -P nis_enabled 1

start_postfix_service:
  service.running:
    - name: postfix
    - enable: True

get_ses_rotate_script:
  cmd.run:
    - name: wget -O /usr/local/bin/rotatesescredsforiamuser.sh https://raw.githubusercontent.com/ewierschke/secrets_manager_ad_pass/master/rotatesescredsforiamuser.sh

run_ses_rotate_script:
  cmd.run:
    - name: bash /usr/local/bin/rotatesescredsforiamuser.sh -A {{ salt.pillar.get('accountmgmt:lookup:adminemailto') }} -D {{ salt.pillar.get('accountmgmt:lookup:mailfromdomain') }} -U {{ salt.pillar.get('accountmgmt:lookup:sesiamusername') }}