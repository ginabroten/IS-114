use context essentials2021
# for å lage en funksjon for å tegne de skandinaviske flaggene, har jeg valgt å bruke en rekke funksjoner; bla. lister og put-image.

#velger å bruke lister for å definere alle de ulike rektanglene som flaggene skal bestå av, listene blir importert videre med L. Med lister kan jeg definere alle dimensjonene og størrelsene på rektanglene i flaggene, og enkelt hente de fram senere i koden med L.get

import lists as L 

# for simpelheten har jeg benenvt flaggene via tall, og ved hjelp av tallene blir de endret utifra sitt tall - hvor Norge (0) står som grunnflagg.

table: Land :: String, Tall :: Number
  row: "Norge", 0
  row: "Danmark", 1
  row: "Sverige", 2
  row: "Finland", 3
  row: "Island", 4
  row: "Færøyene", 5
end

"Skriv `flagg(tall)` der du bytter ut et tall med tabellen over"

#Her begunner jeg med å definere de dimensjonene på flaggene, dim, hvor de tre første tallene er tallene for det norske flagget, så de tre neste er det danske osv.  rek-funkjsonen definerer videre disse dimensjonene med samme logikk, og farger for flaggene
fun flagg(tall):  
  doc: "tegner flagget til de skandinaviske landene"
  
  dim = [list: 6, 4, 2, 12, 4, 0, 5, 2, 0, 5, 3, 0, 7, 4, 2, 6, 4, 2]
  rek = [list: 22 , 16, 0, 37, 28, 0, 16, 10, 0, 18, 11, 0, 25, 18, 0, 22, 16]
  farger = [list: "fire-brick", "white", "dark-blue", "red", "white", "orange", "blue", "gold", "orange", "white", "dark-blue", "orange", "dark-blue", "white", "red", "white", "dark-blue", "red"]
  
  #Flaggene bygges stregvis, og består av fire kors/lag - og avhengig av hvilket flagg vises de.Her brukes L.get for å hente fram listeverdier, og det ganges utifra hvilket flagg som skal lages. 


  background = rectangle(L.get(rek, 0 + (3 * tall)) * 10, L.get(rek, 1 + (3 * tall)) * 10, "solid", L.get(farger, 0 + (3 * tall)))

  kors1 = put-image(rectangle(L.get(rek, 0 + (3 * tall)) * 10, L.get(dim, 1 + (3 * tall)) * 10, "solid", L.get(farger, 1 + (3 * tall))), (L.get(rek, 0 + (3 * tall)) / 2) * 10, (L.get(rek, 1 + (3 * tall)) / 2) * 10, background)

  kors2 = put-image(rectangle(L.get(dim, 1 + (3 * tall)) * 10, L.get(rek, 1 + (3 * tall)) * 10, "solid", L.get(farger, 1 + (3 * tall))), (L.get(rek, 1 + (3 * tall)) / 2) * 10, (L.get(rek, 1 + (3 * tall)) / 2) * 10, kors1)

  kors3 = put-image(rectangle(L.get(rek, 0 + (3 * tall)) * 10, L.get(dim, 2 + (3 * tall)) * 10, "solid", L.get(farger, 2 + (3 * tall))), (L.get(rek, 0 + (3 * tall)) / 2) * 10, (L.get(rek, 1 + (3 * tall)) / 2) * 10, kors2)

put-image(rectangle(L.get(dim, 2 + (3 * tall)) * 10, L.get(rek, 1 + (3 * tall)) * 10, "solid", L.get(farger, 2 + (3 * tall))), (L.get(rek, 1 + (3 * tall)) / 2) * 10, (L.get(rek, 1 + (3 * tall)) / 2) * 10, kors3)

  

end
