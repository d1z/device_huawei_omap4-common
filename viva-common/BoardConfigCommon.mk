#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
# Copyright (C) 2013-2015 ShevT
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

FRONTCOMMON_PATH := device/huawei/omap4-common/viva-common

# Platform
TARGET_BOOTLOADER_BOARD_NAME := viva

# Kernel/Ramdisk
TARGET_KERNEL_CONFIG := front_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/viva

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(FRONTCOMMON_PATH)/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(FRONTCOMMON_PATH)/bluetooth/vnd_front.txt

# fix this up by examining /proc/partitions on a running device. (value * 1024)
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 939524096
# 6329204736 - 16384 <encryption footer>
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6329188352

# Recovery
TARGET_RECOVERY_FSTAB := $(FRONTCOMMON_PATH)/rootdir/fstab.front
