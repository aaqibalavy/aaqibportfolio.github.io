-- UNCOMMENT LINE BELOW TO CREATE DATABSE
-- CREATE DATABASE EUROSTAR;

-- Creating Tables 

USE EUROSTAR;

CREATE TABLE PASSENGERS 
    (PASSPORT_ID VARCHAR(9) NOT NULL, 
    FNAME VARCHAR(15) NOT NULL,  
    LNAME VARCHAR(15) NOT NULL, 
    PASSENGER_TYPE VARCHAR(20) NOT NULL, 
    PRIMARY KEY(PASSPORT_ID));     

   
CREATE TABLE TICKETS 
    (TICKET_ID VARCHAR(10) NOT NULL,
    PASSPORT_ID VARCHAR(9) NOT NULL,
    RIDE_ID VARCHAR(10) NOT NULL,
    PRICE FLOAT(5,2) NOT NULL,
    PRIMARY KEY(TICKET_ID),
    FOREIGN KEY(PASSPORT_ID) REFERENCES PASSENGERS(PASSPORT_ID)); 
 

CREATE TABLE RIDES 
    (RIDE_ID VARCHAR(10) NOT NULL,
    ROUTE_ID VARCHAR(10) NOT NULL, 
    CREW_ID VARCHAR(10) NOT NULL, 
    TRAIN_ID VARCHAR(10) NOT NULL, 
    DEP_TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    TERM_TIMESTAMP TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY(RIDE_ID));                                                                   

 
CREATE TABLE TRAINS 
    (TRAIN_ID VARCHAR(10), 
    IF_OPERATING BOOL, 
    IF_MODERN BOOL, 
    PRIMARY KEY(TRAIN_ID));    
 

CREATE TABLE EMPLOYEES 
    (EMPLOYEE_ID VARCHAR(10), 
    ROLE VARCHAR(20), 
    FNAME VARCHAR(15), 
    LNAME VARCHAR(15), 
    PRIMARY KEY(EMPLOYEE_ID));   
 

CREATE TABLE TRAIN_CREW
    (CREW_ID VARCHAR(10) NOT NULL, 
    DRIVER1 VARCHAR(10) NOT NULL, 
    DRIVER2 VARCHAR(10) NOT NULL, 
    CONDUCTOR1 VARCHAR(10) NOT NULL, 
    CONDUCTOR2 VARCHAR(10) NOT NULL, 
    HEAD_OF_CREW VARCHAR(10) NOT NULL, 
    SERVICE_TEAM1 VARCHAR(10) NOT NULL, 
    SERVICE_TEAM2 VARCHAR(10) NOT NULL, 
    SERVICE_TEAM3 VARCHAR(10) NOT NULL, 
    SERVICE_TEAM4 VARCHAR(10) NOT NULL, 
    SERVICE_TEAM5 VARCHAR(10) NOT NULL, 
    SECURITY_GUARD1 VARCHAR(10) NOT NULL, 
    SECURITY_GUARD2 VARCHAR(10) NOT NULL, 
    PRIMARY KEY(CREW_ID),
    FOREIGN KEY(DRIVER1) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(DRIVER2) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(CONDUCTOR1) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(CONDUCTOR2) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(HEAD_OF_CREW) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(SERVICE_TEAM1) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(SERVICE_TEAM2) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(SERVICE_TEAM3) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(SERVICE_TEAM4) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(SERVICE_TEAM5) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(SECURITY_GUARD1) REFERENCES EMPLOYEES(EMPLOYEE_ID), 
    FOREIGN KEY(SECURITY_GUARD2) REFERENCES EMPLOYEES(EMPLOYEE_ID));   

 
CREATE TABLE ROUTE_TYPE 
    (TYPE_ID VARCHAR(1) NOT NULL, 
    TYPE_NAME VARCHAR(10) NOT NULL, 
    PRIMARY KEY(TYPE_ID));     

 
CREATE TABLE STATIONS 
    (STATION_ID VARCHAR(10) NOT NULL, 
    STATION_NAME VARCHAR(10) NOT NULL, 
    PRIMARY KEY(STATION_ID)); 

 
CREATE TABLE STATION_LINKS
    (LINK_ID VARCHAR(10) NOT NULL, 
    STATION_ID VARCHAR(10) NOT NULL, 
    NEXT_STATION VARCHAR(10) NOT NULL, 
    PREV_STATION VARCHAR(10) NOT NULL, 
    ROUTE_ID VARCHAR(10) NOT NULL, 
    PRIMARY KEY(LINK_ID), 
    FOREIGN KEY(STATION_ID) REFERENCES STATIONS(STATION_ID), 
    FOREIGN KEY(NEXT_STATION) REFERENCES STATIONS(STATION_ID), 
    FOREIGN KEY(PREV_STATION) REFERENCES STATIONS(STATION_ID)); 


