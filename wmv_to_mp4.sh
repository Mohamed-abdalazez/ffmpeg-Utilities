#!/bin/bash

# check if ffmpeg is installed or no
if ! command -v ffmpeg &/dev/null; then
	echo "error!: ffmpeg isn't installed. install it and retry again"
	exit 1
fi


# check if input.wmv file is provided or no
if [ -z "$1" ]; then
	echo "usage: $0 input.wmv"
	exit 1
fi

# the input and output var
input="$1"

output="${input%.wmv}.mp4"


# conversoion command
ffmpeg -i "$input" "$output"

# check the conversion status

if [ $? -eq 0 ]; then
	echo "Conversion done. mp4 file: $output"
else
	echo "Converson faild."
fi
