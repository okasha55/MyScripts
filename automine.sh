#!/bin/bash

idle=false
idleAfter=2000     # consider idle after 3000 ms

while true; do
  idleTimeMillis=$(xprintidle)
  #echo $idleTimeMillis  # just for debug purposes.
  if [[ $idle = false && $idleTimeMillis -gt $idleAfter && !($(ss | grep ssh))]] ; then
    #echo "start idle"   # or whatever command(s) you want to run...
    $(terminator  --geometry=1024x560 -e  "sudo nvidia-smi -pl 130 && sudo ~/Downloads/Compressed/ethminer_RTX30series/build/ethminer/ethminer -U -P stratum://0x859770487e79e58f65843D1bB61Dfa946A53bc67@us1.ethermine.org:4444 -v 3; echo Done - Press enter to exit; read" 
)
    idle=true
  elif [[ $idle = true && !($(pidof ethminer))]] ; then
    $(sudo nvidia-smi -pl 210)
    #echo "end idle"     # same here.
    idle=false
  fi
sleep 1      # polling interval

done
