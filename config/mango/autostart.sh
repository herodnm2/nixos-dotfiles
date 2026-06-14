#!/bin/bash

set +e

swaybg -i /home/clevex/wall1.jpg -m fill

swaync

# ime input
fcitx5 --replace -d >/dev/null 2>&1 &
