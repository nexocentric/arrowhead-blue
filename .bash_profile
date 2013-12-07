# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# User specific environment and startup programs

#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/nexocentric/bin
#BASH_ENV=/home/nexocentric/.bashrc
#USERNAME=root

#export USERNAME BASH_ENV PATH

# start terminus inclusion
command_not_found_handle() {
	echo "$1"
	echo "you made a boo boo"
}
if [ -f /development/terminus/terminus-settings ]; then
. /development/terminus/terminus-settings
fi
# end terminus inclusion
