require_relative 'grabber'

class Grab

	args = ARGV.to_a
	source_array = Grabber.get_images_source(args[0])
	# puts source_array
	source_array.map do |elem|  
		Grabber.save_image(elem, args[1])
	end
end