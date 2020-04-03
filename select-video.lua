-- Sets y and x to video stream and slides

options = require 'mp.options'

-- define keys
local opts = {
	one = 'y',
	two = 'x'
}
options.read_options(opts)


function select_video()
  count = mp.get_property_number('track-list/count', 0)
  mp.set_property("vid", 1)
end

function select_slides()
  mp.set_property("vid", 2)
end

mp.add_forced_key_binding(opts.one, "Select_Video", select_video)
mp.add_forced_key_binding(opts.two, "Select_Slides", select_slides)