CREATE TABLE ROUTES 
    (ROUTE_ID VARCHAR(10) NOT NULL, 
    DISTANCE INT(3) NOT NULL, 
    JOURNEY_TIME TIME NOT NULL, 
    TRAIN_ID VARCHAR(10) NOT NULL, 
    ROUTE_TYPE VARCHAR(10) NOT NULL, 
    ROUTE_STATUS VARCHAR(20) NOT NULL, 
    IS_NEW_ROUTE BOOL, 
    TERM_STATION VARCHAR(10), 
    DEPART_STATION VARCHAR(10), 
    PRIMARY KEY(ROUTE_ID), 
    FOREIGN KEY(TRAIN_ID) REFERENCES TRAINS(TRAIN_ID), 
    FOREIGN KEY(ROUTE_TYPE) REFERENCES ROUTE_TYPE(TYPE_ID), 
    FOREIGN KEY(TERM_STATION) REFERENCES STATIONS(STATION_ID), 
    FOREIGN KEY(DEPART_STATION) REFERENCES STATIONS(STATION_ID)); 



-- INSERTING DATA

INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("1241125LH","Aaqib", "Alavy", "Student"); 
INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("5452407DH", "John", "Doe", "Worker"); 
INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("6993459TH","Emma", "Brown", "Passenger"); 
INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("3652476AB","Emily", "Smith", "Student"); 
INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("9362527ED","Eric", "Birling", "Student"); 
INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("8362437RD","Ella", "Taylor", "Worker"); 
INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("7700225VH","Victor", "Roberts", "Passenger"); 
INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("8263598OK","Lionel", "Messi", "Passenger"); 
INSERT INTO PASSENGERS(PASSPORT_ID,FNAME,LNAME, PASSENGER_TYPE) VALUES ("7369205IT","Cristiano", "Ronaldo", "Passenger"); 



INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("AC21507CH", "7700225VH", "001", "5.99"); 
INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("BD52107DH", "5452407DH", "002", "7.99" ); 
INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("CE72150EH", "1241125LH", "003", "11.99" ); 
INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("DF21850FH", "6993459TH", "004", "5.99" ); 
INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("EC12507CH", "3652476AB", "005", "5.99" ); 
INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("FD24107DH", "9362527ED", "006", "7.99" ); 
INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("GE47150EH", "8362437RD", "001", "11.99" ); 
INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("HF89850FH", "8263598OK", "002", "11.99" ); 
INSERT INTO TICKETS(TICKET_ID, PASSPORT_ID, RIDE_ID, PRICE) VALUES ("SM20050BT", "7369205IT", "003", "11.99" ); 

 

INSERT INTO RIDES(RIDE_ID, ROUTE_ID, CREW_ID, DEP_TIMESTAMP, TERM_TIMESTAMP, TRAIN_ID) VALUES ("001", "1L", "000", "2022-01-01 18:00:00", "2022-01-01 22:00:00", "C77"); 
INSERT INTO RIDES(RIDE_ID, ROUTE_ID, CREW_ID, DEP_TIMESTAMP, TERM_TIMESTAMP, TRAIN_ID) VALUES ("002", "2L", "001", "2022-01-01 09:30:00", "2022-01-01 10:45:00", "D67"); 
INSERT INTO RIDES(RIDE_ID, ROUTE_ID, CREW_ID, DEP_TIMESTAMP, TERM_TIMESTAMP, TRAIN_ID) VALUES ("003", "1A", "002", "2022-01-01 10:30:00", "2022-01-01 12:45:00", "E27"); 
INSERT INTO RIDES(RIDE_ID, ROUTE_ID, CREW_ID, DEP_TIMESTAMP, TERM_TIMESTAMP, TRAIN_ID) VALUES ("004", "2A", "000", "2022-01-01 11:00:00", "2022-01-01 15:00:00", "C77"); 
INSERT INTO RIDES(RIDE_ID, ROUTE_ID, CREW_ID, DEP_TIMESTAMP, TERM_TIMESTAMP, TRAIN_ID) VALUES ("005", "1M", "001", "2022-01-01 23:00:00", "2022-01-01 05:00:00", "D67"); 
INSERT INTO RIDES(RIDE_ID, ROUTE_ID, CREW_ID, DEP_TIMESTAMP, TERM_TIMESTAMP, TRAIN_ID) VALUES ("006", "2M", "002", "2022-01-01 14:30:00", "2022-01-01 18:45:00", "E27");

 

INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("C77", TRUE, TRUE); 
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("D67", FALSE, FALSE); 
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("E27", TRUE, FALSE); 
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("C67", TRUE, TRUE); 
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("A34", FALSE, TRUE); 
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("A89", TRUE, TRUE); 
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("T78", FALSE, TRUE);   
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("O56", FALSE, FALSE);  
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("Z73", TRUE, FALSE); 
INSERT INTO TRAINS(TRAIN_ID, IF_OPERATING, IF_MODERN) VALUES ("J20", FALSE, TRUE);  

 

INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("000", "Driver", "Alavy", "Aaqib"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("001", "Driver", "Hassan", "Ahmed");
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("002", "Conductor", "Natasha", "Bing"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("003", "Conductor", "Natalie", "Portman"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("004", "Service Team", "Matt", "Damon"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("005", "Service Team", "Patrick", "Bateman");   
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("006", "Service Team ", "Harry", "Potter"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("007", "Service Team ", "Ron", "Weasely"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("008", "Service Team", "Hermione", "Granger");   
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("009", " Security Guard ", "Natalie", "Natasha"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("010", "Security Guard", "Matt", "Brown"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("011", "Driver", "Tony", "Stark"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("012", "Driver", "Steve", "Rogers"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("013", "Conductor", "Natasha", "Romanoff"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("014", "Conductor", "Peter", "Quill"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("015", "Service Team", "Shang", "Chi"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("016", "Service Team", "Peter", "Parker");   
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("017", "Service Team ", "Bruce", "Banner"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("018", "Service Team ", "Stephen", "Strange"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("019", "Service Team", "Scott", "Lang");  
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("020", " Security Guard ", "Miles", "Morales"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("021", "Security Guard", "Matthew", "Murdock"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("022", "Driver", "Tony", "Hawk"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("023", "Driver", "Stephen", "Brown"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("024", "Conductor", "Elon", "Musk"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("025", "Conductor", "Alan", "Turing"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("026", "Service Team", "Isaac", "Newton"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("027", "Service Team", "Nikola", "Tesla"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("028", "Service Team ", "Bill", "Gates"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("029", "Service Team ", "Steve", "Jobs"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("030", "Service Team", "Jenna", "Lang");
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("031", " Security Guard ", "Sherlock", "Holmes"); 
INSERT INTO EMPLOYEES(EMPLOYEE_ID, ROLE, FNAME, LNAME) VALUES ("032", "Security Guard", "Matthew", "Roberts"); 



INSERT INTO TRAIN_CREW(CREW_ID, DRIVER1, DRIVER2, CONDUCTOR1, CONDUCTOR2, HEAD_OF_CREW, SERVICE_TEAM1, SERVICE_TEAM2, SERVICE_TEAM3, SERVICE_TEAM4, SERVICE_TEAM5, SECURITY_GUARD1, SECURITY_GUARD2) VALUES ("000", "000", "001", "002", "003", "004", "001", "005", "006", "007", "008", "009", "010"); 
INSERT INTO TRAIN_CREW(CREW_ID, DRIVER1, DRIVER2, CONDUCTOR1, CONDUCTOR2, HEAD_OF_CREW, SERVICE_TEAM1, SERVICE_TEAM2, SERVICE_TEAM3, SERVICE_TEAM4, SERVICE_TEAM5, SECURITY_GUARD1, SECURITY_GUARD2) VALUES ("001", "011", "012", "013", "014", "011", "015", "016", "017", "018", "019", "020", "021"); 
INSERT INTO TRAIN_CREW(CREW_ID, DRIVER1, DRIVER2, CONDUCTOR1, CONDUCTOR2, HEAD_OF_CREW, SERVICE_TEAM1, SERVICE_TEAM2, SERVICE_TEAM3, SERVICE_TEAM4, SERVICE_TEAM5, SECURITY_GUARD1, SECURITY_GUARD2) VALUES ("002", "022", "023", "024", "025", "025", "026", "027", "028", "029", "030", "031", "032");



INSERT INTO ROUTE_TYPE(TYPE_ID, TYPE_NAME) VALUES (0, "Modern"); 
INSERT INTO ROUTE_TYPE(TYPE_ID, TYPE_NAME) VALUES (1, "Old"); 



INSERT INTO STATIONS(STATION_ID, STATION_NAME) VALUES ("LDN", "London"); 
INSERT INTO STATIONS(STATION_ID, STATION_NAME) VALUES ("LIL", "Lille"); 
INSERT INTO STATIONS(STATION_ID, STATION_NAME) VALUES ("BRU", "Brussels"); 
INSERT INTO STATIONS(STATION_ID, STATION_NAME) VALUES ("AMD", "Amsterdam"); 
INSERT INTO STATIONS(STATION_ID, STATION_NAME) VALUES ("PAR", "Paris"); 
INSERT INTO STATIONS(STATION_ID, STATION_NAME) VALUES ("LYN", "Lyon"); 
INSERT INTO STATIONS(STATION_ID, STATION_NAME) VALUES ("MAR", "Marseille"); 


 
-- LDN TO AMD = 1L
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("1L2", "LIL", "BRU", "LDN", "1L"); 
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("1L3", "BRU", "AMD", "LIL", "1L"); 
-- LDN TO MAR = 2L
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2L2", "LIL", "PAR", "LDN", "2L");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2L3", "PAR", "LYN", "LIL", "2L");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2L4", "LYN", "MAR", "PAR", "2L");

-- AMD TO LDN = 1A
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("1A2", "BRU", "LIL", "AMD", "1A");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("1A3", "LIL", "LDN", "BRU", "1A");
-- AMD TO MAR = 2A;
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2A2", "BRU", "LIL", "AMD", "2A");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2A3", "LIL", "PAR", "BRU", "2A");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2A4", "PAR", "LYN", "BRU", "2A");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2A5", "LYN", "MAR", "PAR", "2A");

-- MAR TO LDN = 1M
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("1M2", "LYN", "PAR", "MAR", "1M");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("1M3", "PAR", "LIL", "LYN", "1M");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("1M4", "LIL", "LDN", "PAR", "1M");
-- MAR TO AMD = 2M
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2M2", "LYN", "PAR", "AMD", "2M");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2M3", "PAR", "LIL", "LYN", "2M");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2M4", "LIL", "BRU", "PAR", "2M");
INSERT INTO STATION_LINKS(LINK_ID, STATION_ID, NEXT_STATION, PREV_STATION, ROUTE_ID) VALUES ("2M5", "BRU", "AMD", "LIL", "2M");

 

INSERT INTO ROUTES(ROUTE_ID, DISTANCE, JOURNEY_TIME, TRAIN_ID, ROUTE_TYPE, ROUTE_STATUS, TERM_STATION, DEPART_STATION) VALUES ("1L", "112", "04:00:00", "C77", "1", "Good Service", "AMD", "LDN"); 
INSERT INTO ROUTES(ROUTE_ID, DISTANCE, JOURNEY_TIME, TRAIN_ID, ROUTE_TYPE, ROUTE_STATUS, TERM_STATION, DEPART_STATION) VALUES ("2L", "190", "01:15:00", "D67", "1", "Good Service", "MAR", "LDN"); 
INSERT INTO ROUTES(ROUTE_ID, DISTANCE, JOURNEY_TIME, TRAIN_ID, ROUTE_TYPE, ROUTE_STATUS, TERM_STATION, DEPART_STATION) VALUES ("1A", "834", "02:15:00", "E27", "1", "Good Service", "LDN", "AMD"); 
INSERT INTO ROUTES(ROUTE_ID, DISTANCE, JOURNEY_TIME, TRAIN_ID, ROUTE_TYPE, ROUTE_STATUS, TERM_STATION, DEPART_STATION) VALUES ("2A", "195", "04:00:00", "C67", "1", "Good Service", "MAR", "AMD"); 
INSERT INTO ROUTES(ROUTE_ID, DISTANCE, JOURNEY_TIME, TRAIN_ID, ROUTE_TYPE, ROUTE_STATUS, TERM_STATION, DEPART_STATION) VALUES ("1M", "437", "01:10:00", "A34", "0", "Good Service", "LDN", "MAR"); 
INSERT INTO ROUTES(ROUTE_ID, DISTANCE, JOURNEY_TIME, TRAIN_ID, ROUTE_TYPE, ROUTE_STATUS, TERM_STATION, DEPART_STATION) VALUES ("2M", "170", "02:00:00", "A89", "1", "Good Service", "AMD", "MAR"); 



-- ADDING FK AFTER INITIAL DATA INSERTION
 
ALTER TABLE TICKETS 
    ADD FOREIGN KEY(RIDE_ID) REFERENCES RIDES(RIDE_ID);

ALTER TABLE RIDES 
    ADD FOREIGN KEY (TRAIN_ID) REFERENCES TRAINS(TRAIN_ID),
    ADD FOREIGN KEY (CREW_ID) REFERENCES TRAIN_CREW(CREW_ID);

ALTER TABLE STATION_LINKS 
    ADD FOREIGN KEY(ROUTE_ID) REFERENCES ROUTES(ROUTE_ID); 