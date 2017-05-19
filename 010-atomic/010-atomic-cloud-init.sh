#!/bin/bash

OUT_DIR=cloud-init

mkdir -p $OUT_DIR

cat > $OUT_DIR/user-data << EOF
#cloud-config
password: redhat01
chpasswd: { expire: False }
ssh_pwauth: True
ssh_authorized_keys:
  - $(cat ~/.ssh/id_rsa.pub)
EOF

cat > $OUT_DIR/meta-data << EOF
instance-id: localhost
local-hostname: atomic01
EOF

pushd $OUT_DIR

genisoimage -output cloud-init.iso \
    -volid cidata -joliet -rock meta-data user-data
