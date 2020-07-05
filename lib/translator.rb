# require modules here
require 'yaml'
def load_library(file_path)
  # code goes here
  emoticon = YAML.load_file("lib/emoticons.yml")
  some_emoticons = {}
  emoticon.each do |name, arrays|
    some_emoticons[name] = {}
    some_emoticons[name][:english] =
    arrays[0]
    some_emoticons[name][:japanese] = arrays[1]
end
some_emoticons
end

def get_japanese_emoticon(file_path, eng_emo)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, emotes|
    return emotes[:japanese] if
    emotes[:english] == eng_emo
  end
  # code goes here
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emo)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, emotes|
    return meaning if 
    emotes[:japanese] == jap_emo
  end
  "Sorry, that emoticon was not found"
  # code goes here
  
end