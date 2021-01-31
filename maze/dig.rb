require './utils/image_converter'

N = 10
SizeY = 1 + 2 * (N + 1)
SizeX = 1 + 2 * N
Maze = Array.new(SizeY) do
    Array.new(SizeX, false)
end

def check(y, x)
    rr = []
    rr.push([1, 0]) if y < SizeY - 2 && !Maze[y + 2][x]
    rr.push([0, 1]) if x < SizeX - 2 && !Maze[y][x + 2]
    rr.push([-1, 0]) if y > 2 && !Maze[y - 2][x]
    rr.push([0, -1]) if x > 2 && !Maze[y][x - 2]

    rr
end

def dig(a)
    Maze[a[0]][a[1]] = true
    until (rr = check(a[0], a[1])).length == 0 do
        r = rr.sample
        Maze[a[0] + r[0]][a[1] + r[1]] = true
        dig([a[0] + r[0] * 2, a[1] + r[1] * 2])
    end
end

dig([1, 1])

# Maze.each_with_index do |a, i|
#     puts "%2d " % i + a.map{|x| x ? ' ' : '@' }.join
# end

ImageConverter.array_convert(Maze, { true => 'white',  false => 'black' }, 'maze.dig.png', 5)
