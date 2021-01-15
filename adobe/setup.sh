ARCH="$(uname -m)"

if [ "${ARCH}" = "arm64"]; then
   echo -n "Need to download manually on Apple Silicon."
   open https://creativecloud.adobe.com/apps/download/creative-cloud 
else
   homebrew install --cask adobe-creative-cloud
fi

homebrew install --cask adobe-creative-cloud-cleaner-tool
curl -o how-to-use-irare https://github.com/issakuss/setup/master/adobe/README.md