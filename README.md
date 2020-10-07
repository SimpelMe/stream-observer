# Stream-Observer

Stream-Observer (strobs) is a script to observe running voc video streams.  
The script opens mpv with all active (currently streaming) streams from [Chaos Computer Club](https://www.ccc.de/en) made by [VOC](https://c3voc.de) (video operation center) in a playlist as found at [https://streaming.media.ccc.de](https://streaming.media.ccc.de).

With further options you can
* try all existing servers
* try all servers that will be, are and were active until given days
* try all servers given in a valid playlist

First make `strobs` executable with `chmod +x strobs`. Then execute `./strobs`.
Install mpv if not existing.

## Table of contents
* [Options](#options)
* [Details](#details)
* [Examples](#examples)
* [Files](#files)
* [Keys and shortcuts](#keys-and-shortcuts)
  * [defined by lua scripts](#defined-by-lua-scripts)
  * [defined defaults by input.conf](#defined-defaults-by-inputconf)
* [Fixed mpv options](#fixed-mpv-options)

## Options
Usage: strobs [ -d | -D | -f _days_ | -h | -j | -k | -m | -n | -p _file_ | -s | -t | -v | -V | -x]
* -d debug mode: print commands and arguments while executed
* -D debug mode: print script lines while read
* -f force to open all planned, active and past streams
    * _days_ to the past are mandatory (to omit set 0)
* -h help shown
* -j json export to disk
* -k keys/shortcuts shown (`input.conf` needed)
* -m man page shown (`strobs.1` needed)
* -n name server with original extension
* -p playlist _file_ with servers in format m3u8
* -s sort server list alphanumerical
* -t timetable of running and coming events shown
* -v verbosity increasing with _v_
* -V version print
* -x exit before mpv, keeps current-playlist.m3u8

## Details
The script downloads [https://streaming.media.ccc.de/streams/v2.json](https://streaming.media.ccc.de/streams/v2.json) and searches for active (current streaming) streams.
It extracts end time of the streams, their server and their display names.
With this informations it builds a playlist in m3u8 format and starts mpv with this playlist.

## Examples
`strobs`
>opens current streams in mpv.

`strobs -f 30 -s`
>reads [https://streaming.media.ccc.de/streams/v2.json?forceopen=1](https://streaming.media.ccc.de/streams/v2.json?forceopen=1) and collects all present as well as future streams.
And it looks 30 days in to the past.
The days argument is mandatory.
If you don't want to look in to the past you have to set days to 0.
In addition it will sort the returned server names alphanumerical.

`strobs -p 36c3.m3u8`
>uses the playlist 36c3.m3u8 for mpv.

`strobs -j -x`
>will save the downloaded json to current.json and exit before opening mpv.

## Files
* `current-playlist.m3u8` - generated playlist while running
* `input.conf` - user-defined key bindings for mpv
* `keys.lua` - script with key bindings for audio, video and rooms
* `strobs` - the shell script to execute
* `strobs.1` - man page
* `voctocat.png` - image used as last playlist item, so mpv does not stop

Only `strobs` is absolutely necessary observe running voc video streams.

## Keys and shortcuts
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

## Fixed mpv options
It is starting a playlist in mpv with following options:
* --fs
  * full screen
* --no-ytdl
  * disable the youtube-dl hook-script (404 should try next stream immediately)
* --msg-level=all=error,ffmpeg=fatal
  * all modules just error messages, but ffmpeg/video fatal (because of permanent irrelevant PoC errors)
* --no-input-default-bindings
  * deactivate all default key bindings
* --use-filedir-conf
  * look for configuration file in the same directory as the file that is being played, where strobs is starting (e.g. input.conf for default key bindings)
* --load-scripts=no
  * don't load any scripts from personal config
* --scripts=keys.lua
  * load these script: keys.lua
* --force-window=immediate
  * create the gui immediately on program start
* --keep-open=always
  * don't terminate if the current file is ending and playback will never automatically advance to the next file
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
* --screenshot-format=png
  * set the screenshot image file type to png (default: jpg)
* --script-opts=osc-visibility=always
  * visibility mode of on screen controller
* --osd-duration=5000
  * set the duration of the OSD messages in ms (default: 1000)
*   --osd-msg1="room: 1 – 0       audio: q, w, e - Native, Translated 1, Translated 2       video: y, x - HD, Slides"
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
