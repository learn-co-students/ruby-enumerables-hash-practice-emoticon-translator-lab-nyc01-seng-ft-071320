# require modules here
  require 'yaml'
  require 'pry'

def load_library(filepath)
  # code goes here
  temp_library = YAML.load_file(filepath)
  library = {}
  temp_library.each do |key,value|
    library[key] = {
        :english => value[0],
        :japanese => value[1]
        }
  end
  library
end


def get_japanese_emoticon(filepath,english_emoticon)
  # code goes here
  library = load_library(filepath)
  japanese_emoticon = "Sorry, that emoticon was not found"
   library.each do |emotion, description|
     if library[emotion][:english] == english_emoticon
       japanese_emoticon = library[emotion][:japanese]
     end
   end
   japanese_emoticon
end

def get_english_meaning(filepath,japanese_emoticon)
  # code goes here
  library = load_library(filepath)
  # emotion = (library.detect do |emotion,description|
  #     library[emotion][:japanese] == japanese_emoticon
  # end)
  # emotion_string = emotion[0]
  emoticon = "Sorry, that emoticon was not found"
   library.each do |emotion, description|
     if library[emotion][:japanese] == japanese_emoticon
       emoticon = emotion.to_s
     end
   end
   emoticon
end
