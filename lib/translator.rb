require "yaml"
require "pry"

angelEng = "12121"
angelJap = "☜(⌒▽⌒)☞"

path = './lib/emoticons.yml'

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  emoticons.each do |key, value|
    if !new_hash[key]
      new_hash[key] = {}
    end
    
    if !new_hash[key][:english]
      new_hash[key][:english] = {}
    end
    
    if !new_hash[key][:japanese]
      new_hash[key][:japanese] = {}
    end
    
    if !new_hash[key][:japanese][value[0]]
      new_hash[key][:japanese][value[0]]
    end
    
    if !new_hash[key][:english][value[1]]
      new_hash[key][:english][value[1]]
    end
    
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end
  new_hash

end


def get_english_meaning (path, emoticon)
  
  iconHash = load_library(path)
  #binding.pry
  result = iconHash.select{|key, hash| hash[:japanese] == emoticon}.keys
  if result == []
    return "Sorry, that emoticon was not found" 
  end
  #binding.pry
  result[0]
end



def get_japanese_emoticon (path, emoticon)
  string = ""
  iconHash = load_library(path)
  result = iconHash.select{|key, hash| hash[:english] == emoticon}.keys
  if result == []
    return "Sorry, that emoticon was not found" 
  end
  string = result[0]
  result = iconHash[string][:japanese]
  #binding.pry
  
  result
  #binding.pry
end

















