USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/goclever/rkr70sdk/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := rk2928
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := rk2928sdk

BOARD_KERNEL_CMDLINE := console=ttyFIQ0 androidboot.console=ttyFIQ0 init=/init initrd=0x62000000,0x00240000 mtdparts=rk29xxnand:0x00002000@0x00000000(parameter),0x00002000@0x00002000(misc),0x00004000@0x00004000(kernel),0x00008000@0x00008000(boot),0x00010000@0x00010000(recovery),0x00020000@0x00020000(backup),0x00040000@0x00040000(cache),0x00200000@0x00080000(userdata),0x00002000@0x00280000(kpanic),0x00100000@0x00282000(system),-@0x00382000(user) bootver=2012-12-25#1.24 firmware_ver=4.1.1

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x02000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_PREBUILT_KERNEL := device/goclever/rkr70sdk/kernel

BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_PROVIDES_INIT := true
TARGET_RECOVERY_INITRC := device/goclever/rkr70sdk/recovery/init.rc
BOARD_CUSTOM_BOOTIMG_MK := device/goclever/rkr70sdk/rkcrc_sign.mk

TARGET_BOARD_PLATFORM_GPU := mali400
DEVICE_RESOLUTION := 800x480
TARGET_USERIMAGES_USE_EXT4 := true

#Vold
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_UMS_2ND_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun1/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

#HDMI
TARGET_HAVE_HDMI_OUT := false
BOARD_USES_HDMI := false

#Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/goclever/rkr70sdk/releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/goclever/rkr70sdk/releasetools/rk292x_ota_from_target_files

# Graphics
BOARD_EGL_CFG := vendor/goclever/rkr70sdk/proprietary/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_DISABLE_TRIPLE_BUFFERING := true
ENABLE_WEBGL := true
# For WebKit rendering issue
TARGET_FORCE_CPU_UPLOAD := true

COMMON_GLOBAL_CFLAGS += -DSURFACEFLINGER_FORCE_SCREEN_RELEASE -DNO_RGBX_8888 -DMISSING_GRALLOC_BUFFERS

# HWComposer
BOARD_USES_HWCOMPOSER := true

TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))
TARGET_EXTRA_CPPFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))