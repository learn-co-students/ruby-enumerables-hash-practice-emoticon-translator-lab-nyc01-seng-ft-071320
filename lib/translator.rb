require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  emoticons.each do |english_word, emoticon_set|
    emoticon_hash[english_word] = Hash.new
    emoticon_hash[english_word][:english] = emoticon_set[0]
    emoticon_hash[english_word][:japanese] =
      emoticon_set[1]
    end
   emoticon_hash
 end

def get_english_meaning(path, jemoticon)
  emoticons = load_library(path)
  eng_meaning = ""
  apology = "Sorry, that emoticon was not found"
  emoticons.each do |emotion, lang|
    lang.each do |inner_key,emoticon|
      if emoticon == jemoticon
        eng_meaning = emotion
      end
    end
    if eng_meaning == ""
      eng_meaning = apology
    end  
  end
  eng_meaning
end

def get_japanese_emoticon(path, e_emoticon)
  emoticons = load_library(path)
  jap_emoticon = ""
  apology = "Sorry, that emoticon was not found"
  emoticons.each do |emotion, lang|
    lang.each do |inner_key, emoticon|
     if emoticon == e_emoticon
        jap_emoticon = lang[:japanese]
      end
    end
    if jap_emoticon == ""
      jap_emoticon = apology
    end
  end
  jap_emoticon
end 
      