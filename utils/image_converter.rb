require 'chunky_png'

class ImageConverter
    def self.array_convert(array, color, filename, scale = 1)
        png = ChunkyPNG::Image.new(array[0].length * scale, array.length * scale, ChunkyPNG::Color::BLACK)
        array.each_with_index do |a, y|
            a.each_with_index do |c, x|
                scale.times do |i|
                    scale.times do |j|
                        png[x * scale + j, y * scale + i] = ChunkyPNG::Color(color[c])
                    end
                end
            end
        end
        png.save(filename, :interlace => true)
    end
end

png = ChunkyPNG::Image.new(1, 2, ChunkyPNG::Color::TRANSPARENT)
png[0,0] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
png[0,1] = ChunkyPNG::Color('black @ 0.5')
png.save('filename.png', :interlace => true)
