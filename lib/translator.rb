# require modules here
require "yaml"

def load_library(library_path)
  # code goes here
  dictionary = YAML.load_file(library_path)
  dictionary.each do |key, value|
    dictionary[key] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
  dictionary
end

def get_japanese_emoticon (path, emoticon)
  # code goes here
  result = "Sorry, that emoticon was not found"
  dict = load_library(path)
  dict.each do |key,value|
    if dict[key][:english] == emoticon
      result = dict[key][:japanese]
      break
    end
  end
  result
end

def get_english_meaning (path, emoticon)
  # code goes here
  result = "Sorry, that emoticon was not found"
  dict = load_library(path)
  dict.each do |key,value|
    if dict[key][:japanese] == emoticon
      result = key
      break
    end
  end
  result
end
