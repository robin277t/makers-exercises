=begin
an_array = Array.new

an_array.push("Hello World")
an_array.push("It's me!")
an_array.push("Mario!")
an_array.push(5)
an_array.push(6.001)
an_array.push(Object.new)

puts an_array


my_array = ["Hello", "there", "friend!"]
current_index = 0

while true do
  puts "I'm looping!"
  current_index += 1
  if current_index <= my_array.length
      break
  end
end


my_array = ["Hello", "there", "friend!"]
current_index = 0

while current_index < my_array.length do
  puts my_array[current_index]
  current_index += 1
end

my_array = ["Hello", "there", "friend!"]

my_array.each do
  puts my_array
end
=end

test_tweets = [
  "This president sucks!",
  "I hate this Blank House!",
  "I can't believe we're living under such bad leadership. We were so foolish",
  "President Presidentname is a danger to society. I hate that he's so bad – it sucks."
  ]

banned_phrases = ["sucks", "bad", "hate", "foolish", "danger to society"]

test_tweets.each do |tweet|
    banned_phrases.each do |phrase|
        if tweet.include? phrase
            tweet.gsub!"#{phrase}","CENSORED"
            puts tweet
        end
    end
end

#if string includes [array value] gsub CENSURED