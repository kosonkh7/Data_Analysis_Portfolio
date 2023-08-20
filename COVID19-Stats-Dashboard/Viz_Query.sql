SELECT *
FROM coviddata


-- 1. 전체 사망율
SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
FROM coviddata
WHERE continent is not null 
ORDER BY 1, 2


-- 2. 국가 별 사망율
SELECT location, SUM(new_deaths) as TotalDeathCount, DENSE_RANK() OVER (ORDER BY SUM(new_deaths) DESC) DEATH_RANK 
FROM coviddata
WHERE continent is not null
and location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC


-- 3 총 확진 인구 수, 인구 수 대비 확진율
Select Location, population, MAX(total_cases) as HighestInfectionCount,  TRUNCATE(Max((total_cases/population))*100, 2) as PercentPopulationInfected
FROM coviddata
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC


-- 4 
SELECT location, population, date, MAX(total_cases) as HighestInfectionCount,  TRUNCATE(Max((total_cases/population))*100, 2) as PercentPopulationInfected
FROM coviddata
GROUP BY location, population, date
ORDER BY PercentPopulationInfected DESC