#
# Contains adb setups for usual apps after a android flash.
# Enables secure privileges for them.
#

# Give Greenify special rights to do it's magic
# Restart Greenify once for the rights to take effect
adb shell pm grant com.oasisfeng.greenify android.permission.WRITE_SECURE_SETTINGS
adb shell pm grant com.oasisfeng.greenify android.permission.GET_APP_OPS_STATS
adb shell pm grant com.oasisfeng.greenify android.permission.READ_LOGS
adb shell pm grant com.oasisfeng.greenify android.permission.DUMP
adb shell am force-stop com.oasisfeng.greenify

###########################
# Give Tasker the rights it deserves and needs
###########################

# Check running services (Context - Application)
adb shell pm grant net.dinglisch.android.taskerm android.permission.DUMP
# Read System Logs (Context - Event - LogCat Entry)
adb shell pm grant net.dinglisch.android.taskerm android.permission.READ_LOGS
# Write Secure Settings (Action - Settings - Custom Setting)
adb shell pm grant net.dinglisch.android.taskerm android.permission.WRITE_SECURE_SETTINGS

###########################
# Give AutoApps the rights it deserves and needs
###########################

# LogCat for AutoTools
adb shell pm grant com.joaomgcd.autotools android.permission.READ_LOGS
# Secure Settings for AutoTools
adb shell pm grant com.joaomgcd.autotools android.permission.WRITE_SECURE_SETTINGS
# Remove screen recording warning from AutoInput
adb shell appops set com.joaomgcd.autoinput PROJECT_MEDIA allow
# Secure Settings for AutoInput (not sure exactly which action from AI needs secure settings)
adb shell pm grant com.joaomgcd.autoinput android.permission.WRITE_SECURE_SETTINGS
# Secure Settings for AutoWear
adb shell pm grant com.joaomgcd.autowear android.permission.WRITE_SECURE_SETTINGS

###########################
# Give Join Clipboard Permission on Android 10
# https://joaoapps.com/AutoApps/Help/Info/com.joaomgcd.join/android_10_read_logs.html
###########################
adb -d shell appops set com.joaomgcd.join SYSTEM_ALERT_WINDOW allow
adb shell pm grant com.joaomgcd.join android.permission.WRITE_SECURE_SETTINGS
adb shell pm grant com.joaomgcd.join android.permission.READ_LOGS
adb shell am force-stop com.joaomgcd.join

###########################
# Make XDA Navigation Gestures useful
###########################
adb shell pm grant com.xda.nobar android.permission.WRITE_SECURE_SETTINGS
