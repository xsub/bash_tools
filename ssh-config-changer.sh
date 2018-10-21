#!/usr/bin/env bash

# On each run make/replace a filesystem symbolic $link to next file in $targets array.
# Meant for ssh configs rotation; Adaptable to anything that needs a link to next in list.

# xsub's bash tools: subdcc@gmail.com


# display what you doing and do it
function act {
	echo "$0: DOING: $1"
	return `$1`
}

link="/home/"${USER}"/.ssh/config"

# files to be linked by $link
targets=(/home/${USER}/.ssh/config.real /home/${USER}/.ssh/config.wdc)

# get ls -l output into array of strings
txt_arr=(`ls -l ${link}`)
link_token=${txt_arr[10]}

echo "LINK TOKEN: ${link_token}"

for target in ${targets[*]} 
do	
	((tgt_cnt++))
	echo -en "TARGET ID: ${tgt_cnt}, TARGET: ${target} STATUS: "
    
    #check every file processed
    [ -f ${target} ] || act "NEEDS FIX! ABORTING; exit 1;"
    echo "OK"
	
	if [ "$link_token" == "$target" ]
	then
		# set link to next in list
		if [ $((tgt_cnt)) -eq ${#targets[@]} ]
		then
			# current element is last in array, "circulate" now (loop to 1st el) :D
			real_target=${targets[0]}
		else
			real_target=${targets[$tgt_cnt]}
		fi

		echo "REAL TARGET: ${real_target}"
		if [ -f ${real_target} ] 
		then
			act "ln -sf ${real_target} ${link}"
		fi
		
		# quick loop break
		exit 0 #$?
	fi

done
