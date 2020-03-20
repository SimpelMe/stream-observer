#! /bin/sh

# Set default values:
ALL=unset

# Short manual
manual()
{
  echo "Usage: voc.sh [-a | -h]"
  echo "       opens mpv with all active voc streams"
  echo "       -a tries to open all possible streams"
  echo "       -h shows this help"
  exit 2
}

# Check options
while getopts 'ah' option; do
  case $option in
    a )  ALL=true;shift;;
    h )  manual;;
    * )  manual;;
  esac
done

if [[ $ALL = true ]]; then
  # This playlist has all server
  PLAYLIST="stream-observer.m3u8"
else
  # This playlist should have only server found in https://streaming.media.ccc.de/streams/v2.json
  PLAYLIST="voctocat.png"
fi

# im folgenden curl werden die aktiv laufenden Streams als json ausgegeben
# eventuell kann man damit in der Playlist die aktuellen Säle benennen oder alle inaktiven rauslassen
echo "Aktive Stream als JSON:"
echo "curl https://streaming.media.ccc.de/streams/v2.json"
JSON="$(curl https://streaming.media.ccc.de/streams/v2.json 2>/dev/null)"
echo $JSON
echo "Ende JSON"

# That is really playing
mpv $PLAYLIST \
  --fs \
  --msg-level=ytdl_hook=no \
  --no-input-default-bindings \
  --config-dir=. \
  --load-scripts=no \
  --scripts=select-audio.lua:select-venue.lua:reload.lua \
  --keep-open=always \
  --keep-open-pause=no \
  --idle=yes \
  --hls-bitrate=min \
  --script-opts=osc-visibility=always \
  --audio-stream-silence=yes \
  --demuxer-cache-wait=no \
  --demuxer-thread=yes \
  --osd-duration=5000 \
  --osd-msg1="switch room: 1 … 0        switch audio: q, w, e - native, translated 1, translated 2" \
  --osd-font-size=30 \
  --osd-margin-y=5 \
  --osd-margin-x=10
