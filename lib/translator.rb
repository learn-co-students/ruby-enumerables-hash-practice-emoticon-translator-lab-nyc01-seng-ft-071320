require 'yaml'

def load_library(path)
  # code goes here
  emoticons = YAML.load_file('lib/emoticons.yml')
  nested = {}
  emoticons.each do |name, values|
    nested[name] ||= {}
    nested[name][:japanese] = values[1] 
    nested[name][:english] = values[0]
  end 
  nested
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoji_library = load_library('./lib/emoticons.yml')
  emoji_library.each do |name, language|
    if emoticon == language[:english]
      return language[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoji_library = load_library('./lib/emoticons.yml')
  emoji_library.each do |name, language|
    if emoticon == language[:japanese] 
      return name
    end
  end
  "Sorry, that emoticon was not found"
end