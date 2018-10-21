# xsub's bash/tools

TOOLS LIST
----------

1. ssh-config-changer.sh (should be named 'circular relinker' :D)

    This simple scripts relinks/creates a sybolic link to next file in given list.


Example output for ssh-config-changer.sh
```
✔ pawel@portbox ~/_SCRIPTS $ bash ./ssh-config-changer.sh 
LINK TOKEN: /home/pawel/.ssh/config.wdc
TARGET ID: 1, TARGET: /home/pawel/.ssh/config.real STATUS: OK
TARGET ID: 2, TARGET: /home/pawel/.ssh/config.wdc STATUS: OK
REAL TARGET: /home/pawel/.ssh/config.real
./ssh-config-changer.sh: DOING: ln -sf /home/pawel/.ssh/config.real /home/pawel/.ssh/config
✔ pawel@portbox ~/_SCRIPTS $ bash ./ssh-config-changer.sh 
LINK TOKEN: /home/pawel/.ssh/config.real
TARGET ID: 1, TARGET: /home/pawel/.ssh/config.real STATUS: OK
REAL TARGET: /home/pawel/.ssh/config.wdc
./ssh-config-changer.sh: DOING: ln -sf /home/pawel/.ssh/config.wdc /home/pawel/.ssh/config
✔ pawel@portbox ~/_SCRIPTS $ 
```
