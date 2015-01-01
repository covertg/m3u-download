#!/bin/bash
playlist=$1
outputdir=${2%/}

if [ ! -d $outputdir ]; then
	echo -e "Making folder $outputdir\n"
	mkdir -p $outputdir
fi

declare -i lines=$(wc -l < $playlist)
declare -i songs=($lines-1)/2

for ((song = 1; song <= $songs; song++)); do
	songtitle="$(awk "NR==$song*2 {print}" $playlist | cut -d',' -f2)"
	echo "$song/$songs Downloading $songtitle"
	
	songlink="$(awk "NR==$song*2+1 {print}" $playlist)"
	curl $songlink -o "$outputdir/$song $songtitle.mp3" -s
done

echo "All songs downloaded."
