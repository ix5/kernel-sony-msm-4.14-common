GIT_CMD="git clone --single-branch --depth=1"
REMOTE="https://github.com/sonyxperiadev"
BASEDIR="/srv/android"

mkdir -p $BASEDIR/kernel/sony/msm-4.14/

$GIT_CMD $REMOTE/device-sony-common-headers $BASEDIR/kernel/sony/msm-4.14/common-headers -b aosp/LA.UM.7.1.r1
#$GIT_CMD $REMOTE/kernel-sony-msm-4.14-common $BASEDIR/kernel/sony/msm-4.14/common-kernel -b aosp/LA.UM.7.1.r1

$GIT_CMD $REMOTE/kernel $BASEDIR/kernel/sony/msm-4.14/kernel -b aosp/LA.UM.7.1.r1

# Need to remove existing dir
rm -rf $BASEDIR/kernel/sony/msm-4.14/kernel/techpack/audio

$GIT_CMD $REMOTE/kernel-techpack-audio $BASEDIR/kernel/sony/msm-4.14/kernel/techpack/audio -b aosp/LA.UM.7.1.r1
$GIT_CMD $REMOTE/kernel-techpack-data-kernel $BASEDIR/kernel/sony/msm-4.14/kernel/techpack/data-kernel -b aosp/LA.UM.7.1.r1

$GIT_CMD $REMOTE/kernel-defconfig $BASEDIR/kernel/sony/msm-4.14/kernel/arch/arm64/configs/sony -b aosp/LA.UM.7.1.r1

$GIT_CMD $REMOTE/vendor-qcom-opensource-wlan-fw-api $BASEDIR/kernel/sony/msm-4.14/kernel/drivers/staging/wlan-qc/fw-api -b aosp/LA.UM.8.1.r1
$GIT_CMD $REMOTE/vendor-qcom-opensource-wlan-qca-wifi-host-cmn $BASEDIR/kernel/sony/msm-4.14/kernel/drivers/staging/wlan-qc/qca-wifi-host-cmn -b aosp/LA.UM.8.1.r1
$GIT_CMD $REMOTE/vendor-qcom-opensource-wlan-qcacld-3.0 $BASEDIR/kernel/sony/msm-4.14/kernel/drivers/staging/wlan-qc/qcacld-3.0 -b aosp/LA.UM.8.1.r1
