adb shell "mkdir -p  data/security/current/"
adb push out/target/product/colombo/obj/ETC/sepolicy_intermediates/sepolicy  /data/security/current/
adb shell "cat /selinux_version > /data/security/current/selinux_version"
adb shell "setprop selinux.reload_policy 1"

