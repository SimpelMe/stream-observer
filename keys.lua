-- Sets q, w and e to audio native, translate 1 and translate 2
-- Sets y and x to video stream and slides
-- Sets 1 - 0 to the rooms/streams/venues to look at

options = require 'mp.options'

-- define keys
local opts = {
	-- audio
	a_one = 'q',
	a_two = 'w',
	a_three  = 'e',
	-- video
	v_one = 'y',
	v_two = 'x',
	-- room
	r_zero  = '0',
	r_one = '1',
	r_two = '2',
	r_three  = '3',
	r_four  = '4',
	r_five  = '5',
	r_six  = '6',
	r_seven  = '7',
	r_eight  = '8',
	r_nine  = '9'
}

options.read_options(opts)

-- info
CLEAR_OSD_TIMEOUT = .01 -- Hack for clearing OSD message upon OSC toggle
osc_always_on = true -- defined in strobs

function toggle_osc_auto_always()
  osc_always_on = not osc_always_on
  mp.commandv('script-message', 'osc-visibility',
    osc_always_on and 'always' or 'auto'
  )
  mp.add_timeout(CLEAR_OSD_TIMEOUT, function ()
    mp.osd_message('')
  end)
end

-- audio
function select_audio_native()
  mp.command('show-text "Audio: (1) Native"')
  mp.set_property("aid", 1)
end

function select_audio_trans1()
  mp.command('show-text "Audio: (2) Translated"')
  mp.set_property("aid", 2)
end

function select_audio_trans2()
  mp.command('show-text "Audio: (3) Translated-2"')
  mp.set_property("aid", 3)
end

-- video
function select_video()
  mp.command('show-text "Video: (1) HD"')
  mp.set_property("vid", 1)
end

function select_slides()
  mp.command('show-text "Video: (2) Slides"')
  mp.set_property("vid", 2)
end

-- room (off by one)
function select_venue_1()
  mp.set_property_number('playlist-pos', 0)
end

function select_venue_2()
  mp.set_property_number('playlist-pos', 1)
end

function select_venue_3()
  mp.set_property_number('playlist-pos', 2)
end

function select_venue_4()
  mp.set_property_number('playlist-pos', 3)
end

function select_venue_5()
  mp.set_property_number('playlist-pos', 4)
end

function select_venue_6()
  mp.set_property_number('playlist-pos', 5)
end

function select_venue_7()
  mp.set_property_number('playlist-pos', 6)
end

function select_venue_8()
  mp.set_property_number('playlist-pos', 7)
end

function select_venue_9()
  mp.set_property_number('playlist-pos', 8)
end

function select_venue_0()
  mp.set_property_number('playlist-pos', 9)
end

-- info
mp.add_key_binding(nil, 'toggle-osc-auto-always', toggle_osc_auto_always)
-- audio
mp.add_forced_key_binding(opts.a_one, "Select_Audio_1", select_audio_native)
mp.add_forced_key_binding(opts.a_two, "Select_Audio_2", select_audio_trans1)
mp.add_forced_key_binding(opts.a_three, "Select_Audio_3", select_audio_trans2)
-- video
mp.add_forced_key_binding(opts.v_one, "Select_Video", select_video)
mp.add_forced_key_binding(opts.v_two, "Select_Slides", select_slides)
mp.add_forced_key_binding(opts.r_zero, "Select_Venue_0", select_venue_0)
-- room
mp.add_forced_key_binding(opts.r_one, "Select_Venue_1", select_venue_1)
mp.add_forced_key_binding(opts.r_two, "Select_Venue_2", select_venue_2)
mp.add_forced_key_binding(opts.r_three, "Select_Venue_3", select_venue_3)
mp.add_forced_key_binding(opts.r_four, "Select_Venue_4", select_venue_4)
mp.add_forced_key_binding(opts.r_five, "Select_Venue_5", select_venue_5)
mp.add_forced_key_binding(opts.r_six, "Select_Venue_6", select_venue_6)
mp.add_forced_key_binding(opts.r_seven, "Select_Venue_7", select_venue_7)
mp.add_forced_key_binding(opts.r_eight, "Select_Venue_8", select_venue_8)
mp.add_forced_key_binding(opts.r_nine, "Select_Venue_9", select_venue_9)
