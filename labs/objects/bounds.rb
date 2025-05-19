class Point
    attr_accessor :x, :y

    def initialize(x, y)
        @x, @y = x, y
    end

    def to_s
        "(#{x}, #{y})"
    end
end

class Bounds
    attr_reader :min_x, :min_y, :max_x, :max_y

    def initialize
        @min_x = @min_y = @max_x = max_y = nil
    end

    def empty
        @min_x.nil?
    end

    def enclose(point)
        @min_x = point.x if @min_x.nil? || point.x < @min_x
        @max_x = point.x if @max_x.nil? || point.x > @max_x
        @min_y = point.y if @min_y.nil? || point.y < @min_y
        @max_y = point.y if @max_y.nil? || point.y > @max_y
    end

    def to_s
        "B = [#{[Point.new(min_x, min_y), Point.new(max_x, min_y), Point.new(max_x, max_y), Point.new(min_x, max_y)].join(", ")}]"
      end
end

filename = "desmos.txt"
points = File.read(filename).lines.map { |line| x, y = line.split(",").map(&:to_i); Point.new(x, y) }

# Compute bounding box
bounds = Bounds.new
points.each { |point| bounds.enclose(point) }

# Output points and bounding box
puts "Points: [#{points.join(", ")}]"
puts bounds