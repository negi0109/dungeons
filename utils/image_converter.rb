require 'chunky_png'

class ImageConverter
    def self.array_convert(array, color, filename)
        png = ChunkyPNG::Image.new(array[0].length, array.length, ChunkyPNG::Color::BLACK)
        array.each_with_index do |a, y|
            a.each_with_index do |c, x|
                png[x, y] = ChunkyPNG::Color(color[c])
            end
        end
        png.save(filename, :interlace => true)
    end
end
