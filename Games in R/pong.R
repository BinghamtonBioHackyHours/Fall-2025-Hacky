###### Simulating the Legendary Pong Game in R
# https://lucidmanager.org/data-science/pong/

## Sound library
library(beepr) 

## Game parameters
skill <- 0.87 # Skill (0-1)
score <- 0
high.score <- 0

## Define playing field
x11()
par(mar = rep(1,4), bg = "black")
plot.new()
plot.window(xlim = c(0,30), ylim = c(0,30))
lines(c(1, 30, 30, 1), c(0, 0, 30, 30), type = "l", lwd = 5, col = "white")

## Playing field boundaries (depends on cex)
xmin <- 0.5
xmax <- 29.4
ymin <- 0.5
ymax <- 29.4

## initial position
x <- sample(5:25, 1)
y <- sample(5:25, 1)
points(x, y, pch = 15, col = "white", cex = 2)

## Paddle control
psize <- 4
ypaddle <- y

## Set direction
dx <- runif(1, .5, 1)
dy <- runif(1, .5, 1)

## Game play
while (x > xmin - 1) {
  sound <- 0 # Silence
  Sys.sleep(.05) # Pause screen
  points(x, y, pch = 15, col = "black", cex = 2) # Erase ball
  # Move ball
  x <- x + dx
  y <- y + dy
  # Collision detection
  if (x > xmax) {
    dx <- -dx * runif(1, .9, 1.1) # Bounce
    if (x > xmin) x <- xmax # Boundary
    sound <- 10 # Set sound
  }
  if (y < ymin | y > ymax) {
    if (y < ymin) y <- ymin
    if (y > ymax) y <- ymax
    dy <- -dy * runif(1, .9, 1.1)
    sound <- 10
  }
  # Caught by paddle?
  if (x < xmin & (y > ypaddle - (psize / 2)) & y < ypaddle + (psize / 2)) {
    if (x < xmin) x <- xmin
    dx <- -dx * runif(1, .9, 1.1)
    sound <- 2
    score <- score + 1
  }
  # Draw ball
  points(x, y, pch = 15, col = "white", cex = 2)
  if (sound !=0) beep(sound)
  # Move paddle
  if (runif(1, 0, 1) < skill) ypaddle <- ypaddle + dy # Imperfect follow
  # Draw paddle
  # Erase back line
  lines(c(0, 0), c(0, 30), type = "l", lwd = 8, col = "black")
  # Keep paddle in window
  if (ypaddle < (psize / 2)) ypaddle <- (psize / 2)
  if (ypaddle > 30 - (psize / 2)) ypaddle <- 30 - (psize / 2)
  # Draw paddle
  lines(c(0, 0), c(ypaddle - (psize / 2), ypaddle + (psize / 2)), type = "l", lwd = 8, col = "white")
}
beep(8)
text(15,15, "GAME OVER", cex=5, col = "white")
s <- ifelse(score == 1, "", "s")
text(15,5, paste0(score, " Point", s), cex=3, col = "white")


###### https://www.reddit.com/r/rstats/comments/1czzec1/hey_heres_a_crappy_version_of_pong_that_i_made_in/


version <- as.character(R.Version()$version.string)
pongtitle <- c("Pong  ", version)
windows(title = paste(pongtitle, collapse = ''))
par(mar = rep(1, 4), bg = "black" )
plot.new()
plot.window(xlim = c(0, 101), ylim = c(0, 101))
lines(c(1, 100, 100, 1, 1), c(1, 1, 100, 100, 1), col = "white")
keep_playing <- T

#Initial Paddle Positions
paddle1.y <- 50
paddle2.y <- 50
draw_paddle <- function(x, y) {
  rect(x - .5, y -3.5, x +.5, y + 3.5, col = "white")
}
clear_paddle <- function(x, y) {
  rect(x - .5, y -3.5, x +.5, y + 3.5, col = "black")
}
paddle2.ya <<- paddle2.y
key_event_handler <- function(key) {
  if (key == "Up" && paddle2.y < 95 ) {
    paddle2.ya <<- paddle2.y
    paddle2.y <<- paddle2.y + 2
  } else if (key == "Down" && paddle2.y > 5) {
    paddle2.ya <<- paddle2.y
    paddle2.y <<- paddle2.y -2
  } else if (key == "q") {
    keep_playing <<- F
  }
}
update_paddles <- function() {
  clear_paddle(90, paddle2.ya)
  draw_paddle(90, paddle2.y)
}

#Initial Ball positions
ball.x <- 50
ball.y <- 50
ball.dx <- 2.5
ball.dy <- 1
draw_ball <- function(x, y) {
  symbols(x, y, circles = 1, inches = F, add = T, fg = "white", bg = "white")
}
clear_ball <- function(x, y) {
  symbols(x, y, circles = 1, inches = F, add = T, fg = "black", bg = "black")
}
move.ball <- function() {
  ball.x <<- ball.x + ball.dx
  ball.y <<- ball.y + ball.dy
}
collisions <- function() {
  if(ball.x <= 12.5 && ball.x >= 7.5 && ball.y <= paddle1.y + 3.5 & ball.y >= paddle1.y -3.5){
    ball.dx <<- -ball.dx
  }
  if(ball.x >= 87.5 && ball.y <= paddle2.y + 3.5 & ball.y >= paddle2.y -3.5){
    ball.dx <<- -ball.dx
  }
  if(ball.y >= 99 | ball.y <= 4){
    ball.dy <<- -ball.dy
  }
  if(ball.x >= 99 | ball.x <= 3.5){
    ball.dx <<- -ball.dx
  }
}
update.ball <- function() {
  clear_ball(ball.x, ball.y)
  move.ball()
  collisions()
  draw_ball(ball.x, ball.y)
}
update.movement <- function() {
  update_paddles()
  update.ball()
}
idle <- update.ball()
draw_paddle(90, paddle2.y)
draw_paddle(10, paddle1.y)
draw_ball(ball.x, ball.y)
game_loop <- while (keep_playing) {
  update.movement()
  getGraphicsEventEnv()
  getGraphicsEvent(onKeybd = key_event_handler, onIdle = idle)
}


