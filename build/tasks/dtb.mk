#
# Copyright (C) 2026 samsungexynos7870
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

ifeq ($(TARGET_DEVICE),on7xelte)
ifeq ($(FULL_KERNEL_BUILD),true)
KERNEL_DTB_DIR := $(KERNEL_OUT)/arch/$(KERNEL_ARCH)/boot/dts
KERNEL_DTBIMG := $(KERNEL_OUT)/arch/$(KERNEL_ARCH)/boot/dtb.img
DTBTOOL := $(HOST_OUT_EXECUTABLES)/dtbhtoolExynos_on7xelte

KERNEL_DTS_SRCS := $(shell find -L $(TARGET_KERNEL_SOURCE)/arch/$(KERNEL_ARCH)/boot/dts \
	-maxdepth 1 -type f \( -name '*.dts' -o -name '*.dtsi' -o -name 'Makefile' \) 2>/dev/null)

$(TARGET_PREBUILT_INT_KERNEL): $(KERNEL_DTBIMG)

$(KERNEL_DTBIMG): $(KERNEL_CONFIG) $(DTBTOOL) $(KERNEL_DTS_SRCS)
	@echo "Building Exynos DTBH image (dtb.img)"
	$(call make-kernel-target,dtbs)
	$(hide) $(DTBTOOL) $(BOARD_DTBTOOL_ARGS) -o $@ -s $(BOARD_KERNEL_PAGESIZE) -p $(KERNEL_OUT)/scripts/dtc/ "$(KERNEL_DTB_DIR)"

ifneq ($(INSTALLED_RECOVERYIMAGE_TARGET),)
$(INSTALLED_RECOVERYIMAGE_TARGET): $(KERNEL_DTBIMG)
endif
endif
endif
