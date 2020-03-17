# Stream-Observer

Stream-Observer is a script to observe running voc-video-streams.

It is starting stream-observer.m3u8 in mpv with various options:
* --fs
 * full screen
* --keep-open=always
 * don't terminate if the current file is ending and playback will never automatically advance to the next file
* --keep-open-pause=no
 * instead of pausing when --keep-open is active, just stop at end of file and continue playing forward when you seek backwards until end where it stops again (default: yes)
* --idle=yes
 * wait idly instead of quitting when there is no file to play
* --hls-bitrate=min
 * pick the streams with the lowest bitrate
* --script-opts=osc-visibility=always
 * visibility mode of on screen controller
* --audio-stream-silence=yes
 * when pausing playback or stop and restart audio on seeks, audio is not stopped and silence is played
* --demuxer-cache-wait=no
 * don't read data until the demuxer cache has reached maximum capacity
* --demuxer-thread=no
 * run the demuxer in a separate thread and let it prefetch a certain amount of packets (default: yes)
* --osd-duration=5000
 * set the duration of the OSD messages in ms (default: 1000)
* --osd-msg1="switch stream: < >    switch audio: #"
 * show this string as message on OSD with OSD level 1 (visible by default)
 * used as minimal manual
* --osd-font-size=30
 * specify the OSD font size (default: 55)
* --osd-margin-x=10
 * left and right screen margin for the OSD in scaled pixels
* --osd-margin-y=5
 * top and bottom screen margin for the OSD in scaled pixels
