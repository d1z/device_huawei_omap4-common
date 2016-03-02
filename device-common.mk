#
# Copyright (C) 2016 ShevT
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVCOMMON_PATH := device/huawei/omap4-common

PRODUCT_CHARACTERISTICS := default

# Audio Packages
PRODUCT_PACKAGES += \
    tinycap \
    tinymix \
    tinyplay \
    libtinyalsa \
    libaudioutils

# Hardware HALs
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.omap4 \
    gralloc.omap4.so \
    camera.omap4 \
    memtrack.omap4 \
    power.front \
    lights.omap4

# Replace Camera2 to Snap
PRODUCT_PACKAGES += \
    Snap

# init.d
PRODUCT_COPY_FILES += \
    $(DEVCOMMON_PATH)/utilities/init.d/11frandom:system/etc/init.d/11frandom

# Media / Audio
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    $(DEVCOMMON_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVCOMMON_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVCOMMON_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

# WiFi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    hostapd_default.conf \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

# Common
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    e2fsck \
    com.android.future.usb.accessory

# Utilities
PRODUCT_PACKAGES += \
    remount \
    optimizedb \
    optimizestorage

# Network tools
PRODUCT_PACKAGES += \
    libpcap \
    tcpdump

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# Charging mode
PRODUCT_PACKAGES += \
    charger_res_images

# Key maps
PRODUCT_COPY_FILES += \
    $(DEVCOMMON_PATH)/configs/usr/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
    $(DEVCOMMON_PATH)/configs/usr/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
    $(DEVCOMMON_PATH)/configs/usr/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
    $(DEVCOMMON_PATH)/configs/usr/syn_tm12xx_ts_1.idc:system/usr/idc/syn_tm12xx_ts_1.idc \
    $(DEVCOMMON_PATH)/configs/usr/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.allow.mock.location=1 \
    persist.sys.usb.config=mtp

# Newer camera API isn't supported.
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Disable VFR support for encoders
PRODUCT_PROPERTY_OVERRIDES += \
    debug.vfr.enable=0

# Avoids retrying for an EGL config w/o EGL_SWAP_BEHAVIOR_PRESERVED
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.render_dirty_regions=false

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true

# I/O Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Low-RAM optimizations
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.low_ram=true \
    dalvik.vm.jit.codecachesize=0 \
    persist.sys.force_highendgfx=true \
    config.disable_atlas=true \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    ro.sys.fw.dex2oat_thread_count=2

ADDITIONAL_BUILD_PROPERTIES += \
    ro.com.android.dataroaming=false

# Disabling strict mode
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
