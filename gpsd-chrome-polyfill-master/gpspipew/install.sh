#!/bin/bash
PLATFORM="`uname -s`"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONF="au.id.micolous.gpspipe.json"

if [ "$PLATFORM" != "Darwin" ] && [ "$PLATFORM" != "Linux" ]
then
	echo "Unsupported platform: $PLATFORM"
	exit 1
fi

if [ "$1" = "-s" ]
then
	# System mode
	case "$PLATFORM" in
		Linux)
			DEST1="/etc/opt/chrome/native-messaging-hosts"
			DEST2="/etc/chromium/native-messaging-hosts"
			;;
		Darwin)
			DEST1="/Library/Google/Chrome/NativeMessagingHosts"
			DEST2="/Library/Application Support/Chromium/NativeMessagingHosts"
			;;
		*) # Shouldn't get here
			exit 1
			;;
	esac # is ridiculous

	mkdir -p "$DEST1" "$DEST2"
	install -o0 -g0 -m0644 "$DIR/$CONF" "$DEST1/$CONF"
	install -o0 -g0 -m0644 "$DIR/$CONF" "$DEST2/$CONF"
	echo "Installed Native Messaging data to system Chrom{e,ium} directories."

	install -o0 -g0 "$DIR/gpspipew.py" "/usr/local/bin"
	echo "Installed gpspipew.py to /usr/local/bin"
elif [ "$1" = "-u" ]; then
	# User mode
	case "$PLATFORM" in
		Linux)
			DEST1="$HOME/.config/google-chrome/NativeMessagingHosts"
			DEST2="$HOME/.config/chromium/NativeMessagingHosts"
			;;
		Darwin)
			DEST1="$HOME/Library/Application Support/Google/Chrome/NativeMessagingHosts"
			DEST2="$HOME/Library/Application Support/Chromium/NativeMessagingHosts"
			;;
	esac # is ridiculous
	
	mkdir -p "$DEST1" "$DEST2"
	install -m0644 "$DIR/$CONF" "$DEST1/$CONF"
	install -m0644 "$DIR/$CONF" "$DEST2/$CONF"
	echo "Installed Native Messaging data to user Chrom{e,ium} directories."
	echo ""
	echo "You need to manually install gpspipew.py to /usr/local/bin, or edit"
	echo "$DEST1/$CONF to point at the location of the script."
else
	# Give instructions
	echo "Usage: $0 <-s|-u>"
	echo " -s  Install to system-wide NativeMessagingHosts directory"
	echo " -u  Install to user (HOME) NativeMessagingHosts directory"
	exit 1
fi

