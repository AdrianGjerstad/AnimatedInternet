#!/usr/bin/env python3

function aint() {
  if [[ $AINTPATH == '' ]]; then
    echo 'aint: [Errno 2] the AINTPATH environment variable could not be found'
    return 2
  fi

  if [[ $AINTPATH != '/'* ]]; then
    # $AINTPATH is not an absolute path.
    export AINTPATH=$PWD/$AINTPATH
  fi

  if [[ $AINTPATH != *'/' ]]; then
    export AINTPATH=$AINTPATH/
  fi

  if [[ ! -d $AINTPATH ]]; then
    echo 'aint: [Errno 3] `'$AINTPATH'` is not a directory'
    return 3
  fi

  if [[ ! -f $AINTPATH/.animint_magic ]]; then
    echo 'aint: [Errno 4] AINTPATH environment variable does not contain a path to a valid version of the program.'
    return 4
  fi

  if [[ ! -f $AINTPATH/main.py ]]; then
    echo 'aint: [Errno 4] AINTPATH environment variable does not contain a path to a valid version of the program.'
    return 4
  fi

  command python3 -v > /dev/null 2>&1

  if [[ $? -eq 127 ]]; then
    echo 'aint: [Errno 5] Python version 3 is not installed.'
    return 5
  fi

  
}
