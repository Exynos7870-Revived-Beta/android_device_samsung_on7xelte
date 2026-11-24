# Cleaned for Android 12.1 COMMON_LUNCH_CHOICES

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "${SCRIPT_DIR}/patches/apply-patches.sh" ]; then
    bash "${SCRIPT_DIR}/patches/apply-patches.sh"
fi
