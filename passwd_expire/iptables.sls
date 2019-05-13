# sets up the iptables for the machine
input_accept_policy:
  iptables.set_policy:
    - chain: INPUT
    - policy: ACCEPT

flush_input:
  iptables.flush:
    - chain: INPUT

loopback_all:
  iptables.append:
    - family: ipv4
    - chain: INPUT
    - jump: ACCEPT
    - comment: "Allow inbound on loopback for app to postfix mailing"
    - in-interface: lo

all_conn_state:
  iptables.append:
    - chain: INPUT
    - match: state
    - connstate: RELATED,ESTABLISHED
    - jump: ACCEPT

allow_ssh_all:
  iptables.append:
    - chain: INPUT
    - match: state
    - connstate: NEW
    - proto: tcp
    - dport: 22
    - jump: ACCEPT

input_drop_policy:
  iptables.set_policy:
    - chain: INPUT
    - policy: DROP
    - save: True