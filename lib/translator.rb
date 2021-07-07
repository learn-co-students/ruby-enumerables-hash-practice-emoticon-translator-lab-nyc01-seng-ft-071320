# require modules here
require 'pry'
require 'yaml'


def load_library (emoticons)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  results = emoticons.each_with_object({}) do |(key, value), final_hash|
    if !final_hash[key]
      final_hash[key] = {
        :english => value[0],
        :japanese => value[1]
      }
    # binding.pry
    end
  end
  results
end

def get_japanese_emoticon(file_path, eng_emoticon)
  emoticons = load_library(file_path)
  japanese_equiv = ""
  emoticons.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_value == eng_emoticon
        japanese_equiv = value[:japanese]
      end  
    end
  end
  if japanese_equiv == ""
    japanese_equiv = "Sorry, that emoticon was not found"
  end
  japanese_equiv
 # binding.pry
end

def get_english_meaning(file_path, jap_emoticon)
  
  emoticons = load_library(file_path)
   
  english_name = ""
  emoticons.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_value == jap_emoticon
        english_name = key
      # binding.pry
      end  
    end
  end
  if english_name == ""
    english_name = "Sorry, that emoticon was not found"
  end
  english_name
 # binding.pry
end