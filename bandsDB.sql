-- Create the my_guitar_shop1 database
DROP DATABASE IF EXISTS band2gether;
CREATE DATABASE band2gether;
USE band2gether;  -- MySQL command

-- create the tables
CREATE TABLE BAND(
	Name		VARCHAR(64)	NOT NULL,
	Genre		VARCHAR(20),
	Creation		DATE,
	Disband		DATE,
	Region		VARCHAR(16),
	Email		VARCHAR(50)	UNIQUE,
	Website		VARCHAR(100)	UNIQUE,
	PRIMARY KEY(Name)
);
CREATE TABLE ARTIST(
	Id		INT		NOT NULL	AUTO_INCREMENT,
	Name		VARCHAR(32)	NOT NULL,
	DOB		DATE		NOT NULL,
	Nickname	VARCHAR(32),
	Email		VARCHAR(64),
	PRIMARY KEY(Id)
);
CREATE TABLE BAND_TELEPHONE(
	Band		VARCHAR(64)	NOT NULL,
	Telephone	VARCHAR(10)	NOT NULL	DEFAULT 0,
	PRIMARY KEY(Band, Telephone),
	FOREIGN KEY(Band) REFERENCES BAND(Name)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE ARTIST_INVOLVEMENT(
	Id		INT		NOT NULL,
	Band		VARCHAR(64)	NOT NULL,
	Role		VARCHAR(15)	NOT NULL,
	Start		DATE		NOT NULL,
	End		DATE,
	PRIMARY KEY(Id, Band, Role, Start),
	FOREIGN KEY(Id) REFERENCES ARTIST(Id)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY(Band) REFERENCES BAND(Name)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE ALBUM(
	Band		VARCHAR(64)	NOT NULL,
	Album		VARCHAR(64)	NOT NULL,
	Release_date	DATE,
	Type		VARCHAR(16),
	PRIMARY KEY(Band, Album),
	FOREIGN KEY(Band) REFERENCES BAND(Name)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE SONG(
	Band		VARCHAR(64)	NOT NULL,
	Album		VARCHAR(64)	NOT NULL,
	Song_title	VARCHAR(64)	NOT NULL,
	Duration		TIME,
	Track_num	INT,
	PRIMARY KEY(Band, Album, Song_title),
	FOREIGN KEY(Band, Album) REFERENCES ALBUM(Band, Album)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE VENUE(
	Venue_name	VARCHAR(64)	NOT NULL,
	Location_state	VARCHAR(2),
	Location_city	VARCHAR(64),
	Address		VARCHAR(128),
	PRIMARY KEY(Venue_name)
);
CREATE TABLE TOUR(
	Tour_ID		INT		NOT NULL	AUTO_INCREMENT,
	Name		VARCHAR(64)	NOT NULL,
	Headliner	VARCHAR(64)	NOT NULL,
	PRIMARY KEY(Tour_ID),
	FOREIGN KEY(Headliner) REFERENCES BAND(Name)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE SHOWS(
	Tour_ID		INT		NOT NULL,
	Venue		VARCHAR(64)	NOT NULL,
	Date		DATE		NOT NULL,
	Time		TIME,
	PRIMARY KEY(Tour_ID, Date),
	FOREIGN KEY(Tour_ID) REFERENCES TOUR(Tour_ID)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY(Venue) REFERENCES VENUE(Venue_name)
		ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE OPENER(
	Band		VARCHAR(64)	NOT NULL,
	Tour_ID		INT		NOT NULL,
	Date		DATE		NOT NULL,
	PRIMARY KEY(Band, Tour_ID, Date),
	FOREIGN KEY(Band) REFERENCES BAND(Name)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY(Tour_ID, Date) REFERENCES SHOWS(Tour_ID, Date)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

-- insert data into the database
INSERT INTO BAND(Name, Genre, Creation, Disband, Region, Email, Website) VALUES
	('Aim Lower', 'Rock', '2018-04-16', '0000-00-00', 'Westland', 'aimlowerband@gmail.com', 'https://www.facebook.com/pg/aimlowerband/about/?ref=page_internal'),
	('Almost Made the Mixtape', 'Hip Hop', '2018-01-12', '0000-00-00', 'Detroit', 'caseyoleary92@gmail.com', 'https://www.facebook.com/pg/AlmostMadetheMixtape/about/?ref=page_internal'),
	('Antighost', 'Pop', '2010-08-01', '2018-07-15', 'Grand Rapids', 'antighostmusic@gmail.com', 'https://www.facebook.com/Antighostmusic/'),
	('Beta Camp', 'Alternative', '2018-06-19', '0000-00-00', 'Detroit', 'betacampband@gmail.com', 'https://www.facebook.com/pg/betacampband'),
	('Better Thoughts', 'Pop', '2015-10-10', '0000-00-00', 'Troy', 'betterthoughtsmi@gmail.com', 'https://www.facebook.com/BetterThoughtsMI/'),
	('Brother Son', 'Rock', '2016-02-13', '0000-00-00', 'Detroit', 'brothersonband@gmail.com', 'https://www.facebook.com/brothersonofficial/'),
	('Common Ground', 'Punk', '2017-04-10', '0000-00-00', 'Metro Detroit', 'commongroundmichigan@gmail.com', 'https://www.facebook.com/pg/commongroundmi/about/?ref=page_internal'),
	('Day Sleeper ', 'Disco', '2014-03-09', '0000-00-00', 'Detroit', 'daysleeperofficial@gmail.com', 'https://www.facebook.com/pg/wearedaysleeper/about/?ref=page_internal'),
	('Dogleg', 'Pop', '2017-09-07', '0000-00-00', 'Ann Arbor', 'doglegband@gmail.com', 'https://www.facebook.com/pg/doglegdog'),
	('Early Humans', 'Alternative', '2017-11-28', '0000-00-00', 'Detroit', 'idk3@gmail.com', 'www.idk3.com'),
	('Former Critics', 'Techno', '2017-06-20', '0000-00-00', 'Detroit', 'formercritics@gmail.com', 'https://www.facebook.com/pg/formercritics/about/?ref=page_internal'),
	('Handgrenades', 'Rock', '2016-08-22', '0000-00-00', 'Detroit', 'jsb@jsbsquad.com', 'https://www.facebook.com/pg/TheHandGrenades'),
	('Helpless Hearts', 'Pop', '2018-07-03', '0000-00-00', 'Detroit', 'helplesshearts@gmail.com', 'https://www.facebook.com/pg/helplesshearts/about/?ref=page_internal'),
	('Honey Monsoon', 'Rock', '2016-04-22', '0000-00-00', 'Ypsilanti', 'honeymonsoon@gmail.com', 'https://www.facebook.com/pg/honeymonsoon'),
	('If Only, If Only', 'Punk', '2017-11-14', '0000-00-00', 'Grand Rapids', 'ifonlyifonlymi@gmail.com', 'https://www.facebook.com/pg/ifonlyifonlymi'),
	('If Walls Could Talk', 'Rock', '2011-11-11', '0000-00-00', 'Detroit', 'ifwallscouldtalkband@gmail.com', 'https://www.facebook.com/pg/Ifwallscouldtalkband/about/?ref=page_internal'),
	('Jenn\'s Apartment', 'Reggae', '2017-08-11', '0000-00-00', 'Lansing', 'jennsapartmentband@gmail.com', 'https://www.facebook.com/jennsapartment/'),
	('Liquid Thickness', 'Punk', '2017-03-01', '0000-00-00', 'Ypsilanti', 'beanstalk720@gmail.com', 'https://www.facebook.com/pg/LiquidThickness'),
	('Mover Shaker', 'Heavy Metal', '2017-05-09', '0000-00-00', 'Detroit', 'movershakerdetroit@gmail.com', 'https://www.facebook.com/pg/movershakerdetroit'),
	('One Up', 'Alternative', '2017-07-11', '0000-00-00', 'Detroit', 'alanreitman@gmail.com', 'https://www.facebook.com/pg/OneUpDET/about/?ref=page_internal'),
	('secret forte', 'Alternative', '2016-07-12', '0000-00-00', 'Detroit', 'idk2@gmail.com', 'www.idk2.com'),
	('Seminole Hills', 'Rock', '2015-12-21', '0000-00-00', 'Warren', 'aellis1983@yahoo.com', 'www.idk.com'),
	('Sidewatcher', 'Country', '2017-08-30', '0000-00-00', 'Detroit', 'sidewatchermusic@gmail.com', 'https://www.facebook.com/sidewatchermusic/'),
	('Silver Age', 'Hip Hop', '2015-07-21', '0000-00-00', 'Temperance', 'silveragemi@gmail.com', 'https://www.facebook.com/pg/silveragemi'),
	('Smart Alecs', 'Alternative', '2015-06-09', '0000-00-00', 'Jackson', 'smart.alecs@yahoo.com', 'https://www.facebook.com/SmartAlecsBand/'),
	('telegraf', 'Alternative', '2017-08-14', '0000-00-00', 'Detroit', 'idk@gmail.com', 'www.idk1.com'),
	('The Dirty News', 'Country', '2017-09-16', '0000-00-00', 'Detroit', 'thedirtynewsgroup@gmail.com', 'https://www.facebook.com/pg/thedirtynewsband'),
		('The Doozers', 'Rock', '2015-05-10', '0000-00-00', 'Rochester', 'doozersband@gmail.com', 'https://www.facebook.com/pg/TheDoozersBand'),
		('The Kelseys', 'Classic', '2017-07-28', '0000-00-00', 'Ann Arbor', 'thekelseysband@gmail.com', 'https://www.facebook.com/pg/thekelseysband/about/?ref=page_internal'),
		('The Pretty Okay', 'Pop', '2017-06-01', '0000-00-00', 'Metro Detroit', 'theprettyokay@gmail.com', 'https://www.facebook.com/pg/theprettyokay/about/?ref=page_internal'),
		('The Thoughtlife', 'Hip Hop', '2017-12-29', '0000-00-00', 'Detroit', 'thethoughtlifemusic@gmail.com', 'https://www.facebook.com/pg/Thoughtlifemusic'),
		('These Are Trees', 'Pop', '2018-03-11', '0000-00-00', 'Milan', 'officialthesearetrees@gmail.com', 'https://www.facebook.com/pg/TheseAreTrees'),
		('You Rest, You Joy Life', 'Country', '2016-03-30', '0000-00-00', 'Detroit', 'yourestyoujoylife@gmail.com', 'https://www.facebook.com/pg/YouRestYJL');

INSERT INTO ARTIST(Id, Name, DOB, Nickname, Email) VALUES
		(1, 'Evan Villarreal', '1991-06-20', '', 'evmusic@yahoo.com'),
		(2, 'Drew Yates', '1988-11-09', 'Gates', 'yatesman@yahoo.com'),
		(3, 'Caleb Pilaske', '1989-08-27', '', 'feelthemusic@gmail.com'),
		(4, 'Jared Spindler', '1992-08-12', 'Spinny', 'spinnyjam@gmail.com'),
		(5, 'Alyssa Wettlaufer', '1989-12-02', '', 'POKaly@gmail.com'),
		(6, 'Logan Ward', '1985-05-01', 'Stormy', 'opensky@yahoo.com'),
		(7, 'Matthew Hummel', '1991-10-11', '', 'mhummel@gmail.com'),
		(8, 'Brad Ringl', '1988-08-08', '', 'ringlb@yahoo.com'),
		(9, 'Ed Birch', '1997-03-05', '', 'birchtree@yahoo.com'),
		(10, 'Tony Burke', '1992-11-28', '', 'tonypizza@gmail.com'),
		(11, 'Nick DiStefano', '1987-03-29', '', 'distefanoband@yahoo.com'),
		(12, 'Zack Spoutz', '1978-02-16', 'Wild man', 'waterspoutz@yahoo.com'),
		(13, 'Whitey', '1995-05-25', '', 'whitjam@yahoo.com'),
		(14, 'Steven Fronrath', '1994-08-01', '', 'stevefron@yahoo.com'),
		(15, 'Francis Harrington', '1980-07-08', '', 'lovemusic@gmail.com'),
		(16, 'Chris Pecorelli', '1992-07-14', '', 'chrisp@gmail.com'),
		(17, 'Jimmy Walkup', '1986-04-22', 'Starfire', 'walkupj@hotmail.com'),
		(18, 'Drew Gijsbers', '1984-09-13', '', 'drew194@gmail.com'),
		(19, 'Austen Reno', '1989-08-17', '', 'austenreno@gmail.com'),
		(20, 'Yong Los', '1990-12-15', '', 'loshombres@gmail.com'),
		(21, 'Elijah Zuker', '1989-03-30', '', 'ezuker5@yahoo.com'),
		(22, 'Jake Matter', '1991-11-08', '', 'matternot@yahoo.com'),
		(23, 'Kiegan White', '1993-09-01', '', 'whitecloud2@gmail.com'),
		(24, 'Zoë Kissel', '1993-01-23', 'K1', 'zoekissel@yahoo.com'),
		(25, 'Dylan Kissel', '1993-01-23', 'K2', 'kisselbro@gmail.com'),
		(26, 'AJ Picciuto', '1990-08-08', '', 'picciutoaj17@yahoo.com'),
		(27, 'Melanie Kelley', '2001-12-18', 'Lovely', 'kelleymadness@hotmail.com'),
		(28, 'Sean Donnelly', '2001-01-01', '', 'donnellyman@gmail.com'),
		(29, 'Kyle Garland', '2000-10-23', '', 'kgarland@gmail.com'),
		(30, 'Charlie Belleville', '2000-02-19', '', 'mimusic@yahoo.com');

INSERT INTO BAND_TELEPHONE(Band, Telephone) VALUES
		('Aim Lower', '545-830-95'),
		('Almost Made the Mixtape', '778-809-02'),
		('Antighost', '107-661-78'),
			('Beta Camp', '353-733-23'),
			('Better Thoughts', '908-735-42'),
			('Brother Son', '686-028-56'),
			('Common Ground', '742-130-37'),
			('Day Sleeper ', '159-159-15'),
			('Dogleg', '308-842-65'),
			('Former Critics', '740-136-62'),
			('Handgrenades', '786-837-86'),
			('Helpless Hearts', '901-242-48'),
			('Honey Monsoon', '260-575-51'),
			('If Only, If Only', '353-020-66'),
			('If Walls Could Talk', '586-556-03'),
			('Jenn\'s Apartment', '881-430-89'),
			('Liquid Thickness', '153-158-66'),
			('Mover Shaker', '629-445-34'),
			('One Up', '758-657-34'),
			('Sidewatcher', '742-207-77'),
			('Silver Age', '477-633-57'),
			('Smart Alecs', '673-273-98'),
			('The Dirty News', '611-634-94'),
			('The Doozers', '401-165-00'),
			('The Kelseys', '959-186-45'),
			('The Pretty Okay', '111-111-11'),
			('The Thoughtlife', '457-282-80'),
			('These Are Trees', '742-162-55'),
			('You Rest, You Joy Life', '400-737-87');

INSERT INTO ARTIST_INVOLVEMENT(Id, Band, Role, Start, End) VALUES
			(1, 'Sidewatcher', 'Triangle', '2017-08-30', '2017-09-04'),
			(1, 'Silver Age', 'Vocals', '2010-04-02', '0000-00-00'),
			(2, 'Silver Age', 'Guitar', '2010-04-20', '0000-00-00'),
			(3, 'Silver Age', 'Bass', '2010-04-02', '0000-00-00'),
			(4, 'Silver Age', 'Drums', '2010-04-02', '0000-00-00'),
			(5, 'The Pretty Okay', 'Vocals', '2017-06-01', '0000-00-00'),
			(6, 'The Pretty Okay', 'Guitar', '2017-06-01', '0000-00-00'),
			(7, 'The Pretty Okay', 'Guitar', '2017-06-01', '2018-02-11'),
			(8, 'The Pretty Okay', 'Bass', '2017-06-01', '0000-00-00'),
			(9, 'The Pretty Okay', 'Drums', '2017-06-01', '0000-00-00'),
			(10, 'If Walls Could Talk', 'Lead Vocals', '2013-07-20', '0000-00-00'),
			(11, 'If Walls Could Talk', 'Guitar', '2013-07-20', '0000-00-00'),
			(11, 'If Walls Could Talk', 'Vocals', '2013-07-20', '0000-00-00'),
			(12, 'If Walls Could Talk', 'Percussion', '2013-07-20', '0000-00-00'),
			(12, 'If Walls Could Talk', 'Vocals', '2013-07-20', '0000-00-00'),
			(13, 'If Walls Could Talk', 'Bass', '2013-08-04', '0000-00-00'),
			(13, 'If Walls Could Talk', 'Vocals', '2013-08-04', '2017-09-23'),
			(14, 'If Walls Could Talk', 'Keys', '2013-11-30', '0000-00-00'),
			(15, 'Brother Son', 'Guitar', '2016-02-13', '0000-00-00'),
			(15, 'Brother Son', 'Vocals', '2016-02-13', '0000-00-00'),
			(16, 'Brother Son', 'Drums', '2016-02-13', '0000-00-00'),
			(17, 'Brother Son', 'Bass', '2016-02-13', '0000-00-00'),
				(18, 'Brother Son', 'Keyboard', '2016-02-14', '0000-00-00'),
				(19, 'If Only, If Only', 'Vocals', '2017-11-14', '0000-00-00'),
				(20, 'If Only, If Only', 'Piano', '2017-11-14', '0000-00-00'),
				(21, 'If Only, If Only', 'Violin', '2017-11-14', '0000-00-00'),
				(22, 'If Only, If Only', 'Bass', '2017-11-14', '0000-00-00'),
				(23, 'If Only, If Only', 'Flute', '2017-11-14', '0000-00-00'),
				(24, 'Sidewatcher', 'Guitar', '2017-08-30', '0000-00-00'),
				(24, 'Sidewatcher', 'Vocals', '2017-08-30', '0000-00-00'),
				(25, 'Sidewatcher', 'Bass', '2017-08-30', '0000-00-00'),
				(25, 'Sidewatcher', 'Vocals', '2017-08-30', '0000-00-00'),
				(26, 'Sidewatcher', 'Drums', '2017-08-30', '0000-00-00'),
				(26, 'Sidewatcher', 'Keyboard', '2017-08-30', '0000-00-00'),
				(27, 'The Doozers', 'Bass', '2015-05-10', '0000-00-00'),
				(28, 'The Doozers', 'Vocals', '2015-05-10', '0000-00-00'),
				(29, 'The Doozers', 'Drums', '2015-05-10', '0000-00-00'),
				(30, 'The Doozers', 'Guitar', '2015-05-10', '0000-00-00');

INSERT INTO ALBUM(Band, Album, Release_date, Type) VALUES
				('Better Thoughts', 'Scream', '2018-01-01', 'Single'),
				('Better Thoughts', 'Smile', '2017-01-01', 'Single'),
				('Brother Son', 'Growth', '2017-11-25', 'Single'),
				('Brother Son', 'Young & Pretty', '2017-03-31', 'Album'),
				('If Walls Could Talk', 'Static', '2018-04-24', 'Single'),
				('If Walls Could Talk', 'What Would They Say?', '2016-06-09', 'EP'),
				('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', '2018-06-08', 'Album'),
				('Sidewatcher', 'A Blue Christmas', '2016-12-01', 'EP'),
				('Sidewatcher', 'Drive', '2016-09-07', 'Album'),
				('Sidewatcher', 'Going Steady', '2017-01-19', 'Single'),
				('Sidewatcher', 'Otra Vez, Vol. I & II', '2016-03-17', 'EP'),
				('Silver Age', 'CLV', '2017-03-10', 'EP'),
				('Silver Age', 'Never Did', '2017-07-17', 'Single'),
				('Silver Age', 'Objects in Mirror Are Closer Than They Appear', '2015-10-31', 'Album'),
				('The Dirty News', 'The Dirty News', '2017-01-01', 'EP'),
				('The Doozers', 'A Year Ago', '2017-06-04', 'EP'),
				('The Doozers', 'Charlie\'s Glasses', '2018-03-31', 'Single'),
				('The Doozers', 'School Store Promotions', '2018-06-20', 'EP'),
				('The Pretty Okay', 'Wilder', '2017-05-02', 'EP');

INSERT INTO SONG(Band, Album, Song_title, Duration, Track_num) VALUES
				('Brother Son', 'Young & Pretty', 'All I Wanted', '03:30:00', 4),
				('Brother Son', 'Young & Pretty', 'Blue Dream', '04:04:00', 9),
				('Brother Son', 'Young & Pretty', 'Confidence', '03:23:00', 2),
				('Brother Son', 'Young & Pretty', 'Daddy Issues ', '03:27:00', 8),
				('Brother Son', 'Young & Pretty', 'Growth', '04:30:00', 12),
				('Brother Son', 'Young & Pretty', 'Interlude ', '00:58:00', 10),
				('Brother Son', 'Young & Pretty', 'Intro', '00:43:00', 1),
				('Brother Son', 'Young & Pretty', 'Magical', '02:47:00', 5),
				('Brother Son', 'Young & Pretty', 'Omnipresence', '03:19:00', 7),
				('Brother Son', 'Young & Pretty', 'Rock N\' Roll', '02:51:00', 3),
				('Brother Son', 'Young & Pretty', 'Truth Inside', '03:41:00', 11),
					('Brother Son', 'Young & Pretty', 'Yeyo', '03:21:00', 6),
					('If Walls Could Talk', 'Static', 'Static', '04:23:00', 7),
					('If Walls Could Talk', 'What Would They Say?', 'Beautiful You', '02:54:00', 1),
					('If Walls Could Talk', 'What Would They Say?', 'Nighttime', '03:27:00', 5),
					('If Walls Could Talk', 'What Would They Say?', 'Sleepless', '03:14:00', 2),
					('If Walls Could Talk', 'What Would They Say?', 'Specter of the Dead', '04:07:00', 4),
					('If Walls Could Talk', 'What Would They Say?', 'Summertime', '03:04:00', 3),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'A Rose in the Sky (Live Redux)', '05:01:00', 7),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'Beautiful You', '02:56:00', 2),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'Beautiful You (Live Redux)', '03:30:00', 8),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'Nighttime', '03:29:00', 6),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'Nighttime (Live Redux)', '05:02:00', 9),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'Sleepless', '03:16:00', 3),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'Specter of the Dead', '04:09:00', 5),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'Static', '04:23:00', 1),
					('If Walls Could Talk', 'What Would They Say? (Deluxe Edition)', 'Summertime', '03:06:00', 4),
					('Sidewatcher', 'Drive', 'Alien Love Affair', '03:08:00', 3),
					('Sidewatcher', 'Drive', 'California Strawberries', '03:18:00', 5),
					('Sidewatcher', 'Drive', 'Drive', '02:45:00', 1),
					('Sidewatcher', 'Drive', 'Raw-Hide', '02:25:00', 4),
					('Sidewatcher', 'Drive', 'Surf Hell', '02:51:00', 2),
					('Sidewatcher', 'Drive', 'Wipe Out', '02:13:00', 6),
					('The Doozers', 'A Year Ago', 'Banana Peel', '03:21:00', 2),
					('The Doozers', 'A Year Ago', 'D Major Teenager', '03:14:00', 4),
					('The Doozers', 'A Year Ago', 'Foot Fetish', '02:49:00', 3),
					('The Doozers', 'A Year Ago', 'Ripoff', '04:30:00', 1),
					('The Doozers', 'Charlie\'s Glasses', 'Charlie\'s Glasses', '03:18:00', 1),
					('The Doozers', 'School Store Promotions', 'Dream Beans', '04:05:00', 4),
					('The Doozers', 'School Store Promotions', 'Exposition Everist', '01:26:00', 1),
					('The Doozers', 'School Store Promotions', 'He\'s a Robot', '02:51:00', 3),
					('The Doozers', 'School Store Promotions', 'Less Indie One', '04:44:00', 2),
					('The Pretty Okay', 'Wilder', 'Crying in the Bathroom', '04:06:00', 3),
					('The Pretty Okay', 'Wilder', 'Demons', '03:17:00', 2),
					('The Pretty Okay', 'Wilder', 'Little Black Raincloud', '03:03:00', 1),
					('The Pretty Okay', 'Wilder', 'Prescribed', '03:49:00', 4),
					('The Pretty Okay', 'Wilder', 'Wilder', '03:52:00', 5);

