# require modules here
require 'pry'

def load_library(file_path)
  # code goes here
  require "yaml"
  emoticons = YAML.load_file(file_path)
  #binding.pry
  final_result = emoticons.each_with_object({}) do |(key, value), final_hash|
    final_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  #binding.pry
  final_result
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    if emoticons[key][:english] == emoticon
      return emoticons[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
    emoticons = load_library(file_path)
  emoticons.each do |key, value|
    if emoticons[key][:japanese] == emoticon 
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end

