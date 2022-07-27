-- create accidents-merged table
DROP TABLE accidents_merged;
CREATE TABLE accidents_merged (
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

-- create accidents-merged table
DROP TABLE accidents_pre_covid;
CREATE TABLE accidents_pre_covid (
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

-- create accidents-merged table
DROP TABLE accidents_covid;
CREATE TABLE accidents_covid (
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

-- create US_State_Region table

DROP TABLE US_State_Region;

CREATE TABLE US_State_Region (
	State_Code VARCHAR(40) NOT NULL,
	Region VARCHAR(40) NOT NULL,
	Division VARCHAR(40) NOT NULL
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
