require'pry'
require "yaml"

def load_library(file_path)
 emoticons = YAML.load_file(file_path)

  new_hash = {
   'key1' => {},
   'key2' => {}
 }

  emoticons.each do |key,value|
   new_hash['key1'][value[0]] = emoticons[key][1]
   new_hash['key2'][value[1]] = key
 end

  new_hash
end
#binding.pry


def get_japanese_emoticon(file_path, emoticon)
 result = load_library(file_path)['key1'][emoticon]
 #binding.pry
 if result
    result
 else
  "Sorry, that emoticon was not found"
 end
end

def get_english_meaning(path, emoticon)
 result = load_library(path)['key1'][emoticon]
 if result
    result
 else
   "Sorry, that emoticon was not found"
 end
 #binding.pry
end
 