-- https://www.hackerrank.com/challenges/asian-population/problem?h_r=internal-search

SELECT SUM(CITY.POPULATION)
FROM CITY
    INNER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Asia'
