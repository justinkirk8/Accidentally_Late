-- reset merged
DROP TABLE accidents_joined;
-- join merged
Select ac.severity, ac.state_code, us.region, us.division, 
	ac.temperature_f, ac.visibility_mi, ac.wind_speed_mph, ac.precipitation_in, 
	ac.weather_condition, ac.sunrise_sunset, ac.year,ac.date, ac.classification
INTO accidents_joined
From accidents_merged AS ac
JOIN us_state_region as us
ON(ac.state_code = us.state_code);

-- reset sample
DROP TABLE accidents_sample_joined;
-- join sample
Select ac.severity, ac.state_code, us.region, us.division, 
	ac.temperature_f, ac.visibility_mi, ac.wind_speed_mph, ac.precipitation_in, 
	ac.weather_condition, ac.sunrise_sunset, ac.year,ac.date, ac.classification
INTO accidents_sample_joined
From accidents_sample_merged AS ac
JOIN us_state_region as us
ON(ac.state_code = us.state_code);