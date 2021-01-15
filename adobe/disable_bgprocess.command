# https://apple.stackexchange.com/questions/138941/how-do-i-stop-the-adobe-creative-cloud-app-from-auto-launching-on-login
launchctl unload -w {,~}/Library/LaunchAgents/com.adobe.*.plist
sudo launchctl unload -w /Library/LaunchDaemons/com.adobe.*.plist
pluginkit -e ignore -i com.adobe.accmac.ACCFinderSync