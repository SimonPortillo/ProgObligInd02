include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =  
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize komponent using string-sanitizer
    sanitize energi using string-sanitizer
end

fun beregn-bil-energi(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
  
(distance-travelled-per-day / 
    distance-per-unit-of-fuel) * energy-per-unit-of-fuel
  
end



bil-energi = beregn-bil-energi(50, 12 ,10)



fun energi-to-number(str :: String) -> Number:
  doc: "If str is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => bil-energi
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
energi-to-number("x") is 0
end

#energi-to-number("test")


kwh-ny = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

kwh-ny



#kwh-ny.get-column("energi").row-n(1)

#transform-column(kwh-ny, "energi", bil-energi)

#new-row = kwh-ny.row-n(1)

#add-row(kwh-ny, bil-energi1)
# forsøk på å legge til en ny rad med data fra bil-energi funksjonen


sum-total = sum(kwh-ny, "energi")

sum-total

bar-chart(kwh-ny, "komponent", "energi")
