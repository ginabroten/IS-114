use context essentials2021
#En måte å løse oppgaven for å lage bygge sammen enkelt rektangler, og ved å benytte funksjonene beside og above kan vi delvis bygge det opp. Funkjsonene tillater bare to objekter, og flagget bygges derfor opp delvis. 

#velger å bygge flagget vertikalt, først definerer jeg den valgte størrelsen på alle flaggdelene

red-short = rectangle(100, 70, "solid", "red")

red-long = rectangle(200, 70, "solid", "red")

white-1 = rectangle(20,70, "solid", "white")

blue-1 = rectangle(20, 70, "solid", "blue")

#rektangler til mellomdel

white-2 = rectangle(120, 20, "solid", "white")

blue-2 = rectangle(20, 20, "solid", "blue")

white-3 = rectangle(220, 20, "solid", "white")



#Starter med del a bygger flagget fra venstre til høyre, og begynner i øvre venstre hjørne med p komibinere rødt rektangel med hvitt rektangel på høyre-siden

a1 = beside(red-short, white-1)

# legger til blå på den røde, og hvite delen vi bygde. 

a2 = beside(a1, blue-1)

#legger til hvit igjen

a3 = beside(a2, white-1)

#legger til en lang rød 

a4 = beside(a3, red-long)


# Nå har vi toppdelen på flagget, nå må vi lagge mellombeltet som består av hvtt, litt blått og hvitt igjen - dette er del b.  Dette er også fra venstre, begynner med å definere figurene



b1 = beside(white-2, blue-2)

b2 = beside(b1, white-3)



#kombinerer for å sjekke om det passer, del c

c = above(a4, b2)


# Det passer, og vi kan begynne på det siste laget - d, dette også fra venstre til høyre. Her bygges det den loddrette blå rektangelet

d1 = rectangle(360, 20, "solid","blue")

d2 = above(c, d1)


# Vi legger til det vi har bygd, tilsammen med det hvite og blå underlaget vi lagde tidligere

e = above(d2, b2)


# tilslutt legger vi alt sammen til et fullstendig flagg

Norway =above(e, a4)

Norway