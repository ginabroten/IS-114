use context essentials2021

# Jeg valgte å bruke "put-image" til kodingen av Norgesflagget. Videre skrev jeg inn "rectangle", for å vise pyret hvilken figur jeg ville produsere. Innenfor der igjen presenterte jeg med 4 ulike elementer hvordan produktet skulle se ut, også plasserte jeg , og la til deler av flagget stegvis

a = put-image(rectangle(330, 50, "solid", "white"), 165, 120, rectangle(330, 240, "solid", "red"))

  
# a produserer første del av flagget, som jeg har bestemt skal være en rød bagrunn med den førte hvite vannrette rektangelet. Jeg  har bestemt at rektangelet skal være 330 lang, og 240 bred. Deretter har jeg bestemt plassering og størrelse på den hvite linjen. 

b = put-image(rectangle(60, 240, "solid", "white"), 130, 120, a)



# b produserer den andre hvite loddrette rektangelet oppå bilde a. Ved å srive inn en bokstav og  = foran koden vil den lagre seg og jeg vil deretter kunne bruke den videre slik som gjort her. 

c= put-image(rectangle(330, 25, "solid", "blue"), 165, 120, b)



# siste del av koden produserer den siste blå rektanglene som ligger loddrett på bilde c

d = put-image(rectangle(25, 240, "solid", "blue"), 130, 120, c)

d