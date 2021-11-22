FROM qmkfm/qmk_cli

ENV QMK_FIRMWARE_VERSION=0.13.33

RUN git clone \
  -b ${QMK_FIRMWARE_VERSION} \
  --depth 1 \
  --recurse-submodules \
  https://github.com/qmk/qmk_firmware.git \
  /qmk_firmware

VOLUME /qmk_firmware
WORKDIR /qmk_firmware
