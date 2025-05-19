def take_through(array)
    result = []
    array.each do |element|
        result << element
        break if yield(element)
    end
    result
end

p take_through([10, 9, 8, 7, 5]) { |x| x == 8 }

p take_through(('a'..'z').to_a) { |c| "dog".include?(c) }

sum = 0
p take_through((1..50).to_a) { |x|
    sum += x
    sum > 10
}

# half of the alphabet
p take_through(('a'..'z').to_a) { |c| "m".include?(c)}

#print the alphabet, i guess
p take_through(('a'..'z').to_a) { |c| "z".include?(c) }