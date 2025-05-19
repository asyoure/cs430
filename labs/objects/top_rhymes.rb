require 'net/http'
require 'uri'
require 'json'

class Rhymes
    attr_reader :word, :score

    def initialize(word, score)
    @word = word
    @score = score
  end
end

def top_rhymes(word, score)
uri = URI.parse("https://rhymebrain.com/talk?function=getRhymes&word=#{word}")
  response = Net::HTTP.get(uri)
  rhymes_data = JSON.parse(response)

  # Convert parsed data to an array of Rhyme objects
  rhymes = rhymes_data.map { |r| Rhymes.new(r["word"], r["score"]) }

  # Filter rhymes by score threshold
  rhymes.select { |r| r.score >= score }
end

word = ARGV[0]
score_threshold = ARGV[1].to_i

# Fetch and print the top rhymes
puts top_rhymes(word, score_threshold).map(&:word)