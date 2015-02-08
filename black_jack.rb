require 'pry'

def culculate_total(cards)
  #cards = [["2","Hearts"],["King","Diamonds"]]

  array_of_values = cards.map{|element| element[0]} # => ['2','King','8','Ace']
  total = 0

  array_of_values.each do |value|
    if value == 'Ace'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
  
  array_of_values.select{|value| value == 'Ace'}.count.times do
    if total > 21
      total -= 10
    else
      break
    end
  end

  total
end



#--------------------------------------------
puts "$ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $"
puts "Welcome to Black Jack"
puts ""

cards = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
deck = cards.product(suits).shuffle

#Deals the cards
my_cards = []
dealer_cards = []

my_total = 0
dealer_total = 0

my_cards << deck.pop
dealer_cards << deck.pop
my_cards << deck.pop
dealer_cards << deck.pop

my_total = culculate_total(my_cards)
dealer_total = culculate_total(dealer_cards)

puts "Your cards: " + my_cards.to_s + "Your total is: " + my_total.to_s
puts ""
puts "Dealers cards: " + dealer_cards.to_s + "Dealer total is: " + dealer_total.to_s
puts ""

if my_total == 21
  puts "$ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $"
  puts "Congradulations, you got Black Jack"
  exit
end

#Proccess of hitting cards and determining if bust
while(my_total < 21)
  begin
    puts
    puts "Would you like to hit? (y/n)"
    hit = gets.chomp
    if(hit != 'y' && hit != 'n')
      puts "error input. Try again"
    end
  end until ['y', 'n'].include?(hit) 
  puts ""
  if (hit == 'y')
    
    new_card = deck.pop
    puts "Dealing card to player: " + new_card.to_s
    my_cards << new_card

    my_total = culculate_total(my_cards)
    puts "Your total is: " + my_total.to_s

    if my_total == 21
      puts "$ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $"
      puts "Congradulations, you got Black Jack"
     exit
    elsif my_total > 21
      puts "! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !"
      puts "Sorry, you busted. You Lose!"
      exit
    end

  else
    break
  end
end

#dealer part

while(dealer_total < 17)
  new_card = deck.pop
  puts "Dealing card to Dealer: " + new_card.to_s
  dealer_cards << new_card
  dealer_total = culculate_total(dealer_cards)
  puts "Dealer total is: " + dealer_total.to_s

  if (dealer_total == 21)
    puts "! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !"
    puts "Sorry, you lose. Dealer got Black Jack"
    exit
  elsif (dealer_total > 21)
    puts "$ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $"
    puts "Congradulations, Dealer busted. You Won!"
    exit
  end
end


#Stating the winner if both are in range
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "Players cards are: " + my_cards.to_s 
puts "Players total is: " + my_total.to_s
puts ""

puts "Dealers cards are: " + dealer_cards.to_s 
puts "Dealers total is: " + dealer_total.to_s
puts ""

if my_total > dealer_total
  puts "Congradulations, you Won!"
elsif my_total < dealer_total
  puts "Sorry, you Lost!"
else
  puts "It's a Tie!"
end


exit








    



  
