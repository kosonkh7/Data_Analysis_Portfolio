SELECT *
from covidvaccinations
order by 3, 4

SELECT * 
from coviddeaths
order by 3, 4

-- 이용할 컬럼만 불러오기
SELECT location, date, total_cases, new_cases, total_deaths, population 
FROM coviddeaths
ORDER BY 1, 2

-- 일자 별 총 확진자 수 대비 총 사망자 수 비율 확인
-- 특정 국가에서 확진 가능성 확인
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases*100) as death_percentage
FROM coviddeaths
WHERE location LIKE '%India%'
ORDER BY 1, 2 DESC

-- 인구 수 대비 확진자 수 변화 추이
SELECT location, date, total_cases, population, (total_cases/population*100) as infect_percentage
FROM coviddeaths
WHERE location LIKE '%India%'
ORDER BY 1, 2 DESC

-- 인구 수 대비 높은 확진율 보이는 국가 찾기
SELECT location, population, MAX(total_cases), MAX((total_cases/population)*100) as infect_percentage
FROM coviddeaths
GROUP BY location, population
ORDER BY infect_percentage DESC

-- 인구 수 대비 높은 사망율 보이는 국가 찾기
SELECT location, population, MAX(total_deaths), MAX((total_deaths/population)*100) as death_percentage
FROM coviddeaths
GROUP BY location, population
ORDER BY death_percentage DESC

-- 인구 수 대비 높은 사망율 보이는 대륙 찾기
SELECT continent, MAX((total_deaths/population)*100) as death_percentage
FROM coviddeaths
GROUP BY continent
ORDER BY death_percentage DESC

-- 두 테이블 연결
SELECT *
FROM coviddeaths
JOIN covidvaccinations 
	ON coviddeaths.location = covidvaccinations.location
    AND coviddeaths.date = covidvaccinations.date


-- 지역 별 총 백신 접종자 수
SELECT continent, location, date, population, new_vaccinations, SUM(new_vaccinations) OVER (PARTITION BY location) as RollingPeopleVaccinated
FROM coviddata
ORDER BY 2, 3 DESC


-- 인구 수 대비 지역 별 총 백신 접종자 수 비율
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
SELECT continent, location, date, population, new_vaccinations, SUM(new_vaccinations) OVER (PARTITION BY location) as RollingPeopleVaccinated
From coviddata
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac


-- 추후 시각화를 위한 뷰 생성
Create View PercentPopulationVaccinated as
SELECT continent, location, date, population, new_vaccinations, SUM(new_vaccinations) OVER (PARTITION BY location) as RollingPeopleVaccinated
From coviddata

SELECT *
FROM PercentPopulationVaccinated



