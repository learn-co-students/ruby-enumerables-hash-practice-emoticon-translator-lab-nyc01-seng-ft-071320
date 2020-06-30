require "yaml"

def load_library(filepath)
  emoji = YAML.load_file(filepath)
  emoji_new = {}
  emoji.each do |key, types|
    types.map do |emoticons|
      emoji_new[key] = {}
      emoji_new[key][:english] = types[0]
      emoji_new[key][:japanese] = types[1]
    end
  end
  return emoji_new
end

def get_japanese_emoticon(file, eng_emoji)
library = load_library(file)
  apology = "Sorry, that emoticon was not found"
  x = apology
  library.find do |meanings, emojis|
    if library[meanings][:english] == eng_emoji
      x = library[meanings][:japanese]
    end
  end
  return x
end


def get_english_meaning(file, jap_emoji)
  library = load_library(file)
  apology = "Sorry, that emoticon was not found"
  x = apology
  library.find do |meanings, emojis|
    if library[meanings][:japanese] == jap_emoji
      x = meanings
    end
  end
  return x
end