# 2번
SELECT country.Name, city.count
FROM country
JOIN
(SELECT CountryCode, COUNT(NAME) AS count
FROM city
GROUP BY CountryCode) AS city
ON country.code = city.CountryCode
ORDER BY city.count DESC
LIMIT 10

# 3번
SELECT LANGUAGE, SUM(population) AS count
FROM
(SELECT countrylanguage.Language, CEIL((countrylanguage.percentage/100) * country.population) AS population
FROM country
JOIN countrylanguage
ON countrylanguage.CountryCode = country.Code) AS LANGUAGE
GROUP BY language
ORDER BY COUNT DESC
LIMIT 10

# 4번
SELECT city_name, CountryCode, country_name, ROUND((city_population / country_population)*100, 2) AS percentage
FROM
(SELECT city.name AS city_name, CountryCode, country.name AS country_name, 
city.population AS city_population, country.population AS country_population
FROM city
JOIN country
ON country.code = city.CountryCode) AS country_city
WHERE city_population >= country_population * 0.1 AND city_population >= 5000000
ORDER BY percentage DESC

# 5번
