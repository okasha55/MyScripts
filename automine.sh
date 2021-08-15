#!/bin/bash

idle=true
idleAfter=300000     # consider idle after 3000 ms

while true; do
  idleTimeMillis=$(xprintidle)
  #echo $idleTimeMillis  # just for debug purposes.
  if [[ $idle = false && $idleTimeMillis -gt $idleAfter && !($(ss | grep ssh)) && !($(pidof miner))]] ; then
  
    $(xterm -e "sudo nvidia-smi -pl 130 && nvidia-settings --assign GPUMemoryTransferRateOffsetAllPerformanceLevels=2200 && nvidia-settings --assign GPUGraphicsClockOffsetAllPerformanceLevels=-500 && miner --algo eth --server eu.ezil.me:5555 --user 0x859770487e79e58f65843D1bB61Dfa946A53bc67.zil19624eg5h30ecv8k3ksapsmp06mseh0gscaw9jk;")
    idle=true
  elif [[ $idle = true && !($(pidof miner)) ]] ; then
    sudo nvidia-smi -pl 210
    nvidia-settings --assign GPUMemoryTransferRateOffsetAllPerformanceLevels=0
    nvidia-settings --assign GPUGraphicsClockOffsetAllPerformanceLevels=0
    idle=false
  elif [[ $idle = false && ($(pidof miner)) ]] ; then
    idle=true
  fi
sleep 60     # polling interval

done
