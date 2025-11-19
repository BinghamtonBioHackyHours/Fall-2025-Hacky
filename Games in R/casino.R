# rdocumentation.org/packages/casino/versions/0.1.0

install.packages("casino")
library(casino)
setup()
Player$new(name = "Rob")
players()

x <- Blackjack$new(who = "Rob", bet = "25")
x$play()$stand()
x$play()$hit()

