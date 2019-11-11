#!/bin/bash

################################################################################
#
# Author:		Max-Hollywood
# Filename:		waller.sh
# Copyright (C) Max Hollywood 2019.
#
################################################################################
#
# Changes the wallpaper over a set amount of time for the Raspberry Pi 3B+.
#
# Run with the directory as an argument you want to load wallpapers from.
# Uncomment the sub directories block to load any images in the sub directories
# of the initial directory you specified.
#
################################################################################

# TODO:	Specify to only consider files with a specific phrase in the name.
# TODO:	Count how many times each wallpaper has been used, and use less used
#		wallpapers more frequently.

path="$1"
shift
files=()
filesfound="0"
index="0"
timeout="60"
OPTIONS="vs"
verbose="false"
singleton="false"
readonly PC="pcmanfm -w"

# build file list
# seems odd not to quote this:
for file in $path/*.jpg ; do
	if [[ -e "$file" ]] ; then
		files+=("$file")
		((filesfound++))
	fi
done
for file in $path/*.png ; do
	if [[ -e "$file" ]] ; then
		files+=("$file")
		((filesfound++))
	fi
done


# Set options
while getopts "$OPTIONS" option ; do
	case "$option" in
		v)
			verbose="true"
			;;
		s)
			singleton="true"
			;;
	esac
done

# This can be used for sub directories
#for file in $path/*/*.jpg ; do
#	echo "Found in sub-directory: $file"
#done

# run loop to change wallapper
while true ; do

	if [[ $filesfound -gt "0" ]] ; then
		index="$(expr $RANDOM % $filesfound)"
		image="${files[$index]}"

		# Verbose mode
		if [[ "$verbose" == "true" ]] ; then
			echo "$image"
		fi

		$PC $image

		# Singleton mode
		if [[ "$singleton" == "true" ]] ; then
			if [[ "$verbose" == "true" ]] ; then
				echo "Exiting due to singleton"
			fi
			break;
		fi

		sleep "$timeout"
	else
		echo "No images found in $path"
		break
	fi


done

