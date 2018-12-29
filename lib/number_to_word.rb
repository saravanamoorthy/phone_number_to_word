class NumberToWord
  attr_accessor :final_result, :run_time 
  def initialize
    @digits = ""
    @letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
    @dictionary = {}
    @final_result = []
    @run_time = 0.0
  end

  def load_dictionary
    for i in (3..11)
      @dictionary[i] = []
    end
    path = File.dirname __FILE__
    File.foreach("#{path}/dictionary.txt") do |word|
      @dictionary[word.length] << word.chop.to_s.downcase if word.length >=3 && word.length <=11
    end
  end

  def input_valid
    !@digits.empty? && @digits.length == 10 && @digits.split('').select{ |num| (num.to_i == 0 || num.to_i == 1) }.length == 0
  end

  def map_digit_to_character
    @digits.chars.map{|digit| @letters[digit]}
  end

  def generate_combinations(digits)
    @digits = digits
    @final_result = []
    @run_time = 0.0
    if input_valid
      start_time = Time.now()
      keys = map_digit_to_character
      matching_words = {}
      total_number = keys.length - 1
      for i in (2..total_number - 2)
        first_half = keys[0..i]
        next if first_half.length < 3
        second_half = keys[i + 1..total_number]
        next if second_half.length < 3
        first_combination = first_half.shift.product(*first_half).map(&:join)
        next if first_combination.nil?
        second_combination = second_half.shift.product(*second_half).map(&:join)
        next if second_combination.nil?
        matching_words[i] = [(first_combination & @dictionary[i+2]), (second_combination & @dictionary[total_number - i +1])]
      end
      generate_final_result(keys, matching_words)
      end_time = Time.now()
      @run_time = (end_time.to_f - start_time.to_f)
      puts "Run time #{@run_time}"
      @final_result.inspect
    else
      puts "Invalid input!"
    end
  end

  def generate_final_result(keys, results)
    results.each do |key, combinataions|
      next if combinataions.first.nil? || combinataions.last.nil?
      combinataions.first.product(combinataions.last).each do |combo_words|
        @final_result << combo_words
      end
    end
    @final_result << (keys.shift.product(*keys).map(&:join) & @dictionary[11]).join(", ")
  end 
end