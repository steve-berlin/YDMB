echo "Link: "
read -r link
echo 'Download as playlist? (type "yes" or skip)'
read -r isPlaylist
if [[ $isPlaylist=="yes" ]]; then
  $isPlaylist="--yes-playlist"
else
  $isPlaylist="--no-playlist"
fi
if [[ $isPlaylist=="--no-playlist" ]]; then
  yt-dlp --list-formats $link
  echo "Choose an available audio format: "
  read -r format
else
  echo "Choose a download format (type in a supported format like m4a, mp3, mp4 or webm): "
  read -r format
fi
echo "Choose path (default is ~/Music): "
read -r path
if [ $path=="" ]; then
  $path="~/Music"
fi
yt-dlp -U --update-to nightly --abort-on-error --verbose -x -f $isPlaylist "ba[ext=$format]" $link -P "$path"
