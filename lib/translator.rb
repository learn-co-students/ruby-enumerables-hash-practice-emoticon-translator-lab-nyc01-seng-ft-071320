require 'pry'
require 'yaml'
path = YAML.load_file('lib/emoticons.yml')



def load_library (path)
  emoticons = YAML.load_file('lib/emoticons.yml')
    library = {}
  emoticons.each do |emotion, expression|
    english_expression = expression[0]
    japanese_expression = expression[1]
    library[emotion] = expression

  end
  library

end



def get_japanese_emoticon(path, library)
  load_library.each do |path|

  end
end

def get_english_meaning(path, library)
  load_library
end
