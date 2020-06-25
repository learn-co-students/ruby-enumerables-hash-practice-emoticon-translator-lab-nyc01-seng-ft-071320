# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  # code goes here
  emot = YAML.load_file(file)
  emot.each_with_object({}) do |(key, value), final_hash|
    final_hash[key] = {}
    value.each do |icons|
      if(final_hash[key][:english] == nil)
        final_hash[key][:english] = icons
      else
        final_hash[key][:japanese] = icons
      end
    end
    final_hash
  end
end

def get_japanese_emoticon(dictionary, icon)
  # code goes here
  lib = load_library(dictionary)
  lib.each do |key, value|
    if(value[:english] == icon)
     return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(dictionary, icon)
  # code goes here
  lib = load_library(dictionary)
  lib.each do |key, value|
    if(value[:japanese] == icon)
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end







