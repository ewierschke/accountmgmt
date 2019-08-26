{%- if salt.pillar.get('accountmgmt:lookup:ad_notify_passwd_expire') %}
passwd_notify_install_packages:
  pkg.installed:
    - names:
      - git
      - php
      - php-ldap

gitproj:
  git.latest:
    - name: https://github.com/ewierschke/ad-password-expire-notify
    - target: /usr/local/bin/ad-password-expire-notify
    - rev: accountmgmt

env_adjust_mode:
  file.managed:
    - name: /usr/local/bin/ad-password-expire-notify/envadjust.sh
    - mode: 700
    - replace: False

execute_env_adjust:
  cmd.run:
    - name: /usr/local/bin/ad-password-expire-notify/envadjust.sh

#/etc/cron.d/ad-password-expire-notify:
#  cron.present:
#    - name: /usr/bin/php /usr/local/bin/ad-password-expire-notify/check_expire.php -o \"${OUPATH}\"
#    - minute: 0
#    - hour: 12
#    - identifier: inotify-job

createdailynotifycronjob:
  cmd.run:
    - name: export OUPATH=$(cat /usr/local/bin/oupath) && eval echo '0 12 \* \* \* root /usr/bin/php /usr/local/bin/ad-password-expire-notify/check_expire.php -o \"${OUPATH}\"' > /etc/cron.d/ad-password-expire-notify

daily_notify_cron_mode:
  file.managed:
    - name: /etc/cron.d/ad-password-expire-notify
    - mode: 600
    - replace: False

test_run_mode:
  file.managed:
    - name: /usr/local/bin/ad-password-expire-notify/expiretestrun.sh
    - mode: 700
    - replace: False

execute_test_run:
  cmd.run:
    - name: /usr/local/bin/ad-password-expire-notify/expiretestrun.sh
{% endif %}