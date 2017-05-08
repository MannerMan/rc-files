#!/bin/bash
hostname_long="${1}"

[[ $hostname_long == *"fnox.se" ]] && hostname_suffix=".fnox.se"
[[ $hostname_long == *"noxf.se" ]] && hostname_suffix=".noxf.se"

hostname_short=${hostname_long%$hostname_suffix}

echo -ne "\033k$hostname_short\033\\"
