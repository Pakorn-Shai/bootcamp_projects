# chotbot Pizza
#greeting
print("Hello!")
print("Welcome to Happy Pizza. The pizza makes you happy.")

#var
#category
category_order <- 1:3
category <- c("Pizza", "Chicken", "Drinks")
#Pizza
pizza_items <- 1:4
pizza_menu <- c("Seafood Cocktail", "Shrimp Cocktail", "Ham&Crab Sticks", "Hawaiian")
pizza_size <- 1:4
pizza_size_order <- c("S", "M", "L", "XL" )
#Chicken
chicken_items <- 1:4
chicken_menu <- c("BBQ Chicken Wings (6 pcs)", "Spicy Chicken Wings (6 pcs)", "Chicken Nuggets 6 (pcs)", "Chicken Sticks (6 pcs)")
#Drinks
drink_items <- 1:3
drink_menu <- c("Coke 1.25 Ltr.", "Coke (No Sugar) 1.25 Ltr.", "Natural Mineral Water 500 ml.")

order <- 0
act3 <- 1

while (act3 == 1) {
  act1 <- 0
  act2 <- 0

#question 01
anwser1 <- FALSE  
while (anwser1 == FALSE) {
  print("Please Pick a Food Category. (Press 1 to 3)")
  print(data.frame(category))
  act1 <- readLines("stdin", n=1)
  anwser1 <- sum(act1 == as.numeric(category_order))
}
#question 02
  anwser2 <- FALSE
  anwser3 <- FALSE
  anwser4 <- FALSE
  print("Pick the item that you want")  
  while (anwser2 == FALSE) {  
    if(act1 == 1) {  
      print("Press 1 to 4.")
      print(data.frame(pizza_menu))
      act2 <- readLines("stdin", n=1)
      anwser2 <- sum(act2 == as.numeric(pizza_items))
      while (anwser3 == FALSE) { 
        print("How large? (Press 1 to 3")
        print(data.frame(pizza_size_order))
        act7 <- readLines("stdin", n=1)
        anwser3 <- sum(act7 == as.numeric(pizza_size))
      }
    } else if(act1 == 2) {
      print("Press 1 to 4.")  
      print(data.frame(chicken_menu))
      act2 <- readLines("stdin", n=1)
      anwser2 <- sum(act2 == as.numeric(chicken_items))
    } else {
      print("Press 1 to 3.")
      print(data.frame(drink_menu))
      act2 <- readLines("stdin", n=1)
      anwser2 <- sum(act2 == as.numeric(drink_items))
    }
  }
  order <- order + 1
  print("Do you want to add any more items to your order? (y/n)")
  act3 <- readLines("stdin", n=1)
  if(tolower(act3) == "y" | tolower(act3) == "yes") {
    act3 <- 1
  } else {
    act3 <- 0
  }
}

print(paste("you have ", order, " orders"))
print("What's your name")
act4 <- readLines("stdin", n=1)
print(paste("Hello,", act4))
print("What's your mobile number?")
act5 <- readLines("stdin", n=1)
print("Delivery address please.")
act6 <- readLines("stdin", n=1)
print("Awesome. Your order is placed")
print("You'll soon get a call for confirmation.")
print("Thank You.")
