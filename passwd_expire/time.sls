pkginstall:
  pkg.installed:
    - names:
      - chrony

pkgremove:
  pkg.removed:
    - names:
      - ntp
      - ntpdate

/etc/chrony.conf:
  file.append:
    - text: 'server 169.254.169.123 prefer iburst'