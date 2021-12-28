<!--
SPDX-FileCopyrightText: 2020 Simpel <stream-observer@simpel.cc>

SPDX-License-Identifier: MIT
-->

# Stream-Observer

Stream-Observer (strobs) is a script to observe running voc video streams.  
The script opens mpv with all active (currently streaming) streams from [Chaos Computer Club](https://www.ccc.de/en) made by [VOC](https://c3voc.de) (video operation center) in a playlist as found at [https://streaming.media.ccc.de](https://streaming.media.ccc.de).
Optionally it can also try to open all streams given in a valid playlist.

Execute `./strobs`.\
If you face error '_Permission denied_' and `test -x strobs && echo true || echo false` returns '_false_' make strobs executable with `chmod +x strobs`.

### Requirements
Install [mpv](https://mpv.io/installation) if not existing.

## Table of contents
* [Options](#options)
* [Details](#details)
* [Examples](#examples)
* [Files](#filez)
* [Keys and shortcuts](#keys-and-shortcuts)
  * [defined by lua scripts](#defined-by-lua-scripts)
  * [defined defaults by input.conf](#defined-defaults-by-inputconf)
* [Fixed mpv options](#fixed-mpv-options)

## Options
Usage: strobs [ -d | -D | -f | -h | -j | -k | -m | -n | -p _file_ | -s | -t | -v | -V | -x]
* -d debug mode: print commands and arguments while executed
* -D debug mode: print script lines while read
* -f forces (with -p / -j) open playlist / download full json
* -h help shown
* -j json export to disk
* -k keys/shortcuts shown (`input.conf` needed)
* -m man page shown (`strobs.1` needed)
* -n name stream with technical extension
* -p playlist _file_ with servers in format m3u8
* -s sort server list alphanumerical
* -t timetable of running and coming events shown
* -v verbosity increasing with _v_
* -V version print
* -x exit before mpv, keeps current-playlist.m3u8

## Details
The script downloads [http://live.ber.c3voc.de:7999/status-json.xsl](http://live.ber.c3voc.de:7999/status-json.xsl) and searches for active (current streaming) streams.
It reads then [https://streaming.media.ccc.de/streams/v2.json](https://streaming.media.ccc.de/streams/v2.json) and extracts end time of the streams and their display names.
With this informations it builds a playlist in m3u8 format and starts mpv with this playlist.

## Examples
`strobs`
>opens current streams in mpv.

`strobs -p 36c3.m3u8 -s`
>uses the playlist 36c3.m3u8 for mpv.
In addition it will sort the returned streams alphanumerical.

`strobs -j -f`
>will download and save status_liveber.xsl, status_ingest.xsl, current.json and exit before opening mpv.
In addition it will save json including past events.

## Files<a id="filez"></a>
* `current-playlist.m3u8` - generated playlist while running
* `input.conf` - user-defined key bindings for mpv
* `keys.lua` - script with key bindings for audio, video and rooms
* `strobs` - the shell script to execute
* `strobs.1` - man page
* `voctocat.gif` - temporary image used as last playlist item

Only `strobs` is absolutely necessary to observe running voc video streams.

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
* i toggle transport osd
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
* --input-conf=${progpath}input.conf
  * look for configuration file in the same directory where strobs is starting
* --load-scripts=no
  * don't load any scripts from personal config
* --scripts=keys.lua
  * load these script:${progpath}keys.lua
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
* --force-seekable=no
  * don't try to seek stream earlier than cache
* --image-display-duration=inf
  * the image is kept open forever, the player will not pause
* --screenshot-format=png
  * set the screenshot image file type to png (default: jpg)
* --script-opts=osc-visibility=always,osc-seekbarstyle=knob
  * visibility mode of on screen controller
  * style of the playback position marker as round knob
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
