# im folgenden curl werden die aktiv laufenden Streams als json ausgegeben
# eventuell kann man damit in der Playlist die aktuellen Säle benennen oder alle inaktiven rauslassen
echo "Aktive Stream als JSON:"
echo "curl https://streaming.media.ccc.de/streams/v2.json"
curl https://streaming.media.ccc.de/streams/v2.json
echo ""
echo "Ende JSON"

mpv stream-observer.m3u8 \
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
