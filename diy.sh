#!/bin/bash
# diy.sh - Aggressive feed pruning for ASUS TUF-AX4200Q to avoid disk full

cd openwrt || exit 1

# Step 1: Update only essential feeds
./scripts/feeds update luci packages

# Step 2: Remove large or unnecessary package directories BEFORE install
#         This prevents their Makefiles from being parsed and saves tmp/ space

# Networking bloat (mesh/routing protocols not needed for home router)
rm -rf feeds/packages/net/{bmx7,olsrd,babeld,batman-adv,ssdpd,mdns-repeater}
rm -rf feeds/luci/applications/luci-app-{bmx7,olsr*,babeld,batman-adv}

# Development & scripting languages (huge, not needed)
rm -rf feeds/packages/utils/{python*,perl*,node*,npm*,golang*,ruby*,php*}
rm -rf feeds/packages/devel/{gcc,binutils,gdb,strace,valgrind,cmake,autoconf,automake}

# Heavy libraries (often pulled in as deps)
rm -rf feeds/packages/libs/{libpcap,libnetfilter*,libmnl,libnfnetlink,libnetlink}

# Multimedia, telephony, printing, etc.
rm -rf feeds/packages/{multimedia,telephony,net/telephony,net/asterisk}
rm -rf feeds/packages/utils/{cups*,foomatic*,hplip*}

# Step 3: Install only what we need
./scripts/feeds install -a -p luci
./scripts/feeds install -a -p packages

echo "✅ DIY: Aggressive feed pruning completed. Proceeding to build..."
