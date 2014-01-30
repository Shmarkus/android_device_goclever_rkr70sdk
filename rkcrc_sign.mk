#
# Copyright (C) 2012 The CyanogenMod Project
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
RKCRC := ~/bin/rkcrc #$(HOST_OUT_EXECUTABLES)/rkcrc

GZ_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.gz
GZ_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.gz

CPIO_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.cpio
CPIO_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.cpio


INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img

$(INSTALLED_BOOTIMAGE_TARGET): $(INSTALLED_RAMDISK_TARGET) $(RKCRC) 
	$(call pretty,"Boot image: $@")
	$(hide) cd $(PRODUCT_OUT)/root && find . | cpio --quiet -o -H newc | gzip -n > $(GZ_BOOTIMAGE_TARGET)
	$(hide)	$(RKCRC) -k $(GZ_BOOTIMAGE_TARGET) $@
	@echo ----- Made boot image -------- $@
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk) $(RKCRC) 
	$(call pretty,"Recovery image: $@")
	$(hide) cd $(PRODUCT_OUT)/recovery/root && find . | cpio --quiet -o -H newc | gzip -n > $(GZ_RECOVERYIMAGE_TARGET)
	$(hide)	$(RKCRC) -k $(GZ_RECOVERYIMAGE_TARGET) $@ 
	@echo ----- Made recovery image -------- $@
