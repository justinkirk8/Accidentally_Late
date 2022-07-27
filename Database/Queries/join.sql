-- reset merged
DROP TABLE accidents_joined:
-- join merged
Select ac.severity, ac.state_code, us.region, us.division, ac.temperature_f, ac.visibility_mi, ac.wind_speed_mph, ac.precipitation_in, ac.weather_condition, ac.sunrise_sunset, ac.year,ac.date
INTO accidents_joined
From accidents_merged AS ac
JOIN us_state_region as us
ON(ac.state_code = us.state_code);

-- reset pre-covid
DROP TABLE accidents_pre_covid_joined:
-- join pre-covid
Select ac.severity, ac.state_code, us.region, us.division, ac.temperature_f, ac.visibility_mi, ac.wind_speed_mph, ac.precipitation_in, ac.weather_condition, ac.sunrise_sunset, ac.year,ac.date
INTO accidents_pre_covid_joined
From accidents_pre_covid AS ac
JOIN us_state_region as us
ON(ac.state_code = us.state_code);

-- reset covid
DROP TABLE accidents_covid_joined:
-- join covid
Select ac.severity, ac.state_code, us.region, us.division, ac.temperature_f, ac.visibility_mi, ac.wind_speed_mph, ac.precipitation_in, ac.weather_condition, ac.sunrise_sunset, ac.year,ac.date
INTO accidents_covid_joined
From accidents_pre_covid AS ac
JOIN us_state_region as us
ON(ac.state_code = us.state_code);