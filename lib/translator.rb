require 'pry'
require 'yaml'
#path = YAML.load_file('lib/emoticons.yml')



def load_library (path)
  emoticons = YAML.load_file('lib/emoticons.yml')
    library = {}
  emoticons.each do |emotion, expression|
    library[emotion] = {}
    english_expression = expression[0]
    japanese_expression = expression[1]
    library[emotion][:english] = english_expression
    library[emotion][:japanese] = japanese_expression
  end
  library
end



def get_japanese_emoticon (path, emoticon)
  library = load_library(path)
  japanese_emoticon = "Sorry, that emoticon was not found"
  library.each do |emotion, expression|
      if expression[:english] == emoticon
        japanese_emoticon = expression[:japanese]
    end
  end
  japanese_emoticon
end


def get_english_meaning(path, emoticon)
  library = load_library(path)
  english_meaning = "Sorry, that emoticon was not found"
  library.each do |emotion, expression|
      if expression[:japanese] == emoticon
        english_meaning = emotion
    end
  end
  english_meaning
end
