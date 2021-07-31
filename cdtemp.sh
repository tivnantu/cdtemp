#!/bin/zsh
function cdtemp(){
  tempdirlog='/tmp/tempdir.log'
  if [ $# -eq 0 ] && [ -f "$tempdirlog" ]; then
      cd "$(tail -n 1 $tempdirlog)"
  elif [ "$1" = "-l" ]; then
      cat -n $tempdirlog
  elif [ "$1" = "-n" ]; then
      tempDir=$(mktemp -d)
      echo "${tempDir}"
      echo "${tempDir}" >> "$tempdirlog"
      cd "${tempDir}"
  elif  $(echo "$1" | grep -q '[0-9]'); then
      cd "$(sed -n "$1,$1p" $tempdirlog)"
  else
      tempDir=$(mktemp -d)
      echo "${tempDir}"
      echo "${tempDir}" >> "$tempdirlog"
      cd "${tempDir}"
  fi
}
