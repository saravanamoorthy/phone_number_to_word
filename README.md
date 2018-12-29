## Setup

Install Ruby 2.4.1 and bundler

Install the bundled gems and run the specs:

```
bundle install
bundle exec rspec
```

*Focus: TDD, Refactoring, OOP, Legacy Code, Idiomatic Ruby*

*Modified version of: [Saravana Moorthy](https://github.com/saravanamoorthy/phone_number_to_word)*

### Run Sample Code
```ruby
number_to_word = NumberToWord.new
number_to_word.load_dictionary
puts number_to_word.generate_combinations("6686787825")
```
### Run RSpec
```shell
rspec spec/number_to_word_spec.rb
```