# Remote Mount (sshfs)
# creates mount folder and mounts the remote filesystem
rmount() {
	local host folder mname
	host="${1%%:*}:"
	[[ ${1%:} == ${host%%:*} ]] && folder='' || folder=${1##*:}
    if [[ ! -z $2 ]]; then
		mname=$2
	else
		mname=${folder##*/}
		[[ "$mname" == "" ]] && mname=${host%%:*}
	fi
	if [[ $(grep -i "host ${host%%:*}" ~/.ssh/config) != '' ]]; then
		mkdir -p ~/mounts/$mname > /dev/null
		sshfs $host$folder ~/mounts/$mname -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=$mname,noappledouble && echo "mounted ~/mounts/$mname"
	else
		echo "No entry found for ${host%%:*}"
		return 1
	fi
}

# Remote Umount, unmounts and deletes local folder (experimental, watch you step)
rumount() {
	if [[ $1 == "-a" ]]; then
		ls -1 ~/mounts/|while read dir
		do
			[[ ! -z $(mount|grep "mounts/$dir") ]] && umount ~/mounts/$dir
			[[ ! -z $(ls ~/mounts/$dir) ]] || rm -rf ~/mounts/$dir
		done
	else
		[[ ! -z $(mount|grep "mounts/$1") ]] && umount ~/mounts/$1
		[[ ! -z $(ls ~/mounts/$1) ]] || rm -rf ~/mounts/$1
	fi
}