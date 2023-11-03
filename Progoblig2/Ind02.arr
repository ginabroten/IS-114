  
# Designe og implementere en funksjon, som beregner den totale (estimerte) mengden av energiforbruket til en typisk innbygger i et industrielt land.

#Først må vi beregne energiforbruket


#beregne energibruk - fra forelesningsnotater får vi oppgitt at energi-per-unit of fuel er 10 kWh, fra en Aftenposten (2022) får vi oppgitt at nordmenn kjører i snitt 11 288 km i året, og biler bruker i snitt 0,5L per mil. Dette gir et snitt på 3.1 mil per dag

#distance-travelled-per-day = 3.1
#distance-per-unit-of-fuel = 0.5
#energy-per-unit-of-fuel = 10



include shared-gdrive(
"dcic-2021",
  "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source
import color as C
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
      sanitize energi using  string-sanitizer
end



#lager en funkjson basert på forlesningsnotater som beregner energibruket til en bil 

fun  energibil(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
  ((distance-travelled-per-day / distance-per-unit-of-fuel) * energy-per-unit-of-fuel)
end


fun energi-to-number(str :: String) -> Number:
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0 
  end
where:
  energi-to-number("") is 0
energi-to-number("48") is 48
end




#transformere tabellen slik at innholdet forstår som tall, dette kan jeg gjøre med transformfunkjsonen. Den får det nye navnet kwh-new og har med 62 fremfor 0, og er tall og ikke strings. 



kwh-new = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number) 


  
#finne summen av det daglige forbruket, må summere alle verdiene i "energi"-kolonnen. Jeg lager derfor en funskjon som henter fram både funkjsonen for bil hvor jeg kan sette inn tre verdier fra uttrykket, og summen av "energi" kolonnen.


fun total-energibruk(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
  energibil(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel) + sum(transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number), "energi")

end

"Total energibruk vil derfor bli" 

total-energibruk(3.1, 0.5, 10)


#ved å skrive inn total-energibruk(3.1, 0.5, 10) i interaksjonsvinduet får jeg svaret 217, som tilsvarer energibruket til en typisk innbygger i et indusrielt land.



bar-chart(kwh-new, "komponent", "energi")

#her vil det bli 0 i verdi,vi ønsker å få med 62 i tabellen og i figuren. Gjør endringer på energy-to-number funksjonen. Endrer navn til enegry-to-numbers


fun energi-to-numbers(str :: String) -> Number:
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 62 #setter inn 62 - ettersom vi kun har en verdi som er null, det er bilverdien. Del av oppgave d) 
  end
where:
  energi-to-number("") is 0
energi-to-number("48") is 48
end


kwh-final = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-numbers) 

bar-chart(kwh-final, "komponent", "energi")

#her printes en bar-chart med alle verdiene inne
