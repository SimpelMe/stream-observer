-- Sets q, w and e to audio native, translate 1 and translate 2
-- Currently native is always falsely mapped to the last audio stream

options = require 'mp.options'

-- define keys
local opts = {
	one = 'q',
	two = 'w',
	three  = 'e'
}
options.read_options(opts)


function select_audio_native()
  count = mp.get_property_number('track-list/count', 0)
  count = count - 1
  mp.set_property("aid", count)
end

function select_audio_trans1()
  mp.set_property("aid", 1)
end

function select_audio_trans2()
  count = mp.get_property_number('track-list/count', 0)
  count = count - 2
  mp.set_property("aid", count)
end

mp.add_forced_key_binding(opts.one, "Select_Audio_1", select_audio_native)
mp.add_forced_key_binding(opts.two, "Select_Audio_2", select_audio_trans1)
mp.add_forced_key_binding(opts.three, "Select_Audio_3", select_audio_trans2)
