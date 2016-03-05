#!/system/bin/sh

# SELinux policy for Viper4Android
/system/xbin/supolicy --live "allow mediaserver mediaserver_tmpfs:file { read write execute };"

exit;
