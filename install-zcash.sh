#!/bin/bash
set -efuxo pipefail

sudo apt-get -y install apt-transport-https wget gnupg2

wget -qO - https://apt.z.cash/zcash.asc | sudo apt-key add -
EXPECTED_FINGERPRINT='3FE6 3B67 F85E A808 DE9B  880E 6DEF 3BAF 2727 66C0'
apt-key list | grep "^      $EXPECTED_FINGERPRINT"

echo "deb [arch=amd64] https://apt.z.cash/ jessie main" | sudo tee /etc/apt/sources.list.d/zcash.list

sudo apt-get -y update
sudo apt-get -y install zcash

zcash-fetch-params

zcashd -version
