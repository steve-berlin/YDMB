echo "Link: "
read -r link
echo "Audio format (type in: best, aac, alac, flac, m4a, mp3, opus, vorbis or wav): "
read -r format
yt-dlp -U --update-to nightly --abort-on-error --verbose -x --audio-format $format $link
