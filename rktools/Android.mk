LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkcrc.c
LOCAL_STATIC_LIBRARIES := libmincrypt
LOCAL_MODULE := rkcrc
LOCAL_MODULE_TAGS := optional
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkcrc.c
LOCAL_STATIC_LIBRARIES := libmincrypt libcutils libc
LOCAL_MODULE := rkcrc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := rkcrc
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkbootimg.c
LOCAL_STATIC_LIBRARIES := libmincrypt
LOCAL_MODULE := rkbootimg
LOCAL_MODULE_TAGS := optional
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := rkbootimg.c
LOCAL_STATIC_LIBRARIES := libmincrypt libcutils libc
LOCAL_MODULE := utility_rkbootimg
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := rkbootimg
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

####################################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -g -O3 -DUSE_OPENSSL -Wall
LOCAL_LDLIBS := -lssl -lcrypto
LOCAL_SHARED_LIBRARIES += libssl libcrypto
LOCAL_SRC_FILES := afptool.c
LOCAL_MODULE := rk_afptool
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -g -O3 -DUSE_OPENSSL -Wall
LOCAL_C_INCLUDES := external/openssl/include $(LOCAL_C_INCLUDES)
LOCAL_LDLIBS := -lssl -lcrypto
LOCAL_SHARED_LIBRARIES += libssl libcrypto
LOCAL_SRC_FILES := img_unpack.c
LOCAL_MODULE := rk_img_unpack
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -g -O3 -DUSE_OPENSSL -Wall
LOCAL_C_INCLUDES := external/openssl/include $(LOCAL_C_INCLUDES)
LOCAL_LDLIBS := -lssl -lcrypto
LOCAL_SHARED_LIBRARIES += libssl libcrypto
LOCAL_SRC_FILES := img_maker.c
LOCAL_MODULE := rk_img_maker
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -g -O3 -DUSE_OPENSSL -Wall
LOCAL_C_INCLUDES := external/openssl/include $(LOCAL_C_INCLUDES)
LOCAL_LDLIBS := -lssl -lcrypto
LOCAL_SRC_FILES := mkkrnlimg.c
LOCAL_SHARED_LIBRARIES += libssl libcrypto
LOCAL_MODULE := rk_mkkrnlimg
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
include $(BUILD_HOST_EXECUTABLE)
#######################################################################################################
