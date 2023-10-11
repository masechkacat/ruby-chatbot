require 'http'
require 'json'
require 'dotenv'

Dotenv.load

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/engines/text-babbage-001/completions"


  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }

  loop do 
    puts "A toi: (pour terminer rentres 'exit')"
    user_prompt = gets.chomp
  break if user_prompt == 'exit'


data = {
  "prompt" => user_prompt,
  "max_tokens" => 500,
  #"n" => 5,
  "temperature" => 0
}

response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip

puts "GPT: #{response_string}"

end

