# #!/bin/bash -u

echo "This will configure terminus on your system."
echo "Checking your bashrc"

#script functions
lowercase() {
	echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

displayOperatingSystemInformation() {
	OS=`lowercase \`uname\``
	KERNEL=`uname -r`
	MACH=`uname -m`

	if [ "{$OS}" == "windowsnt" ]; then
		OS=windows
	elif [ "{$OS}" == "darwin" ]; then
		OS=mac
	else
		OS=`uname`
		if [ "${OS}" = "SunOS" ] ; then
			OS=Solaris
			ARCH=`uname -p`
			OSSTR="${OS} ${REV}(${ARCH} `uname -v`)"
		elif [ "${OS}" = "AIX" ] ; then
			OSSTR="${OS} `oslevel` (`oslevel -r`)"
		elif [ "${OS}" = "Linux" ] ; then
			if [ -f /etc/redhat-release ] ; then
				DistroBasedOn='RedHat'
				DIST=`cat /etc/redhat-release |sed s/\ release.*//`
				PSUEDONAME=`cat /etc/redhat-release | sed s/.*\(// | sed s/\)//`
				REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
			elif [ -f /etc/SuSE-release ] ; then
				DistroBasedOn='SuSe'
				PSUEDONAME=`cat /etc/SuSE-release | tr "\n" ' '| sed s/VERSION.*//`
				REV=`cat /etc/SuSE-release | tr "\n" ' ' | sed s/.*=\ //`
			elif [ -f /etc/mandrake-release ] ; then
				DistroBasedOn='Mandrake'
				PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
				REV=`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`
			elif [ -f /etc/debian_version ] ; then
				DistroBasedOn='Debian'
				DIST=`cat /etc/lsb-release | grep '^DISTRIB_ID' | awk -F=  '{ print $2 }'`
				PSUEDONAME=`cat /etc/lsb-release | grep '^DISTRIB_CODENAME' | awk -F=  '{ print $2 }'`
				REV=`cat /etc/lsb-release | grep '^DISTRIB_RELEASE' | awk -F=  '{ print $2 }'`
			fi
			if [ -f /etc/UnitedLinux-release ] ; then
				DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`]"
			fi
			OS=`lowercase $OS`
			DistroBasedOn=`lowercase $DistroBasedOn`
			# readonly OS
			# readonly DIST
			# readonly DistroBasedOn
			# readonly PSUEDONAME
			# readonly REV
			# readonly KERNEL
			# readonly MACH
		fi
	fi
	echo $DistroBasedOn
	echo $DIST
	echo $PSUEDONAME
}

createDefaultBashProfile() {
	bashProfileText[0]="# Get the aliases and functions"
	bashProfileText[1]="if [ -f ~/.bashrc ]; then"
	bashProfileText[2]="    . ~/.bashrc"
	bashProfileText[3]="fi"
	bashProfileText[4]=""
	bashProfileText[5]="# User specific environment and startup programs"
	bashProfileText[6]=""
	bashProfileText[7]="#PATH=$PATH:$HOME/bin"
	bashProfileText[8]="#BASH_ENV=$HOME/.bashrc"
	bashProfileText[9]="#USERNAME="root""
	bashProfileText[10]=""
	bashProfileText[11]="#export USERNAME BASH_ENV PATH"

	if [[ ! -f ~/.bash_profile ]]; then
		echo ".bash_profile doesn't exists. Creating new default"
		for i in "${bashProfileText[@]}"
		do
			echo $i >> ~/.bash_profile
		done
	fi
}

createBashProfileTerminusLink() {
	terminusInstalled=$(grep terminus ~/.bash_profile)
	if [[ -n $terminusInstalled ]]; then
		return 0
	fi
	terminusDirectory=$(pwd)
	terminusSettingsText[0]=""
	terminusSettingsText[1]="# start terminus inclusion"
	terminusSettingsText[2]="if [ -f $terminusDirectory/terminus-settings ]; then"
	terminusSettingsText[3]="    . $terminusDirectory/terminus-settings"
	terminusSettingsText[4]="fi"
	terminusSettingsText[5]="# end terminus inclusion"

	if [[ -f ~/.bash_profile ]]; then
		echo "Adding terminus."
		for i in "${terminusSettingsText[@]}"
		do
			echo $i >> ~/.bash_profile
		done
	fi
}

displayOperatingSystemInformation
createDefaultBashProfile
createBashProfileTerminusLink
./setup.sh

# #global variables
# export DEBUG_MODE_SET="TRUE"
# export SETUP_FILE_DIRECTORY=
#export OPERATING_SYSTEM=$(uname -v)

# #script constants
# SCRIPT_DIRECTORY=$(pwd)

# #initializations
# SETUP_FILE_DIRECTORY="$SCRIPT_DIRECTORY/ginko"

# #include debugging-tools.sh
# source debugging-tools.sh

# outputDebugInfo "!!The current script is running in debug mode!!"
# outputDebugInfo "$SETUP_FILE_DIRECTORY"

# #script constants
# TERMINUS_SETUP_FILE=$($SETUP_FILE_DIRECTORY/setup.sh)

# #check to make sure the terminus setup file exists
# if [[ ! -f $TERMINUS_SETUP_FILE ]]; then
# 	outputDebugInfo "The setup file is missing."
# 	exit 1;
# fi

# #run the setup file
# outputDebugInfo "Run the setup file"
# $($TERMINUS_SETUP_FILE)


# .bash_profile

