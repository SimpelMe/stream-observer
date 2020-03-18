-- Sets the venue to look at

options = require 'mp.options'

-- define keys
local opts = {
  zero  = '0',
	one = '1',
	two = '2',
	three  = '3',
	four  = '4',
	five  = '5',
	six  = '6',
	seven  = '7',
	eight  = '8',
	nine  = '9'
}

options.read_options(opts)

-- off by one
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

mp.add_forced_key_binding(opts.zero, "Select_Venue_0", select_venue_0)
mp.add_forced_key_binding(opts.one, "Select_Venue_1", select_venue_1)
mp.add_forced_key_binding(opts.two, "Select_Venue_2", select_venue_2)
mp.add_forced_key_binding(opts.three, "Select_Venue_3", select_venue_3)
mp.add_forced_key_binding(opts.four, "Select_Venue_4", select_venue_4)
mp.add_forced_key_binding(opts.five, "Select_Venue_5", select_venue_5)
mp.add_forced_key_binding(opts.six, "Select_Venue_6", select_venue_6)
mp.add_forced_key_binding(opts.seven, "Select_Venue_7", select_venue_7)
mp.add_forced_key_binding(opts.eight, "Select_Venue_8", select_venue_8)
mp.add_forced_key_binding(opts.nine, "Select_Venue_9", select_venue_9)
