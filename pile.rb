require_relative './deck'

class Pile
  
  attr_reader :deck, :played_cards, :current_suit, :current_value
  
  def initialize(deck=Deck.new)
    @deck = deck
    @played_cards = @deck.deal(1)
    @current_suit = @played_cards.first.suit
    @current_value = @played_cards.first.value
  end
  
  def return_to_deck
    @deck.return(@played_cards)
    Pile.new(@deck)
  end
  
  def valid_play?(card)
    card.suit == @current_suit || 
    card.value == @current_value ||
    card.value == :eight
  end
  
  def play(card, suit=card.suit)
    raise "invalid play" if !valid_play?(card)
    @played_cards << card
    @current_suit = suit
    @current_value = card.value
  end
  
end