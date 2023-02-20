cat("\n\n\n")

#var battle
battle <- 0
win <- 0
draw <- 0
loss <- 0
weapons <- c("R", "S", "P")
names(weapons) <- c("ROCK", "SCISSORS", "PAPER")



cat("============ WELCOME TO JANKEN GAME (ROCK-PAPER-SCiSSORS) ============\n")
cat("\n\n\n")
cat("            ###### PLEASE TELL ME! WHAT'S YOUR NAME!!! ######\n")
cat("\n")
cat("                    ##### OUR TALENTED PLAYER #####")
cat("\n\n\n\n")

cat("Your name : ")
name <- readLines("stdin", n=1)
cat("\n\n")
cat(paste("                       >>>>>>>>>>" ,name,"!!? <<<<<<<<<< \n\n                            IS A GOOD NAME!!!\n\n\n"))
cat("##################  ARE YOU READY TO FIGHT?", name, "!  ##################\n\n")
cat("Are you ready? [Y / N] : ")
fight <- readLines("stdin", n=1)

check_fight <- tolower(fight)
while (sum(as.numeric(c(check_fight == "y", check_fight == "n", check_fight == "yes", check_fight == "no"))) == 0) {
cat("\nPlease select only [Y] or [N]", name, "!!!\n")
cat("\nAre you ready? [Y / N] : ")
fight <- readLines("stdin", n=1)
check_fight <- tolower(fight)
}

check_fight2 <- 0

if(check_fight == "y" | check_fight == "yes") {
  check_fight2 <- 1  
} else {
  cat("GOODBYE! ,", name)
}

if (check_fight2 == 1) {
  cat("\n          #################     LET PLAY !     #################\n\n\n")
  cat("LISTEN!!!", name, "\n\n")
  cat("                 =============    ROLE    ============\n\n")
  cat("SELECT [R] = ROCK | [S] = SCISSOR | [P] = PAPER\n\n")
  cat("SELECT [Q] = EXIT THE GAME\n\n")
  cat("- ROCK WIN SCISSORS\n\n")
  cat("- SCISSORS WIN PAPER\n\n")
  cat("- PAPER WIN ROCK\n\n")
  
  while (check_fight2 == 1) {
  battle <- battle + 1  
   cat("\nPlease select [R] [S] [P] for play and [Q] for Exit.\n\n")
  cat("YOUR TURN : ")
  weapon <- toupper(readLines("stdin", n=1))
  check <- sum(as.numeric(c(weapon == "P", weapon == "R" , weapon == "S", weapon == "Q")))
  
  while (check == 0) {
    cat("\nPlease select [R] [S] [P] for play and [Q] for Exit.\n\n")

    cat("Try again!!!\n\n")
    cat("YOUR TURN : ")
    weapon <- toupper(readLines("stdin", n=1))
    check <- sum(as.numeric(c(weapon == "P", weapon == "R" , weapon == "S", weapon == "Q")))
  }
  
  #QUIT
  if(weapon == "Q") {
    cat("\n\n")
    cat("###############      TOTAL", battle -1, "GAMES      ###############\n\n")
    cat("                    YOU WIN", win, "GAMES      \n")
    cat("                       DRAW", draw, "GAMES\n")
    cat("                   YOU LOSS", loss, "GAMES\n\n")
    check_fight2 <- 0
  } else {

  #FIGHT
  if(weapon == "P") {
    weapon2 <- "PAPER"
  } else if (weapon == "R") {
    weapon2 <- "ROCK"
  } else {
    weapon2 <- "SCISSORS"
  }
  m_weapon <- sample(weapons, 1)
  if(weapon == m_weapon) {
    cat("\n\n")
    cat("                      ##### ROUND", battle, "FIGHT! ##### \n\n")
    cat(">>> ", name, ":", weapon2, "\n")
    cat(">>> ", "ME :", names(m_weapon), "\n\n")
    cat("DRAW!!!\n\n")
    draw <- draw + 1
  } else if(weapon == "R" & m_weapon == "S") {
    cat("\n\n")
    cat(paste("                      ##### ROUND", battle, "FIGHT! ##### \n\n"))
    cat(">>> ", name, ":", weapon2, "\n")
    cat(">>> ", "ME :", names(m_weapon), "\n\n")
    cat("YOU WIN!!!\n\n")
    win <- win + 1
  } else if(weapon == "S" & m_weapon == "P") {
    cat("\n\n")
    cat("                      ##### ROUND", battle, "FIGHT! ##### \n\n")
    cat(">>> ", name, ":", weapon2, "\n")
    cat(">>> ", "ME :", names(m_weapon), "\n\n")
    cat("YOU WIN!!!\n\n")
    win <- win + 1
  } else if(weapon == "P" & m_weapon == "R") {
    cat("\n\n")
    cat("                      ##### ROUND", battle, "FIGHT! ##### \n\n")
    cat(">>> ", name, ":", weapon2, "\n")
    cat(">>> ", "ME :", names(m_weapon), "\n\n")
    cat("YOU WIN!!!\n\n")
    win <- win + 1
  } else {
    cat("\n\n")
    cat("                      ##### ROUND", battle, "FIGHT! ##### \n\n")
    cat(">>> ", name, ":", weapon2, "\n")
    cat(">>> ", "ME :", names(m_weapon), "\n\n")
    cat("YOU LOSS!!!\n\n")
    loss <- loss +1
  }
    }
  } 
}
