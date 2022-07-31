-- create US_State_Region table

DROP TABLE US_State_Region;

CREATE TABLE US_State_Region (
	state_code VARCHAR(40) NOT NULL,
	region VARCHAR(40) NOT NULL,
	division VARCHAR(40) NOT NULL
);

-- create accidents-merged table
DROP TABLE accidents_merged;
CREATE TABLE accidents_merged (
 	severity NUMERIC NOT NULL,
	state_code VARCHAR(40) NOT NULL,
	temperature_f NUMERIC NOT NULL,
	visibility_mi NUMERIC NOT NULL,
	wind_speed_mph NUMERIC NOT NULL,
	precipitation_in NUMERIC NOT NULL,
	weather_condition VARCHAR(40) NOT NULL,
	sunrise_sunset VARCHAR(40) NOT NULL,
	year NUMERIC NOT NULL,
	date DATE NOT NULL,
	classification VARCHAR(40) NOT NULL
);

-- create sample merge table
DROP TABLE accidents_sample_merged;
CREATE TABLE accidents_sample_merged (
 	severity VARCHAR(40) NOT NULL,
	state_code VARCHAR(40) NOT NULL,
	temperature_f NUMERIC NOT NULL,
	visibility_mi NUMERIC NOT NULL,
	wind_speed_mph NUMERIC NOT NULL,
	precipitation_in NUMERIC NOT NULL,
	weather_condition VARCHAR(40) NOT NULL,
	sunrise_sunset VARCHAR(40) NOT NULL,
	year NUMERIC NOT NULL,
	date DATE NOT NULL,
	classification VARCHAR(40) NOT NULL
);
