
class Spam

  attr_accessor :spam_words_array 


  def initialize(spam_list_file)
    @spam_words_array = []
  
    File.open(spam_list_file).each {|line| @spam_words_array << line}
  end






end
