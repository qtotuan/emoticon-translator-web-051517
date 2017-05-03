require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  # hash = {
  #   'get_meaning' => {},
  #   'get_emoticon' => {}
  # }
  get_meaning = {}
  get_emoticon = {}
  emoticons.each do |meaning, symbol_arr|
    get_meaning[symbol_arr[1]] = meaning
    get_emoticon[symbol_arr[0]] = symbol_arr[1]
  end
  hash = {
    'get_meaning' => get_meaning,
    'get_emoticon' => get_emoticon
  }
  # binding.pry
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  get_emoticon = emoticons['get_emoticon']
  # binding.pry
  get_emoticon.each do |engl_emo, jap_emo|
    return jap_emo if emoticon == engl_emo
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  get_meaning = emoticons['get_meaning']
  get_meaning.each do |jap_emo, meaning|
    return meaning if emoticon == jap_emo
  end
  "Sorry, that emoticon was not found"
end

# load_library('./lib/emoticons.yml')
get_japanese_emoticon("./lib/emoticons.yml", ":)")
