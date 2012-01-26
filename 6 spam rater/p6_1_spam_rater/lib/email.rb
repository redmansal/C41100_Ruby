class Email
	attr_accessor :words_array, :spam_rating

  def initialize(file_location)

    file = File.open(file_location, "rb")
    contents = file.read
    @words_array = contents
    @email_name = file_location.scan(/\/.+/)
    @spam_rating = 0
  end

  def print_my_details
    puts "Email name: #{@email_name}"
    puts "Spam rating: #{@spam_rating}\n\n"
  end

  def rate_me_for_spam(spam)

    #check if they certain key words are present that indicate fraud
    spam.spam_words_array.each do |spam_word|
      @words_array.downcase.scan(spam_word.downcase).each do |spam_word_found| 
        @spam_rating += 1
      end
    end

    #check email for total capital letters because a lot of fraud emails come in all caps
    #remove white spaces
    total_char_nospaces = words_array.gsub(/\s+/, '')
    #find length of total characters in email
    total_character = total_char_nospaces.length
    #find only capital letters
    just_capital_letters = (total_char_nospaces.scan(/[A-Z]/)).join
    #find lenght of only capital letter
    total_cap_character =  just_capital_letters.length
    percentage_capital_letters = total_cap_character.to_f/total_character.to_f
    @spam_rating += 3 if percentage_capital_letters > 0.5


    #find big amounts of money which is a sign that its a fraudulent email 
    stuff_found = @words_array.scan(/\d{3},\d{3}/)
    stuff_found.each{@spam_rating += 1}

  end


end
