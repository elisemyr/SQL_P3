#1.

SELECT *
FROM Trip
WHERE pension = 'F' and maxCapacity >= 30


#2.

SELECT titleMovie
FROM Movie
WHERE (yearRelease BETWEEN 1950 and 1959 and budget > 2000000)
OR (yearRelease > 2010 and budget > 20000000)


#3. 

#a.
SELECT * FROM TRIP returns 12 rows -> 12 trips

#b.
SELECT * FROM PRICING returns 25 rows -> 12 pricings

# 
#- number of columns = number of columns in TRIP (5) + number of columns in PRICING (3) = 8 columns
#- number of rows = number of rows in TRIP (12) x number of rows in PRICING (25) = 300 rows

#d. 25 rows because each pricing will be joined with exactly one trip

#e. 
SELECT * FROM TRIP, PRICING 
WHERE TRIP.idTrip = PRICING.trip
ORDER BY idTrip

#f.
SELECT * FROM TRIP
INNER JOIN PRICING ON TRIP.idTrip = PRICING.trip
ORDER BY idTrip


#4. 

SELECT titleMovie, yearRelease
FROM Movie
INNER JOIN Country ON Movie.countryFunder = Country.idCountry
WHERE nameCountryFR = 'France'
ORDER BY yearRelease



#5. 

SELECT DISTINCT nameCity
FROM City
INNER JOIN Stage ON city.idCity = Stage.city
WHERE duration = 1


#6

SELECT Stage.trip, dateTrip, orderStage, nameCity
FROM Stage
INNER JOIN Pricing ON Stage.trip = Pricing.trip
INNER JOIN City ON Stage.city = City.idCity
WHERE price > 4400



#7

SELECT DISTINCT nameTrip, minCapacity, maxCapacity
FROM Stage
INNER JOIN Trip ON Stage.trip = Trip.idTrip
INNER JOIN City ON Stage.city = City.idCity
WHERE nameCity = 'Paris' and pension = 'F' and orderStage = 1


#8
SELECT DISTINCT nameTrip, minCapacity, maxCapacity, orderStage, nameCity
FROM Stage
INNER JOIN Trip ON Stage.trip = Trip.idTrip
INNER JOIN City ON Stage.city = City.idCity
INNER JOIN Country ON City.country = Country.idCountry
WHERE nameCountryEN = 'France' and pension = 'F'

