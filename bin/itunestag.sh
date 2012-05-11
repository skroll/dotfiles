cd_dir=$1
artist=$2
album=$3
year=$4
genre=$5

cd "$cd_dir"

for i in *.mp3; do
	name=`echo "$i" | sed -e 's/[0-9][0-9] \(.*\)\.mp3/\1/'`
	track=`echo "$i" | sed -e 's/\([0-9][0-9]\) .*\.mp3/\1/'`
	eyeD3 --artist="$artist" --album="$album" --year=$year --genre="$genre" --title="$name" --track=$track "$i"
done

eyeD3 --rename="%A - %a - %n - %t" *.mp3

cd ..

mv "$cd_dir" "$artist - ($year) $album"
