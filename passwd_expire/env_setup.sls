setup_emailfrompwm:
  file.managed:
    - name: /usr/local/bin/emailfrompwm
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:emailfrompwm') }}
    - mode: 600
    - user: root
    - group: root

setup_emailfrom:
  file.managed:
    - name: /usr/local/bin/emailfrom
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:emailfrom') }}
    - mode: 600
    - user: root
    - group: root

setup_adminemailto:
  file.managed:
    - name: /usr/local/bin/adminemailto
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:adminemailto') }}
    - mode: 600
    - user: root
    - group: root

setup_ldaphostname:
  file.managed:
    - name: /usr/local/bin/ldaphostname
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:ldaphostname') }}
    - mode: 600
    - user: root
    - group: root

setup_mailfromdomain:
  file.managed:
    - name: /usr/local/bin/mailfromdomain
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:mailfromdomain') }}
    - mode: 600
    - user: root
    - group: root

setup_mailtoaddress:
  file.managed:
    - name: /usr/local/bin/mailtoaddress
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:mailtoaddress') }}
    - mode: 600
    - user: root
    - group: root

setup_pwmurl:
  file.managed:
    - name: /usr/local/bin/pwmurl
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:pwmurl') }}
    - mode: 600
    - user: root
    - group: root

setup_ostemail:
  file.managed:
    - name: /usr/local/bin/ostemail
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:ostemail') }}
    - mode: 600
    - user: root
    - group: root

setup_osturl:
  file.managed:
    - name: /usr/local/bin/osturl
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:osturl') }}
    - mode: 600
    - user: root
    - group: root

setup_ostapikey:
  file.managed:
    - name: /usr/local/bin/ostapikey
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:ostapikey') }}
    - mode: 600
    - user: root
    - group: root

setup_oupath:
  file.managed:
    - name: /usr/local/bin/oupath
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:oupath') }}
    - mode: 600
    - user: root
    - group: root

#setup_svcacctpass:
#  file.managed:
#    - name: /usr/local/bin/svcacctpass
#    - contents:
#        - "{{ salt.pillar.get('accountmgmt:lookup:svcacctpass') }}"
#    - mode: 600
#    - user: root
#    - group: root

setup_svcacctupn:
  file.managed:
    - name: /usr/local/bin/svcacctupn
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:svcacctupn') }}
    - mode: 600
    - user: root
    - group: root

setup_envirname:
  file.managed:
    - name: /usr/local/bin/envirname
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:envirname') }}
    - mode: 600
    - user: root
    - group: root

setup_resourcedomain:
  file.managed:
    - name: /usr/local/bin/resourcedomain
    - contents:
        - {{ salt.pillar.get('accountmgmt:lookup:resourcedomain') }}
    - mode: 600
    - user: root
    - group: root

#setup_bashrc:
#  file.append:
#    - name: /root/.bashrc
#    - text:
#      - export ENVIRNAME="{{ salt.pillar.get('accountmgmt:lookup:envirname') }}"
#      - export RESOURCEDOMAIN="{{ salt.pillar.get('accountmgmt:lookup:resourcedomain') }}"
#      - export CONFIGBUCKETNAME="{{ salt.pillar.get('accountmgmt:lookup:config_bucket') }}"
#
#export_envirname:
#  environ.setenv:
#    - name: ENVIRNAME
#    - value: {{ salt.pillar.get('accountmgmt:lookup:envirname') }}
#
#export_resourcedomain:
#  environ.setenv:
#    - name: RESOURCEDOMAIN
#    - value: {{ salt.pillar.get('accountmgmt:lookup:resourcedomain') }}
#
#export_configbucketname:
#  environ.setenv:
#    - name: CONFIGBUCKETNAME
#    - value: {{ salt.pillar.get('accountmgmt:lookup:config_bucket') }}