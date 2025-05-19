teams = [["Fern", "Wilbur", "Templeton"], ["Milo", "Addie", "Doc"]]
first = teams.map(&:first)
p first

files = ["file0.txt", "file1.txt"]
files2 = ["file1.txt", "file01.txt"]
exist = files.map { |file| File.exist?(file) }.inject(:&)
nonexist = files2.map { |file| File.exist?(file) }.inject(:&)
p exist
p nonexist

tokens = ["girafarig", "level", "test", "world", "farigiraf", "azure", "swag", "idk", "valentine"]
matching_tokens = tokens.filter { |token| token[0] == token[-1] }
p matching_tokens

message = "Hello world"
ascii_values = message.chars.map(&:ord)
p ascii_values

entries = ["hello", nil, "world"]
entry_please = ["no", "nil", "values"]
has_nil = entries.map(&:nil?).inject(:|)
no_nil = entry_please.map(&:nil?).inject(:|)
p has_nil
p no_nil

magnitude_triplets = [49, 5, 13]
magnitude = magnitude_triplets.inject(0) { |sum, n| sum * 1000 + n }
p magnitude

xs = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
signs = xs.map { |x| x > 0 ? "+" : x < 0 ? "-" : "0" }
p signs

names = ["Alice", "Bob", "Eve"]
bunglers = ["Eve"]
non_bunglers = names.filter { |name| !bunglers.include?(name) }
p non_bunglers