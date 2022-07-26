-- create accidents-merged table
DROP TABLE accidents_merged;
CREATE TABLE accidents_merged (
 	Severity VARCHAR(40) NOT NULL,
	State_code VARCHAR(40) NOT NULL,
	Temperature_F NUMERIC NOT NULL,
	Visibility_mi NUMERIC NOT NULL,
	Wind_Speed_mph NUMERIC NOT NULL,
	Precipitation_in NUMERIC NOT NULL,
	Weather_Condition VARCHAR(40) NOT NULL,
	Sunrise_Sunset VARCHAR(40) NOT NULL,
	year NUMERIC NOT NULL,
	date DATE NOT NULL
);

-- create US_State_Region table

DROP TABLE US_State_Region;

CREATE TABLE US_State_Region (
	State_Code VARCHAR(40) NOT NULL,
	Region VARCHAR(40) NOT NULL,
	Division VARCHAR(40) NOT NULL
);


