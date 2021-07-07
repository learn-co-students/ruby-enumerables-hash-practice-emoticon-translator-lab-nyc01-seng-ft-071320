require 'yaml'





def load_library(file_path)
 #code goes here
  emo = YAML.load_file(file_path)
  emoticons_hash = {}
  emo.each do |name,arrays|
      emoticons_hash[name] ||= {}
      emoticons_hash[name][:english] = arrays[0]
      emoticons_hash[name][:japanese] = arrays[1]
  end
emoticons_hash
end





def get_japanese_emoticon(file_path, eng_emo)
   library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
      return idioms[:japanese] if idioms[:english] == eng_emo
  end
  "Sorry, that emoticon was not found"
end





def get_english_meaning(file_path, jap_emo)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
    return meaning if idioms[:japanese] == jap_emo
  end
    "Sorry, that emoticon was not found"
end
