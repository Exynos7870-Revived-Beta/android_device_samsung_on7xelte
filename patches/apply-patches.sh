#!/bin/bash
# Script to apply recovery patches for Samsung Exynos 7870 devices

PATCHES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${PATCHES_DIR}/../../../../" && pwd)"

apply_patch() {
    local target_dir="$1"
    local patch_file="$2"
    local patch_name="$(basename "${patch_file}")"

    if [ ! -d "${ROOT_DIR}/${target_dir}" ]; then
        echo "universal7870: Target directory ${target_dir} not found, skipping ${patch_name}"
        return 0
    fi

    # Check if patch is already applied
    if git -C "${ROOT_DIR}/${target_dir}" apply --reverse --check --ignore-whitespace "${patch_file}" >/dev/null 2>&1; then
        echo "universal7870: Patch ${patch_name} already applied to ${target_dir}."
    elif git -C "${ROOT_DIR}/${target_dir}" apply --check --ignore-whitespace "${patch_file}" >/dev/null 2>&1; then
        echo "universal7870: Applying patch ${patch_name} to ${target_dir}..."
        git -C "${ROOT_DIR}/${target_dir}" apply --ignore-whitespace "${patch_file}"
        if [ $? -eq 0 ]; then
            echo "universal7870: Successfully applied ${patch_name} to ${target_dir}."
        else
            echo "universal7870: Failed to apply ${patch_name} to ${target_dir}!"
        fi
    else
        echo "universal7870: Warning: patch ${patch_name} does not apply cleanly to ${target_dir} (might be already applied with modifications)."
    fi
}

echo "=== Applying universal7870 TWRP recovery patches ==="
for patch in "${PATCHES_DIR}"/*.patch; do
    [ -f "${patch}" ] || continue
    apply_patch "bootable/recovery" "${patch}"
done
echo "===================================================="
