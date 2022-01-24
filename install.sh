#!/bin/bash

DANSAY_DIR="$HOME/dansay"

OS="$(uname)"
if [[ "${OS}" == "Linux" ]]
then
    DANSAY_URL="https://github.com/danbugs/dansay/releases/download/v1.0.0-posix/dansay-linux"
elif [[ "${OS}" == "Darwin" ]]
then
    DANSAY_URL="https://github.com/danbugs/dansay/releases/download/v1.0.0-posix/dansay-osx"
else
  abort "This installation method only works for macOS and Linux."
fi

case "${SHELL}" in
  */bash*)
    if [[ -r "${HOME}/.bash_profile" ]]
    then
      SHELL_PROFILE="${HOME}/.bash_profile"
    else
      SHELL_PROFILE="${HOME}/.profile"
    fi
    ;;
  */zsh*)
    SHELL_PROFILE="${HOME}/.zprofile"
    ;;
  *)
    SHELL_PROFILE="${HOME}/.profile"
    ;;
esac

echo ">>> BINARY WILL BE STORED AT $HOME/dansay."
mkdir $DANSAY_DIR

cd $DANSAY_DIR && wget -q $DANSAY_URL
echo ">>> DOWNLOADED BINARY."

DANSAY_IN_PATH=`grep 'PATH="$HOME/dansay:$PATH"' $SHELL_PROFILE`
if [[ "$DANSAY_IN_PATH" = "" ]] 
then
    echo ">>> NOT YET INSTALLED. WILL INSTALL NOW."
    echo '' >> $SHELL_PROFILE
    echo 'PATH="$HOME/dansay:$PATH"' >> $SHELL_PROFILE
fi

chmod +x $DANSAY_DIR/dansay-linux
echo ">>> INSTALLED."
echo ">>> RUN \"source $SHELL_PROFILE\" TO FINALIZE."
