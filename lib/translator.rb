# require modules here
require 'pry'
require 'yaml'

file_path = YAML.load_file('./lib/emoticons.yml')

def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  proper_hash = {}

  emoticons.each do |key, value|
    proper_hash[key] = {}
    proper_hash[key][:english] = value[0]
    proper_hash[key][:japanese] = value[1]
    # binding.pry
  end

  proper_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  result = "Sorry, that emoticon was not found"

  library.each do |key, value|
    if library[key][:english] == emoticon
      result = library[key][:japanese]
    end
    # binding.pry
  end
  result
end

# binding.pry

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  result = "Sorry, that emoticon was not found"

  library.each do |key, value|
    if library[key][:japanese] == emoticon
      result = key
    end
    # binding.pry
  end
  result
end
