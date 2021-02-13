#!/bin/bash

idle=true
idleAfter=300000     # consider idle after 3000 ms

while true; do
  idleTimeMillis=$(xprintidle)
  #echo $idleTimeMillis  # just for debug purposes.
  if [[ $idle = false && $idleTimeMillis -gt $idleAfter && !($(ss | grep ssh)) && !($(pidof ethminer))]] ; then
  
    $(xterm -e "sudo nvidia-smi -pl 130 && nvidia-settings --assign GPUMemoryTransferRateOffsetAllPerformanceLevels=2200 && nvidia-settings --assign GPUGraphicsClockOffsetAllPerformanceLevels=-500 && sudo ~/Downloads/Compressed/ethminer_RTX30series/build/ethminer/ethminer -U -P stratum://0x859770487e79e58f65843D1bB61Dfa946A53bc67@us1.ethermine.org:4444 -v 3;")
    idle=true
  elif [[ $idle = true && !($(pidof ethminer))]] ; then
    $(sudo nvidia-smi -pl 210 && nvidia-settings --assign GPUMemoryTransferRateOffsetAllPerformanceLevels=0 && nvidia-settings --assign GPUGraphicsClockOffsetAllPerformanceLevels=0)

    idle=false
  elif [[ $idle = false && ($(pidof ethminer))]] ; then
    idle=true
  fi
sleep 60     # polling interval

done