INSERT INTO VENUE(Venue_name, Location_state, Location_city, Address) VALUES
					('Allstate Arena', 'IL', 'Rosemont', ' 6920 Mannheim Rd, Rosemont'),
					('Beat Kitchen', 'IL', 'Chicago', '2534 Evans Rd'),
					('Donatos', 'OH', 'Columbus', '4565 Slump Ln'),
					('Hoosier Dome', 'IN', 'Indianapolis', '9685 Stephan Rd'),
					('Skylark Social Club', 'NC', 'Greensboro', '87957 Becket Rd'),
					('Spinelli\'s Downtown', 'KY', '', '4542 Avery Ln'),
					('The Beehive', 'TN', 'Nashville', '875254 Becka Ave'),
					('The Firebird', 'MO', 'St. Louis', '2547 Evans Rd'),
					('The Loving Touch', 'MI', 'Ferndale', 'A Place'),
					('The Shed', 'AL', 'Tuscumbia', '5453 Water Cr');
INSERT INTO TOUR(Tour_ID, Name, Headliner) VALUES
						(1, 'Winter Tour', 'If Walls Could Talk'),
						(2, 'Winter Tour', 'If Only, If Only');

INSERT INTO SHOWS(Tour_ID, Venue, Date, Time) VALUES
						(1, 'The Loving Touch', '2018-12-26', '19:00:00'),
						(2, 'Beat Kitchen', '2018-12-27', '19:00:00'),
						(2, 'The Firebird', '2018-12-28', '19:00:00'),
						(2, 'Hoosier Dome', '2018-12-29', '19:00:00'),
						(2, 'Spinelli\'s Downtown', '2018-12-30', '19:00:00'),
						(2, 'The Beehive', '2018-12-31', '19:00:00'),
						(2, 'The Shed', '2019-01-01', '19:00:00'),
						(2, 'Skylark Social Club', '2019-01-02', '19:00:00'),
						(2, 'The Loving Touch', '2019-01-03', '19:00:00'),
						(2, 'The Loving Touch', '2019-01-04', '19:00:00'),
						(2, 'The Loving Touch', '2019-01-05', '19:00:00'),
						(2, 'Donatos', '2019-01-06', '19:00:00');

INSERT INTO OPENER(Band, Tour_ID, Date) VALUES
						('Early Humans', 2, '2018-12-27'),
						('Early Humans', 2, '2018-12-28'),
						('Early Humans', 2, '2018-12-29'),
						('Early Humans', 2, '2018-12-30'),
						('Early Humans', 2, '2019-01-01'),
						('Early Humans', 2, '2019-01-02'),
						('Early Humans', 2, '2019-01-03'),
						('Early Humans', 2, '2019-01-04'),
						('Early Humans', 2, '2019-01-05'),
						('secret forte', 1, '2018-12-26'),
						('telegraf', 1, '2018-12-26');

-- create the users and grant priveleges to those users
GRANT SELECT, INSERT, DELETE, UPDATE
ON band2gether.*
TO manager@localhost
IDENTIFIED BY 'pa55word';
