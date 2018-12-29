require_relative '../lib/number_to_word'

describe "# phone number to word " do

  context "generate word from digit 6686787825" do
    let(:number_to_word) do 
      number_to_word = NumberToWord.new
      number_to_word.load_dictionary
      number_to_word.generate_combinations("6686787825")
      number_to_word
    end

    it "Check input digit is valid" do
      expect(number_to_word.input_valid).to eql(true)
    end

    it "Check generated word is valid" do
      expect(number_to_word.final_result).to eql([["noun", "struck"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"])
    end

    it "Check generated word is less than 1 sec" do
      expect(number_to_word.run_time).to be < 1
    end
  end

  context "generate word from digit 2282668687" do
    let(:number_to_word) do 
      number_to_word = NumberToWord.new
      number_to_word.load_dictionary
      number_to_word.generate_combinations("2282668687")
      number_to_word
    end

    it "Check input is valid" do
      expect(number_to_word.input_valid).to eql(true)
    end

    it "Check generated word is valid" do
      expect(number_to_word.final_result).to eql([["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["cat", "contour"], ["acta", "mounts"], "catamounts"])
    end

    it "Check generated word is less than 1 sec" do
      expect(number_to_word.run_time).to be < 1
    end
  end

  context "generate word from digit 2182668687" do
    let(:number_to_word) do 
      number_to_word = NumberToWord.new
      number_to_word.load_dictionary
      number_to_word.generate_combinations("2182668687")
      number_to_word
    end

    it "Check input is invalid" do
      expect(number_to_word.input_valid).to eql(false)
    end

    it "Check generated word is empty" do
      expect(number_to_word.final_result).to eql([])
    end

    it "Check generated word is less than 1 sec" do
      expect(number_to_word.run_time).to be < 1
    end
  end
end