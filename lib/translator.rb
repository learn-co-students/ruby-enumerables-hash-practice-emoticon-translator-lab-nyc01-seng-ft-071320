require'pry'
require "yaml"

def load_library(file_path)
 emoticons = YAML.load_file(file_path)
 #binding.pry
new_hash={ }
emoticons.each do |key, value| #key is the hash (names) and value is the array(japanes and english)
   new_hash[key]={ }
   new_hash[key][:english]=value[0]
  new_hash[key][:japanese]=value[1]
  
  #new_hash[key][:english]=value[0]
   
end 

  new_hash
end
#binding.pry


def get_japanese_emoticon(file_path, emoticon)
 # ressources=load_library(file_path)
  translation=""
  ressources=load_library(file_path)
  ressources.each do|key,value|
  if value[:english] == emoticon
   translation=value[:japanese]
 end
 end
 if translation==""
   return "Sorry, that emoticon was not found"
 else 
   return translation
 end
 end 
 
def get_english_meaning(file_path, japanese_emoticon)
  translation= ""
  #binding.pry
  ressources=load_library(file_path)
  ressources.each do|key,value|
  if value[:japanese] == japanese_emoticon
   translation=value[:english]
   translation=key
  # binding.pry
 end
 end
 if translation==""
   return "Sorry, that emoticon was not found"
 else 
   return translation
 end
 end 
 filter_parameter_logging
 