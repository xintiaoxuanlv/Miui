#!/system/bin/sh

#/system/xbin/su --daemon &

setenforce 0

ret=255
until [ $ret == 0 ]
do
	mount -o rw,remount /
	ret=$?	
done
ret=255
until [ $ret == 0 ]
do
	mount -o rw,remount /system
	ret=$?	
done
ret=255
until [ $ret == 0 ]
do
	mount -o rw,remount /data
	ret=$?	
done

while  [ `getenforce` != "Permissive" ]
	do
	setenforce 0	
done

pm grant com.google.android.gms android.permission.ACCESS_FINE_LOCATION
pm grant com.google.android.gms android.permission.ACCESS_COARSE_LOCATION
