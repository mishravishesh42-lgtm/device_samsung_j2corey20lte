# TWRP Device Tree — Samsung SM-J260GU (j2corey20lte)

## Device Specifications

| Property | Value |
|---|---|
| **Model** | Samsung Galaxy J2 Core Go 2020 |
| **Codename** | j2corey20lte |
| **SoC** | Qualcomm Snapdragon 425 (MSM8917) |
| **Board** | msm8937 |
| **GPU** | Adreno 308 |
| **RAM** | 1GB LPDDR3 |
| **Storage** | 16GB eMMC |
| **Screen** | 5.0" 960x540 (hdpi) |
| **Android** | 8.1.0 (Oreo) |
| **Kernel** | 3.18.71 (prebuilt) |

## Partition Layout

| Partition | Block Device | Size |
|---|---|---|
| boot | mmcblk0p25 | 32MB |
| recovery | mmcblk0p26 | 32MB |
| system | mmcblk0p47 | ~1.4GB |
| userdata | mmcblk0p53 | ~12.5GB |
| cache | mmcblk0p50 | ~70MB |
| efs | mmcblk0p22 | ~14MB |
| vendor | mmcblk0p48 | ~248MB |
| persist | mmcblk0p33 | 32MB |

## Building TWRP

### Prerequisites
- Ubuntu 20.04 / 22.04 (or WSL2)
- 8GB+ RAM, 100GB+ disk space
- `repo` tool installed

### Sync Source
```bash
mkdir twrp && cd twrp
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j$(nproc) --force-sync
```

### Local Manifest
Create `.repo/local_manifests/j2corey20lte.xml`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="YOUR_GITHUB/device_samsung_j2corey20lte"
           path="device/samsung/j2corey20lte"
           remote="github" />
</manifest>
```

### Build
```bash
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_j2corey20lte-eng
mka recoveryimage -j$(nproc)
```

### Output
```
out/target/product/j2corey20lte/recovery.img
```

### Flash via Odin
- Open Odin → AP slot → Select `recovery.img`
- Boot device into Download Mode (Vol Down + Home + Power)
- Flash!

## Notes
- Kernel is prebuilt (Header V0, ZIMAGE+gzip, DTB embedded)
- Download Mode supported (Samsung specific)
- Crypto disabled (Android 8.1 FDE footer based)
- EFS backup supported in TWRP

## Credits
- Device tree by MAdMiZ
