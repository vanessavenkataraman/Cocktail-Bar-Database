INSERT INTO "Final Project".spirits(spirit_name,spirit_type,bottle_price,bottle_size_ml,case_price)
VALUES
	('Mijenta Blanco', 'tequila', 48.99, 750, 240.00),
	('Wild Turkey 101 Rye', 'whiskey', 35.99,750,180.00),
	('Wheatley', 'vodka',14.99,750,72.00),
	('Ten-One White', 'rum',36.99,750,192.00),
	('Ten-One Dark', 'rum',44.99,750,252.00),
	('Novo Fogo', 'cachaca',28.99,750,150.00),
	('Del Maguey Vida', 'mezcal',34.99,750,180.00),
	('Ramazotti','amaro',28.99,750,150.00)
	
INSERT INTO "Final Project".cocktail(cocktail_name,spirit_name,ounces_used,spec,build_method,glassware,garnish)
VALUES
	('daiquiri','Ten-One White',2,'2oz rum, 1oz lime, 1oz simple','shaken','coupe','lime wheel'),
	('old fashioned','Wild Turkey 101 Rye',2,'2oz rye,0.25oz demerara, 2 dashes angostura and orange bitters','stirred','double rocks','orange swath'),
	('dirty martini','Wheatley',2,'2oz vodka,1oz olive brine','stirred','coupe','olives'),
	('espresso martini','Ten-One Dark',1,'1oz rum,1.5oz espresso mix,1 shot espresso','shaken','coupe','espresso beans'),
	('margarita','Mijenta Blanco',1.5,'1.5oz tequila, 0.75oz lime, 0.5oz dry curacao,0.5oz simple','shaken','rocks','salt rim and lime wheel')
	
	INSERT INTO "Final Project".inventory_order(order_date,order_id,spirit_name,num_bottles,bill)
	VALUES
		('2023-02-01',43,'Ramazotti',6,150.00),
		('2023-02-01',44,'Mijenta Blanco',4,195.96),
		('2023-02-01',45,'Del Maguey Vida',2,69.98),
		('2023-02-03',46,'Novo Fogo',1,28.99),
		('2023-02-04',47,'Wild Turkey 101 Rye',3,107.97)
		
DELETE FROM "Final Project".inventory_order
DELETE FROM "Final Project".spirits
DELETE FROM "Final Project".cocktail
		
INSERT INTO jobtitle(position_id,title, hourly_wage,tip_point_average)
VALUES
	(1,'general manager',15.00,1.0),
	(2,'bar manager',15.00,1.0),
	(3,'bartender',6.50,0.8),
	(4,'server',6.50,0.6),
	(5,'support',6.50,0.5)
	
INSERT INTO "Final Project".staff(employee_id,first_name,last_name,address,cell_number,e_mail)
VALUES
	(1864,'Chris','Agave','407 Ocean Lane Revere,MA 02151',7289047645,'chrisagave123@gmail.com'),
	(8273,'Gui', 'Granola','93 Lemon Lane Everett,MA 02149',8372847836,'itisgui@gmail.com'),
	(8378,'Kayla','Trucker','86 Knife Blvd Malden,MA 02148',8376669046,'kaykay63@yahoo.com'),
	(8279,'Suzie','Que','821 Noodles Road Boston, MA 02108',9274637878,'suzaeeee@yahoo.com'),
	(9921,'Alex','Rye','41 Grasshopper Blvd Malden,MA 02148',9923430065,'alexalexalex@gmail.com')
	
INSERT INTO "Final Project".shift(employee_id,shift)
VALUES
	(1864,'[2023-01-01 15:00:00, 2023-01-02 2:00:00]'),
	(8273,'[2023-01-01 17:00:00, 2023-01-01 23:00:00]'),
	(8378,'[2023-01-01 14:00:00, 2023-01-01 23:30:00]'),
	(8279,'[2023-01-01 12:00:00, 2023-01-02 3:00:00]'),
	(9921,'[2023-01-01 18:00:00, 2023-01-02 4:00:00]')
	
INSERT INTO "Final Project".jposition(position_id,employee_id,employment)
VALUES
	(3,1864,'[2023-02-01, infinity)'),
	(5,8273,'[2022-07-01, infinity)'),
	(3,8378,'[2022-08-01, infinity)'),
	(1,8279,'[2022-05-01, infinity)'),
	(2,9921,'[2022-08-01, infinity)'),
	(4,1864,'[2023-01-01, 2023-01-30)')
	
INSERT INTO "Final Project".service_night(night,covers,drinks_sold,plates_sold,bar_sales,kitchen_sales,comps,credit_tips,cash_tips)
VALUES
	('2023-01-01',160,310,70,4960,1960,35,1500,25),
	('2023-01-06',250,535,182,8560,5096,96,2740,355),
	('2023-01-09',120,280,80,4480,1840,0,1300,230),
	('2023-01-13',330,712,205,10240,4320,280,3409,170),
	('2023-01-05',90,125,56,2050,583,76,720,89)

DELETE FROM "Final Project".shift WHERE employee_id=1864
DELETE FROM "Final Project".staff WHERE employee_id=1864
DELETE FROM "Final Project".cocktail WHERE cocktail_name = 'margarita'

UPDATE "Final Project".jposition SET employment = '[2023-02-01, 2023-02-06]' WHERE employee_id=8273

SELECT DISTINCT employee_id FROM "Final Project".shift WHERE shift&& '[2023-01-01,2023-01-02]'
SELECT SUM(bar_sales + kitchen_sales) AS total_sales FROM "Final Project".service_night WHERE night='2023-01-01'

SELECT employee_id, (SUM(cash_tips)/COUNT(DISTINCT employee_id)) AS cash_tips_per_employee FROM "Final Project".service_night WHERE shift&& '[2023-01-01,2023-01-02]' GROUP BY employee_id

SELECT s.employee_id, (SUM(n.cash_tips)/(COUNT(DISTINCT s.employee_id))* FROM "Final Project".shift s
INNER JOIN "Final Project".service_night n ON s.shift::date = n.night WHERE s.shift::date = '2023-01-01'
GROUP BY s.employee_id

