ifeq ($(TARGET_DEVICE),on7xelte)

ifeq ($(BOARD_RAMDISK_USE_LZMA),true)
COMPRESSION_COMMAND := $(LZMA) -9 -f -c
endif

RAMDISK_COMPRESSION_STAMP := $(PRODUCT_OUT)/obj/recovery-ramdisk-compression.txt

ifneq ($(strip $(recovery_ramdisk)),)
$(recovery_ramdisk): $(RAMDISK_COMPRESSION_STAMP)
endif

$(RAMDISK_COMPRESSION_STAMP): $(wildcard $(DEVICE_PATH)/BoardConfig.mk)
	$(hide) mkdir -p $(dir $@)
	$(hide) echo "$(COMPRESSION_COMMAND)" > $@.new
	$(hide) if cmp -s $@.new $@; then \
	    rm -f $@.new; \
	else \
	    echo "Recovery ramdisk compression: $(COMPRESSION_COMMAND)"; \
	    mv -f $@.new $@; \
	fi

endif
