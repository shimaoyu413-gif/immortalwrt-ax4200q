#!/bin/bash
DTS_FILE="target/linux/mediatek/files-6.6/arch/arm64/boot/dts/mediatek/mt7986a-asus-tuf-ax4200q.dts"

cat > "$DTS_FILE" << 'EOT'
// SPDX-License-Identifier: GPL-2.0-or-later
/dts-v1/;
#include "mt7986a.dtsi"

/ {
    model = "ASUS TUF Gaming AX4200 (TUF-AX4200Q)";
    compatible = "asus,tuf-ax4200q", "mediatek,mt7986a";
};

&eth {
    status = "okay";
    ports {
        port@0 { reg = <0>; label = "wan"; ethernet = "2500base-x"; };
        port@1 { reg = <1>; label = "lan5"; ethernet = "2500base-x"; };
        port@2 { reg = <2>; label = "lan1"; };
        port@3 { reg = <3>; label = "lan2"; };
        port@4 { reg = <4>; label = "lan3"; };
        port@5 { reg = <5>; label = "lan4"; };
        port@6 { reg = <6>; label = "cpu"; ethernet = "sfp"; phy-mode = "2500base-x"; };
    };
};

&pcie0 { status = "okay"; };
&pcie1 { status = "okay"; };
&usb3 { status = "okay"; };
&uart0 { status = "okay"; };
EOT

ln -sf files-6.6/arch/arm64/boot/dts/mediatek/mt7986a-asus-tuf-ax4200q.dts \
    target/linux/mediatek/mt7986a-asus-tuf-ax4200q.dts
