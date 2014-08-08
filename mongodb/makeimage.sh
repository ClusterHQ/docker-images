#!/bin/sh
[ -f rootfs.tar ] || { 
    echo "Hmm this should run in the directory of rootfs.tar"
    exit 1
}
rm -rf extra
mkdir extra extra/etc extra/sbin extra/lib extra/lib64 extra/home extra/home/mongodb
touch extra/etc/resolv.conf
touch extra/sbin/init
# Uncomment this if you want to include docker in the image, for testing purposes
#cp $(which docker) extra
# You might have to run "ldd $(which docker)" and adjust those paths
cp /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libc.so.6 extra/lib
cp /lib/x86_64-linux-gnu/librt.so.1 extra/lib
cp /lib64/ld-linux-x86-64.so.2 extra/lib64
cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /lib/x86_64-linux-gnu/libm.so.6 extra/lib
#cp mongo/mongod extra/home/mongodb
cp -R mongo/* extra/home/mongodb
cp rootfs.tar mongoimage.tar
tar rvf mongoimage.tar -C extra .
docker import - clusterhq/mongolite < mongoimage.tar
