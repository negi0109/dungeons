N = 10
Size = 1 + 2 * N
Maze = Array.new(Size) do
    Array.new(Size, false)
end

def check(x, y)
    rr = []
    rr.push([1, 0]) if x < Size - 2 && !Maze[x + 2][y]
    rr.push([0, 1]) if y < Size - 2 && !Maze[x][y + 2]
    rr.push([-1, 0]) if x > 2 && !Maze[x - 2][y]
    rr.push([0, -1]) if y > 2 && !Maze[x][y - 2]

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

Maze.each_with_index do |a, i|
    puts "%2d " % i + a.map{|x| x ? ' ' : '@' }.join
end

# 0  @@@@@@@@@@@@@@@@@@@@@
# 1  @     @             @
# 2  @@@@@ @ @@@@@@@@@@@ @
# 3  @   @ @   @     @   @
# 4  @ @@@ @@@ @@@@@ @ @ @
# 5  @ @   @       @ @ @ @
# 6  @ @ @@@@@@@@@ @ @ @ @
# 7  @   @       @   @ @ @
# 8  @ @@@@@ @@@ @@@ @ @ @
# 9  @       @ @   @ @ @ @
# 10 @@@@@@@@@ @@@ @@@ @ @
# 11 @   @       @   @ @ @
# 12 @ @ @ @@@@@ @@@ @ @ @
# 13 @ @ @     @   @ @ @ @
# 14 @ @ @@@@@ @ @@@ @ @ @
# 15 @ @       @   @   @ @
# 16 @ @@@@@@@@@@@ @@@@@ @
# 17 @     @     @     @ @
# 18 @@@@@ @@@ @ @@@@@ @ @
# 19 @         @     @   @
# 20 @@@@@@@@@@@@@@@@@@@@@
