require_relative './deck'

class Pile
  
  def initialize(deck=Deck.new)
    @deck = deck
    @played_cards = @deck.deal(1)
    @current_suit = @played_cards.first.suit
    @current_value = @played_cards.first.value
  end
  
  def return
    @deck.return(@played_cards)
    self = Pile.new(@deck)
  end
  
end