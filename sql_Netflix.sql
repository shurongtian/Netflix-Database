CREATE TABLE ACCOUNT( /*Netflix Account*/
		AccountID CHAR(20),
		AccountFname CHAR(20),
		AccountMname CHAR(20),
		AccountLname CHAR(20),

		Email CHAR(30),
		Password CHAR(20),	
		PRIMARY KEY(AccountID));

CREATE TABLE BASIC_ACCOUNT( /*lets you stream TV shows and movies from Netflix 
							on one device at a time in standard definition (SD). 
							This plan also lets you download titles to one phone or tablet.*/
		AccountID CHAR(20),
		FOREIGN KEY(AccountID) REFERENCES ACCOUNT(AccountID) ON DELETE CASCADE);

CREATE TABLE STANDARD_ACCOUNT( /*lets you stream TV shows and movies from Netflix 
							on two devices at the same time and in high definition (HD) when available. 
							This plan also lets you download titles to two phones or tablets.*/
		AccountID CHAR(20),

		FOREIGN KEY(AccountID) REFERENCES ACCOUNT(AccountID) ON DELETE CASCADE);

CREATE TABLE PREMIUM_ACCOUNT( /*lets you stream TV shows and movies from Netflix on four devices at the same time and in 
						high definition (HD) 
						and ultra high definition (UHD) when available. This plan also lets you download titles to 
						four phones or tablets.*/
		AccountID CHAR(20),

		FOREIGN KEY(AccountID) REFERENCES ACCOUNT(AccountID) ON DELETE CASCADE);

CREATE TABLE ACCOUNT_USERS( /*Ties in all users to account*/
		AccountID CHAR(20), 
		NumOfUsers INTEGER, /*Lists the number of users on the netflix account */
		UserIDs CHAR(20), /*Lists the ID #s of the users on the netflix account */
		Permission CHAR(20), /*Lists the permissions of the users on the netflix account */
		Age INTEGER,
		Sex CHAR(20),
		PRIMARY KEY(UserIDs),
		FOREIGN KEY(AccountID) REFERENCES ACCOUNT(AccountID) ON DELETE CASCADE);

CREATE TABLE BILLING( /*Billing info for Netflix account*/
	AccountID CHAR(20),

	BillingFname CHAR(20),
	BillingMname CHAR(20),
	BillingLname CHAR(20),

	Street CHAR(50),
	City CHAR(25),
	State CHAR(20),
	Country CHAR(20),
	Zipcode INTEGER,

	CreditCard CHAR(20),
	Email CHAR(20),
	PhoneNumber CHAR(20),

	PRIMARY KEY(AccountID),
	FOREIGN KEY(AccountID) REFERENCES ACCOUNT(AccountID) ON DELETE CASCADE);

CREATE TABLE NETFLIX_MEDIA( /*Info for shows on Netflix*/
	Show_ID CHAR(50), /*Differentiats show from other netflix shows*/

	NameOfShow CHAR(50),
	Director CHAR(30),
	NumSeasons INT,
	Actors CHAR(50),
	CharNames CHAR(50),
	NumEpisodes INT,
	Genres CHAR(20),
	ReleaseYear INT,
	CriticRating CHAR(10),
	UserRating CHAR(10),

	PRIMARY KEY(Show_ID));

CREATE TABLE USERS_INFO( /*Info for all users personal account info on main account*/
	UserIDs CHAR(20),
	Language CHAR(10),
	AccountLife CHAR(30),
	AccessPermissions CHAR(5),
	AcctType CHAR(10),
	Demographic CHAR(10),
	
	PRIMARY KEY(UserIDs),
	FOREIGN KEY(UserIDs) REFERENCES ACCOUNT_USERS(UserIDs) ON DELETE CASCADE);

