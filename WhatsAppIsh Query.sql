-- Creating table for users
CREATE TABLE Users
(ID int unique not null,
FullName varchar(100) not null,
Username varchar(50) unique not null,
PhoneNumber bigint unique not null,
Age int not null,
Gender varchar(50) not null,
primary key(Username))

--Populating users table
INSERT INTO Users VALUES
(1, 'Leonard Hofstadter', 'Leonard', 2349098889890, 26, 'Male'),
(2, 'Sheldon Cooper', 'Sheldon', 2349098889891, 24, 'Male'),
(3, 'Queen Penelope', 'Penny', 2349098889892, 23, 'Female'),
(4, 'Rajesh Koothrappali', 'Raj', 2349098889893, 26, 'Male'),
(5, 'Howard Wolowitz', 'Howard', 2349098889894, 26, 'Male'),
(6, 'Bernadette Rostenkalski', 'Bernadette', 2349098889895, 24, 'Female'),
(7, 'Amelia Fowler', 'Amy', 2349098889896, 26, 'Female'),
(8, 'Barry Kripky', 'Bawy', 2349098889897, 25, 'Male'),
(9, 'Leslie Winkle', 'SheldonNemesis', 2349098889898, 26, 'Female'),
(10, 'Steven Hawkin', 'Robot', 2349098889899, 45, 'Male')


--Creating table for message senders
CREATE TABLE Sender
(
Username varchar (50) references Users (Username) not null,
PhoneNumber bigint not null,
primary key (Username),
foreign key (PhoneNumber) references Users (PhoneNumber)
)

--Populating sender's table
INSERT INTO Sender VALUES
('Leonard', 2349098889890),
('Penny', 2349098889892),
('Howard', 2349098889894),
('Bernadette', 2349098889895),
('Bawy', 2349098889897),
('SheldonNemesis', 2349098889898),
('Robot', 2349098889899),
('Raj', 2349098889893),
('Sheldon', 2349098889891),
('Amy', 2349098889896)


--Creating table for message Receipients
CREATE TABLE Receipient
(
Username varchar (50) references Users (Username) not null,
PhoneNumber bigint not null,
primary key (Username),
foreign key (PhoneNumber) references Users (PhoneNumber)
)

--Populating receipeint's table
INSERT INTO Receipient VALUES
('Leonard', 2349098889890),
('Penny', 2349098889892),
('Howard', 2349098889894),
('Bernadette', 2349098889895),
('Bawy', 2349098889897),
('SheldonNemesis', 2349098889898),
('Robot', 2349098889899),
('Raj', 2349098889893),
('Sheldon', 2349098889891),
('Amy', 2349098889896)


--Creating table for message log
CREATE TABLE MessageLog
(Content text not null,
MessageID int unique not null,
Sender varchar(50) not null,
Receiver varchar(50) not null,
TimeSent datetime not null,
TimeReceived datetime not null,
foreign key(Receiver) references Receipient (Username),
foreign key(Sender) references Sender (Username))

--Populating Message log table
INSERT INTO MessageLog VALUES
('Sheldon, lets go!', 1, 'Raj', 'Sheldon', '2020-03-09T12:43:34', '2020-03-09T12:44:00'),
('Interesting. You’re afraid of insects and women. Ladybugs must render you catatonic.', 2, 'Sheldon', 'Raj', '2020-03-09T12:44:02', '2020-03-09T12:44:02'),
('Sheldon, just because you have a focus on cleanliness that borders on the psychotic does not mean I have to particiapte', 3, 'Amy', 'Sheldon', '2020-03-09T16:09:23', '2020-03-09T16:09:23'),
('I have a docotorate degree in NeuroBiology so if my boyfriend is crazy, it is a ding on my reputation', 4, 'Amy', 'Sheldon', '2020-03-09T16:09:23', '2020-03-09T16:09:24'),
('I am not crazy. My mother had me tested', 5,'Sheldon', 'Amy', '2020-03-09T16:10:00', '2020-03-09T12:10:01')
