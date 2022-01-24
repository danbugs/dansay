#!/bin/bash

DANSAY_DIR="$HOME/dansay"

if [[ ! -x "$(command -v git)" ]]
then
  echo ">>> GIT IS REQUIRED FOR THIS INSTALLATION."
  exit 1
fi

DANSAY_LATEST_RELEASE="$(git ls-remote https://github.com/danbugs/dansay HEAD | grep -o '^\S*')"

OS="$(uname)"
if [[ "${OS}" == "Linux" ]]
then
    DANSAY_URL="https://github.com/danbugs/dansay/releases/download/$DANSAY_LATEST_RELEASE-linux/dansay"
elif [[ "${OS}" == "Darwin" ]]
then
    DANSAY_URL="https://github.com/danbugs/dansay/releases/download/$DANSAY_LATEST_RELEASE-osx/dansay"
else
  echo ">>> THIS INSTALLATION METHOD ONLY WORKS FOR MACOS AND LINUX."
  exit 1
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

if [[ ! -f $SHELL_PROFILE ]]
then
  touch $SHELL_PROFILE
fi

echo ">>> BINARY WILL BE STORED AT $HOME/dansay."
mkdir $DANSAY_DIR

cd $DANSAY_DIR && curl -L -s $DANSAY_URL --output dansay
echo ">>> DOWNLOADED BINARY."

DANSAY_IN_PATH=`grep 'PATH="$HOME/dansay:$PATH"' $SHELL_PROFILE`
if [[ "$DANSAY_IN_PATH" = "" ]] 
then
    echo ">>> NOT YET INSTALLED. WILL INSTALL NOW."
    echo '' >> $SHELL_PROFILE
    echo 'PATH="$HOME/dansay:$PATH"' >> $SHELL_PROFILE
fi

chmod +x $DANSAY_DIR/dansay
echo ">>> INSTALLED."
echo ">>> RUN \"source $SHELL_PROFILE\" TO FINALIZE."
