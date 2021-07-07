require "yaml"
require 'pry'

def load_library(file)
 emoticons = YAML.load_file(file) 
 hash_emo = {}
  emoticons.each do |name,arrays|
      hash_emo[name] ||= {}
      hash_emo[name][:english] = arrays[0]
      hash_emo[name][:japanese] = arrays[1]
 end
# binding.pry
hash_emo
end

# def get_english_meaning(file, emoticon)
#   lib = load_library(file)
#   translated = []
#   lib.each do |meaning, lang|
#     lang.map do |eng, jap|
#       if jap == emoticon
#   translated << meaning
# end
# end
# end
# else
#   return "Sorry, that emoticon was not found"
# end
# end

def get_english_meaning(file, emoticon)
  lib = load_library(file)
  lib.each do |meaning, lang|
    return meaning if lang[:japanese] == emoticon
  end
    "Sorry, that emoticon was not found"
 end 




def get_japanese_emoticon(file, emoticon)
  lib = load_library(file)
  lib.each do |meaning, lang|
      return lang[:japanese] if lang[:english] == emoticon
  end
  "Sorry, that emoticon was not found"
end