CREATE TABLE USER_STATISTICS( /*Info on shows user watched, the time spent on netflix, etc.*/
	UserID CHAR(20),

	WatchHistory CHAR(50), /*Contains all the shows in Netflix_Media (IDs) the user watched STEP 1*/
	ViewingTime CHAR(50),
	Frequency CHAR(50),
	TotalTime CHAR(50),
	LastLogin CHAR(50),
	RatingHistory CHAR(100),

	PRIMARY KEY (UserID, WatchHistory),
	FOREIGN KEY(UserID) REFERENCES USERS_INFO(UserIDs) ON DELETE CASCADE,
	FOREIGN KEY(WatchHistory) REFERENCES NETFLIX_MEDIA(Show_ID) ON DELETE CASCADE);

CREATE TABLE USER_RECOMMENDATIONS(
	UserID CHAR(20),

	PullWatchHistory CHAR(50), /*STEP 2: Pull Shows user watched*/
	
	/*STEP 3: Pull preferred information out of watch history*/
	UserWatchedGenres CHAR(50), 
	UserPreferredActors CHAR(50),
	UserPreferredDirectors CHAR(50),
	/*-------------------------------------------------------*/

	/*STEP 4: Calcuate shows user might like based on statistics pulled from watch history*/
	CalculatedRecommendationsBasedonPreferences CHAR(50), /*Algorithm behind the scenes calculates recommendation
															feed based on preferred genres, actors, directors*/

	PRIMARY KEY(UserID, CalculatedRecommendationsBasedonPreferences),
	FOREIGN KEY(UserID, PullWatchHistory) REFERENCES USER_STATISTICS(UserID, WatchHistory) ON DELETE CASCADE);
	

	/*Insert Statements for Account*/

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('shrinathrao97', 'Shrinath', 'Raghunath', 'Rao', 'thisisatest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('adam97', 'Adam', 'NotSure', 'Uribe', 'secondtest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('monica97', 'Monica', 'NotSure', 'Phan', 'thirdtest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('jerry97', 'Jerry', 'NotSure', 'Seinfeld', 'fourthtest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('daaron97', 'Daaron', 'The', 'Baaron', 'fifthtest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('enterprise1', 'Jean', 'Luc', 'Picard', 'sixthtest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('sharong97', 'Sharong', 'NotSure', 'Lmao', 'seventhtest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('falcon1', 'Han', 'None', 'Solo', 'eighttest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('falcon2', 'Chewbaca', 'None', 'None', 'ninetest@mail.com', 'passcode')

INSERT INTO ACCOUNT (AccountID, AccountFname, AccountMname, AccountLname, Email, Password) VALUES ('audioslave', 'Chris', '', 'Cornell', 'tenthtest@mail.com', 'passcode')

	/*Insert Statements for Account_Users*/

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('shrinathrao97', 1, '20', 'full', 21, 'Male')

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('adam97', 1, '32', 'full', 21, 'Male')

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('monica97', 1, '2', 'full', 21, 'Female')

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('jerry97', 1, '5', 'full', 21, 'Male')

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('daaron97', 1, '50', 'full', 21, 'Male')

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('sharong97', 1, '233', 'full', 21, 'Female')

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('enterprise1', 2, '1, 2', 'full, child', 65, 'Male')

INSERT INTO ACCOUNT_USERS (AccountID,NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('falcon1', 1, '322', 'full', 45, 'Male')

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('falcon2', 1, '89', 'full', 45, 'Male')

INSERT INTO ACCOUNT_USERS (AccountID, NumOfUsers, UserIDs, Permission, Age, Sex) VALUES
('audioslave', 1, '99', 'full', 52, 'Male')

	/*INSERT STATEMENTS FOR BILLING*/

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('shrinathrao97', 'Shrinath', 'Raghunath', 'Rao', 'Rockpoint Dr', 'Austin', 'TX', 'USA', 78731, '12345678910123456789', 'thisisatest@mail.com', '6237083630')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('adam97', 'Adam', 'NotSure', 'Uribe','Imaginary Dr', 'Austin', 'TX', 'USA', 78739, '12345678912123456789', 'secondtest@mail.com', '6537003630')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('monica97', 'Monica', 'NotSure', 'Phan', 'Another Dr' ,'Dallas','TX', 'USA', 78731, '12345678910123456789', 'thirdtest@mail.com', '6237003670')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('jerry97', 'Jerry', 'NotSure', 'Seinfeld', 'Someother Dr', 'Austin', 'TX', 'USA', 78731, '12345278910123456789', 'fourthtest@mail.com', '6837003630')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('daaron97', 'Daaron', 'The', 'Baaron', 'Why Dr', 'Austin', 'TX', 'USA', 78731, '12345678910123456789', 'fifthtest@mail.com', '6237003630')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('sharong97', 'Shurong','NotSure', 'Tian','What Dr', 'Austin', 'TX', 'USA', 78731, '12345678910123956789', 'sixthtest@mail.com', '6237003830')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('enterprise1', 'Jean', 'Luc', 'Picard', 'How Dr', 'Austin', 'TX', 'USA', 78731, '19345678910123456789', 'seventhtest@mail.com', '6337003630')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('falcon1', 'Han', 'None', 'Solo', 'Who Dr', 'Austin', 'TX', 'USA', 78731, '18345678910123456789', 'eighttest@mail.com', '6237003030')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('falcon2', 'Chewbaca', 'None', 'None', 'Where Dr', 'Austin', 'TX', 'USA', 78731, '18945678910123456789', 'ninetest@mail.com', '6937003630')

INSERT INTO BILLING(AccountID, BillingFname, BillingMname, BillingLname, Street, City, State, Country, Zipcode, CreditCard, Email, PhoneNumber)
VALUES ('audioslave', 'Chris', '', 'Cornell', 'Where Dr', 'Austin', 'TX', 'USA', 78731, '18945698910123456789', 'tenthtest@mail.com', '6233003630')
	
	/*INSERT STATEMENTS FOR NETFLIX_MEDIA*/

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('987654321', 'FRINGE', 'J.J Abrams', 4, 'John Noble','Dr. Walter Bishop','100','Sci-Fi',2008,'8.4','10')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('123456789', 'Game of Thrones', 'David Benioff', 7, 'Peter Dinklage','Tyrion Lannister','67','Drama',2011,'9.5','10')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('1029384756', 'Doctor Strange', 'Scott Derrickson', null, 'Benedict Cumberbatch','Dr. Stephen Strange',null,'Action',2016,'7.5','8')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('6758437598', 'The West Wing', 'Aaron Sorkin', 7, 'Martin Sheen','Jed Bartlet','156','Drama',1999,'8.5','8.2')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('2395983244', 'Star Trek: The Next Generation', 'Gene Roddenberry', 7, 'Patrick Stewarrt','Capt. Jean-Luc Picard','178','Sci-Fi',1987,'9.4','9.2')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('3423794324', 'Star Trek', 'Gene Roddenberry', 3, 'William Shatner','Captain Kirk','79','Sci-Fi',1966,'8.4','8.7')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('9384723934', 'Altered Carbon', 'Laeta Kalogridis', 1, 'Joel Kinnaman','Takeshi Kovacs','10','Drama',2018,'9.7','9.8')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('3453454353', 'Stranger Things', 'Matt Duffer', 2, 'Winona Ryder','Joyce Byers','100','Mystery/Adventure',2016,'7.5','8.2')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('5645654444', 'Black Mirror', 'Charlie Brooker', 4, 'Daniel lapaine','Dawson','19','Sci-Fi',2008,'8.7','9')

INSERT INTO NETFLIX_MEDIA(Show_ID, NameOfShow, Director, NumSeasons, Actors, CharNames, NumEpisodes, Genres, ReleaseYear, CriticRating, UserRating)
VALUES ('3333333222', 'Arrested Development', 'Mitchel Hurwitz', 5, 'Jason Bateman','Michael Bluth','76','Comedies',2003,'8.2','7')

	/*INSERT STATEMENTS FOR USERS_INFO*/

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(20, 'English', '6 months','User','Basic','American')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(32, 'English', '1 year','Admin','Premium','African')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(2, 'Roar', '3 months','Admin','Standard','Australian')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(5, 'English', '1 month','User','Basic','Russian')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(50, 'English', '6 months','User','Standard','Indian')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(233, 'Japanese', '1 year','Admin','Premium','Canadian')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES('1, 2', 'Spanish', 'Auto-Renewal','User','Basic','Japanese')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(322, 'English', '6 months','User','Standard','Korean')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(89, 'Spanish', '3 months','User','Premium','Mexican')

INSERT INTO USERS_INFO(UserIDs, Language, AccountLife, AccessPermissions, AcctType, Demographic)
VALUES(99,  'German', '1 month','Admin','Basic','American')

	/*INSERT INTO USER_STATISTICS*/

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(20, '987654321', '30 min', '7 Logins per Week', '520 hours logged in past Month', '6:28pm 2/2/18', 'Thumbs up')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(32, '123456789', '50 min', '10 Logins per Week', '30 hours logged in past Month', '5:37pm 6/27/18', 'Thumbs down')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(2, '3333333222', '45 min', '1 Logins per Week', '10 hours logged in past Month', '4:46pm 10/15/17', 'Thumbs down')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(5, '5645654444', '70 min', '5 Logins per Week', '456 hours logged in past Month', '3:55pm 12/20/17', 'Thumbs up')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(50, '3453454353', '85 min', '4 Logins per Week', '123 hours logged in past Month', '2:05pm 1/12/18', 'Thumbs up')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(233, '9384723934', '5 min', '2 Logins per Week', '100 hours logged in past Month', '1:12pm 7/1/18', 'Thumbs up')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES('1, 2', '3423794324', '90 min', '3 Logins per Week', '420 hours logged in past Month', '12:30pm 6/23/18', 'Thumbs down')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(322, '2395983244', '100 min', '1 Logins per Week', '330 hours logged in past Month', '11:08pm 5/1/18', 'Thumbs up')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(89, '6758437598', '33 min', '0.2 Logins per Week', '2 hours logged in past Month', '10:58pm 4/20/18', 'Thumbs down')

INSERT INTO USER_STATISTICS(UserID, WatchHistory, ViewingTime, Frequency, TotalTime, LastLogin, RatingHistory) 
VALUES(99, '1029384756', '35 min', '3 Logins per Week', '200 hours logged in past Month', '9:20pm 3/3/18', 'Thumbs up')

	/*INSERT INTO USER_RECOMMENDATIONS*/
INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(99, '1029384756','Romance', 'Megan Fox, Robert De Niro', 'J.J. Abrams', 'Wolf of Wallstreet')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(89, '6758437598','Horror', 'Robin Wright, Liev Schreiber', 'Gene Roddenberry', 'Pulp Fiction')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(322, '2395983244','Drama, Action', 'Emma Stone, Naomi Watts', 'Quentin Tarantino', 'The Other Guys')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(50,  '3453454353','Adventure', 'Jessica Chastain, Emily Blunt', 'Seth Macfarlane', 'Star Wars')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(5, '5645654444','Thriller', 'Bryce Dallas Howard, Ron Howard', 'George Lucas', 'The Godfather')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(233,'9384723934','Comedy', 'Chris Hemsworth, Zoe Saldana', 'Joss Whedon', 'Finding Dory')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(20, '987654321','Documentary', 'Ryan Reynolds, Chris Pratt', 'Anthony Russo', 'Finding Nemo')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(2, '3333333222','Western', 'Scarlett Johansson, Chris Evans', 'Joe Russo', 'Spiderman')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES(32, '123456789','Drama, Suspense', 'Ronald Reagan, Robert Downey Jr.', 'Andrew Stanton', 'The Avengers')

INSERT INTO USER_RECOMMENDATIONS(UserID, PullWatchHistory, UserWatchedGenres, UserPreferredActors, UserPreferredDirectors, CalculatedRecommendationsBasedonPreferences)
VALUES('1, 2','3423794324','Mystery, Anime', 'Jamie Foxx, Tom Cruise', 'Francis Ford Coppola', '21 Jump Street')




SELECT * FROM ACCOUNT
SELECT * FROM ACCOUNT_USERS
SELECT * FROM BILLING 
SELECT * FROM NETFLIX_MEDIA
SELECT * FROM USERS_INFO
SELECT * FROM USER_STATISTICS
SELECT * FROM USER_RECOMMENDATIONS