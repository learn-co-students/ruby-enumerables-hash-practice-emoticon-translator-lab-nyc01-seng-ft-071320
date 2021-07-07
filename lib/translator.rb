# require modules here
require "yaml"
require "pry"

def load_library(file_path)
emo_dic = {}
emoticon_ref = YAML.load_file("./lib/emoticons.yml")
  emoticon_ref.each do |emoticon, array|
  emo_dic[emoticon]={
    english: array[0],
    japanese: array[1]
  }
  end 
emo_dic
end


def get_japanese_emoticon(file_path, e_emo)
  dictionary = load_library("./lib/emoticons.yml")
  dictionary.each do |key, value|
   if e_emo == value[:english] 
       return value[:japanese] 
   end 
 end 
"Sorry, that emoticon was not found"
end 


def get_english_meaning(file_path, j_emo)
   dictionary = load_library("./lib/emoticons.yml")
    dictionary.each do |key, value|
        return key if value[:japanese] == j_emo 
    end 
"Sorry, that emoticon was not found"
end


