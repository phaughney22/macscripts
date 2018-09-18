#!/bin/bash

# This program will uninstall Advanced Mac Cleaner
# This script has been adopted from one created for MacKeeper
# The original can be found here: https://github.com/rtrouton/rtrouton_scripts/blob/master/rtrouton_scripts/Casper_Scripts/uninstall_scripts/uninstall_mackeeper/uninstall_mackeeper.sh
# Credits for Elliot Jordan, Linde Group and rtrouton for the original scripts

#################
### Variables ###
#################

# Items at the system level to be removed
systemItems=(
	/Applications/Mac\ Auto\ Fixer.app
	/Library/Advanced\ Mac\ Cleaner
	/Library/Application\ Support/Advanced\ Mac\ Cleaner
	/Library/Application\ Support/amc
	/Library/Application\ Support/Mac\ Mechanic
	/Library/Application\ Support/Mac\ Tonic
	/Library/Application\ Support/MacOptimizer
	/Library/Application\ Support/maf
	/Library/hlprmaf/mafgset.plist
	/Library/LaunchAgents/com.pcv.amcuninstall.plist
	/Library/LaunchAgents/com.pcv.hlpramcn.plist
	/Library/LaunchAgents/com.techyutil.maftask.plist
	/Library/LaunchAgents/com.techyutil.mafuninstaller.plist
	/Library/Mac\ Mechanic
	/Library/Mac\ Tonic
	/Library/MacOptimizer
	/Library/Preferences/com.techyutils.cleaner.plist
	/Volumes/MacAutoFixer/.hlpr/Mac\ Auto\ Fixer
	/Volumes/MacAutoFixer/.hlpr/maf
)

# Items at the user level to be removed
userItems=(
	/Applications/Mac\ Auto\ Fixer.app
	/Library/Advanced\ Mac\ Cleaner
	/Library/Application\ Support/Advanced\ Mac\ Cleaner
	/Library/Application\ Support/amc
	/Library/Application\ Support/Mac\ Auto\ Fixer
	/Library/Application\ Support/Mac\ Mechanic
	/Library/Application\ Support/Mac\ Tonic
	/Library/Application\ Support/MacOptimizer
	/Library/Application\ Support/maf
	/Library/Caches/com.pcv.amcuninstallhelper
	/Library/Caches/com.pcv.rlistupdater
	/Library/Caches/com.PCvark.Advanced-Mac-Cleaner
	/Library/Caches/com.techyutil.macautofixer
	/Library/Caches/com.techyutil.maftask
	/Library/Caches/com.techyutil.maftaskreviser
	/Library/Caches/com.techyutil.mafuninstaller
	/Library/Caches/com.techyutils.cleaner
	/Library/hlprmaf
	/Library/hlprmaf/mafgset.plist
	/Library/LaunchAgents/com.pcv.amcuninstall.plist
	/Library/LaunchAgents/com.pcv.hlpramcn.plist
	/Library/LaunchAgents/com.techyutil.maftask.plist
	/Library/LaunchAgents/com.techyutil.mafuninstaller.plist
	/Library/Logs/Advanced\ Mac\ Cleaner.log
	/Library/Logs/helperamc.log
	/Library/Logs/Mac\ Auto\ Fixer.log
	/Library/Logs/maftask.log
	/Library/Mac\ Auto\ Fixer
	/Library/Mac\ Mechanic
	/Library/Mac\ Tonic
	/Library/MacOptimizer
	/Library/Preferences/com.pcv.hlpramc.plist
	/Library/Preferences/com.PCvark.Advanced-Mac-Cleaner.plist
	/Library/Preferences/com.techyutil.macautofixer.plist
	/Library/Preferences/com.techyutil.maftask.plist
	/Library/Preferences/com.techyutil.mafuninstaller.plist
	/Library/Preferences/com.techyutils.cleaner.plist
)

#################
### Functions ###
#################

function deleteItems()
{
	declare -a toDelete=("${!1}")

	for item in "${toDelete[@]}"
		do
			if [[ ! -z "${2}" ]]
				then
					item=("${2}""${item}")
			fi

			echo "Looking for $item"

			if [ -e "${item}" ]
				then
					echo "Removing $item"
					rm -rf "${item}"
			fi
		done
}

####################
### Main Program ###
####################

# Kill the apps, if they are running
echo "Killing Advanced Mac Cleaner-related apps"
killall "Advanced Mac Cleaner"
killall "Mac Auto Fixer"
killall "Mac Mechanic"
killall "Mac Tonic"
killall "MacOptimizer"
killall "maf"

# Delete system level items
echo "Deleting System Items"
deleteItems systemItems[@]

# Delete user level items
echo "Deleting User Items"
for dirs in /Users/*/
		do
			deleteItems userItems[@] "${dirs}"
		done

exit 0
