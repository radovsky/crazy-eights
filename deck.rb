require './card'

class Deck
  
  attr_reader :cards
  
  def initialize
    @cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        @cards << Card.new(suit, value)
      end
    end
    @cards.shuffle!
  end
  
  def deal(num)
    hand = []
    num.times { hand << @cards.shift }
    hand
  end
  
  def return(pile)
    @cards += pile
    @cards.shuffle!
  end
  
  def count
    @cards.count
  end
  
  def empty?
    @cards.empty?
  end
  
end