require "http"

system "clear"
puts "Welcome to the Dictionary App!"
puts "Please enter a word:"
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=YOURAPIKEY")
definition_data = response.parse(:json)
if definition_data[0]["text"]
  p "The definition is: #{definition_data[0]["text"]}"
else
  p "The definition is: #{definition_data[1]["text"]}"
end

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=YOURAPIKEY")
pronunciation_data = response.parse(:json)
p "The pronunciation is: #{pronunciation_data[0]["raw"]}"

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=YOURAPIKEY")
audio_data = response.parse(:json)
# p audio_data[0]["fileUrl"]
system("open", audio_data[0]["fileUrl"])

