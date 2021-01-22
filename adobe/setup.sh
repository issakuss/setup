ARCH="$(uname -m)"

if [ "${ARCH}" = "arm64"]; then
   echo -n "Need to download manually on Apple Silicon."
   open https://creativecloud.adobe.com/apps/download/creative-cloud 
else
   brew install --cask adobe-creative-cloud
fi

brew install --cask adobe-creative-cloud-cleaner-tool
curl -o how-to-use-irare.md https://raw.githubusercontent.com/issakuss/setup/master/adobe/README.md