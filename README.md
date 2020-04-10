# Stream-Observer

Stream-Observer is a script to observe running voc-video-streams.  
First make `obs` executable with `chmod +x obs`. Then execute `obs`.

* [Options](#options)
* [Keys](#keys)
  * [defined by lua scripts](#defined-by-lua-scripts)
  * [defined defaults by input.conf](#defined-defaults-by-inputconf)

## Options

It is starting stream-observer.m3u8 in mpv with following options:
* --fs
  * full screen
* --no-ytdl
  * disable the youtube-dl hook-script (404 should try next stream immediately)
* --msg-level=all=error,ffmpeg/video=fatal
  * all modules just error messages, but ffmpeg/video fatal (because of permanent irrelevant PoC errors)
* --no-input-default-bindings
  * deactivate all default key bindings
* --config-dir=.
  * place config files where run.sh is starting (e.g. input.conf for default key bindings)
* --load-scripts=no
  * don't load any scripts from personal config
* --scripts=select-audio.lua:select-video.lua:select-venue.lua
  * load these scripts: select-audio.lua, select-video.lua, select-venue.lua
* --force-window=immediate
  * create the gui immediately on program start
* --keep-open=always
  * don't terminate if the current file is ending and playback will never automatically advance to the next file
* --keep-open-pause=no
  * instead of pausing when --keep-open is active, just stop at end of file and continue playing forward when you seek backwards until end where it stops again (default: yes)
* --idle=yes
  * wait idly instead of quitting when there is no file to play
* --vd-lavc-show-all=yes
  * don't wail until an initial keyframe was decoded for a quicker startup
* --no-initial-audio-sync
  * audio is started immediately even if start timestamp differs from video, if necessary video timing is gradually adjusted
* --audio-stream-silence=yes
  * when pausing playback or stop and restart audio on seeks, audio is not stopped and silence is played
* --demuxer-cache-wait=no
  * don't read data until the demuxer cache has reached maximum capacity
* --demuxer-thread=no
  * run the demuxer in a separate thread and let it prefetch a certain amount of packets (default: yes)
* --screenshot-format=png
  * set the screenshot image file type to png (default: jpg)
* --script-opts=osc-visibility=always
  * visibility mode of on screen controller
* --osd-duration=5000
  * set the duration of the OSD messages in ms (default: 1000)
*   --osd-msg1="room: 1 … 0       audio: q, w, e - Native, Translated 1, Translated 2       video: y, x - HD, Slides"
  * show this string as message on OSD with OSD level 1 (visible by default)
  * used as minimal manual
* --no-osd-bar
  * disable display of the OSD bar while seeking
* --osd-font-size=30
  * specify the OSD font size (default: 55)
* --osd-spacing=1
  * horizontal OSD font spacing in scaled pixels (default: 0)
* --osd-border-size=1
  * size of the OSD font border in scaled pixels (default: 3)
* --osd-margin-x=10
  * left and right screen margin for the OSD in scaled pixels
* --osd-margin-y=4
  * top and bottom screen margin for the OSD in scaled pixels

## Keys
### defined by lua scripts
* 1 – 0 room number 1 to 10
* q select native audio
* w select translation 1
* e select translation 2
* y select video mixer output
* x select slides

### defined defaults by input.conf
* RIGHT seek  5
* LEFT  seek -5
* UP    seek  60
* DOWN  seek -60
* Shift+PGUP seek 600
* Shift+PGDWN seek -600
* SPACE cycle pause
* \> playlist-next; skip to next room
* < playlist-previous; skip to previous room
* I (upper i) toggle display stats
* ctrl++ add audio-delay 100ms; this changes audio/video sync
* ctrl+- add audio-delay -100ms
* m cycle mute
* d cycle deinterlace
* \# cycle audio
* _ cycle video
* f cycle fullscreen
* s screenshot
* F8 show rooms
* F9 show list of audio/sub streams
