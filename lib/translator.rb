require 'yaml'
require 'pry'

def load_library(path)
  library = YAML.load_file(path)
  update = {}

  library.each do |names,values|
    update[names] = {}
    update[names][:english] = values[0]
    update[names][:japanese] = values[1]
  end
  update
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  update = nil
  library.each do |name, values|
    if values.value?(emoticon)
      return update = values[:japanese]
    end
  end
  if update == nil
    return "Sorry, that emoticon was not found"
  else
    return update
  end
end


def get_english_meaning(path, emoticon)
  library = load_library(path)
  update = nil
  library.each do |name, values|
    if values.value?(emoticon)
      return update = name
    end
  end
  if update == nil
    return "Sorry, that emoticon was not found"
  else
    return update
  end
end
