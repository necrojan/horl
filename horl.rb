class Horl
  TYPES = %w[Diamonds Spades Hearts Clubs].freeze
  RANK = %w[Ace 1 2 3 4 5 6 7 8 9 10 Jack Queen King].freeze
  ATTEMPTS = 7

  def shuffle_cards(cards)
    cards.shuffle
  end

  def get_card(cards)
    cards.pop
  end

  def generate_deck
    card_list = []

    TYPES.each do |type|
      RANK.each_with_index do |rank, idx|
        card_hash = { 'rank' => rank, 'type' => type, 'value' => idx + 1 }
        card_list << card_hash
      end
    end

    card_list
  end

  def card_message(title, card)
    puts "#{title} card is  #{card['rank']} of #{card['type']} with value of #{card['value']}"
  end

  def run
    while true
      deck = shuffle_cards(generate_deck)
      current_card = get_card(deck)
      current_value = current_card['value']
      # p current_card
      card_message('Starting', current_card)

      (0..ATTEMPTS).each do |_i|
        puts "Will the next value be higher or lower? (h for higher or l for lower)\n"
        answer = gets.chomp.downcase

        next_card = get_card(deck)
        next_value = next_card['value']

        card_message('Next', next_card)
        if answer == 'h'
          if next_value > current_value
            puts 'Your guess is correct it was higher!'
          else
            puts 'Your guess is incorrect it was not higher'
          end
        elsif answer == 'l'
          if next_value < current_value
            puts 'Your guess was correct it was lower'
          else
            puts 'Oops! it was not lower'
          end
        end

        current_card = next_card
        current_value = next_value
      end
      puts "Would you like to play again? press ENTER to continue. q to quit\n"
      retry_again = gets.chomp
      if retry_again == 'q'
        puts 'Bye!'
        break
      end
    end
  end
end

horl = Horl.new
horl.run
