require_relative './pile'

class Player
  
  attr_reader :hand
  
  def initialize(pile=Pile.new)
    @pile = pile
    @deck = @pile.deck
    @hand = @deck.deal(8)
  end
  
  def play
    
    until @hand.any? { |card| @pile.valid_play?(card) }
      if @deck.empty?
        puts "deck is empty"
        break
      end
      draw
    end
    
    @hand.each do |card|
      if @pile.valid_move?(card) && card.value != :eight
        @pile.play(card)
      elsif @pile.valid_move?(card)
        @pile.play(card)
      end
    end
    
  end
  
  def draw
    @hand << deck.deal(1)
  end
  
end