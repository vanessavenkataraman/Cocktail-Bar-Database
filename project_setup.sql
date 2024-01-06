CREATE TABLE staff(
	employee_id numeric(4,0) PRIMARY KEY,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	address varchar (100),
	cell_number numeric(10),
	e_mail varchar(50)
);

CREATE TABLE jobtitle(
	position_id numeric(1,0) PRIMARY KEY,
	title varchar(20) UNIQUE,
	hourly_wage numeric(5,2) NOT NULL,
	tip_point_average numeric(2,1) NOT NULL
);

CREATE TABLE position_reference(
	position_id numeric(1,0),
	employee_id numeric(4,0),
	start_date DATE NOT NULL,
	end_date DATE,
	PRIMARY KEY (employee_id, position_id),
	CONSTRAINT fk_position_id FOREIGN KEY (position_id) REFERENCES jobtitle(position_id),
	CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES staff(employee_id),
	CONSTRAINT chk_date CHECK ((end_date IS NULL AND start_date >= '2022-05-15') OR (end_date>= start_date AND start_date >= '2022-05-15'))
);

CREATE TABLE shift(
	shift_date date PRIMARY KEY,
	employee_id numeric(4,0) UNIQUE,
	clock_in timestamp NOT NULL,
	clock_out timestamp NOT NULL,
	CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES staff(employee_id),
	CONSTRAINT chk_time CHECK (clock_out>clock_in)
);

SELECT* FROM staff
SELECT* FROM jobtitle
SELECT* FROM position_reference

CREATE TABLE service_night(
	night date PRIMARY KEY,
	week_day varchar(10),
	covers smallint,
	drinks_sold smallint,
	plates_sold smallint	
);

CREATE TABLE sales(
	night date UNIQUE,
	total_sales smallint NOT NULL,
	bar_sales smallint NOT NULL,
	kitchen_sales smallint NOT NULL,
	comps smallint NOT NULL,
	credit_tips smallint NOT NULL,
	cash_tips smallint NOT NULL,
	CONSTRAINT fk_night FOREIGN KEY (night) REFERENCES service_night(night)
);

CREATE TABLE spirits(
	spirit_name varchar(50) PRIMARY KEY,
	spirit_type varchar(20) NOT NULL,
	bottle_price smallint NOT NULL,
	case_price smallint NOT NULL,
	current_inventory smallint NOT NULL,
	order_id numeric(6,0) UNIQUE,
	CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES inventory_order(order_id)
);

DROP TABLE cocktail


CREATE TABLE cocktail(
	cocktail_name varchar(30),
	spirit_name varchar (50),
	spec varchar(150) NOT NULL,
	build_method varchar(20) NOT NULL,
	glassware varchar(20) NOT NULL,
	garnish varchar(30) NOT NULL,
	PRIMARY KEY (cocktail_name, spirit_name)
	CONSTRAINT fk_spirit FOREIGN KEY (spirit_name) REFERENCES spirits(spirit_name)
);

CREATE TABLE inventory_order(
	order_id numeric(6,0) PRIMARY KEY,
	spirit_name varchar(50) UNIQUE,
	num_bottles smallint NOT NULL,
	bill smallint NOT NULL
);

