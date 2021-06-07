CREATE TABLE CUSTOMER ( CUST INT(5), CNAME VARCHAR(15) NOT NULL, CITY VARCHAR(15), PRIMARY KEY(CUST) )
CREATE TABLE CUSTORDER ( orderid int(5) , ODATE DATE, CUST INT(5) REFERENCES CUSTOMER(CUST ), ORD_AMT INT(5), primary key (orderid) )
CREATE TABLE ITEM ( ITEM int(5) , UNITPRICE int NOT NULL, primary key(item) )
CREATE TABLE WAREHOUSE ( WAREHOUSE int(5), CITY VARCHAR(15), PRIMARY KEY(WAREHOUSE ) )
CREATE TABLE SHIPMENT
(
orderid int(5),
WAREHOUSE int(5),
SHIP_DATE DATE,
FOREIGN KEY(orderid) REFERENCES CUSTORDER(orderid),
FOREIGN KEY(WAREHOUSE ) REFERENCES
WAREHOUSE(WAREHOUSE ) ,
PRIMARY KEY(orderid,WAREHOUSE )
)

CREATE TABLE ORDER_ITEM
(
orderid int (5),
ITEM int (5),
QTY int(4),
FOREIGN KEY(orderid ) REFERENCES CUSTORDER(orderid ),
FOREIGN KEY(ITEM) REFERENCES ITEM(ITEM),
PRIMARY KEY(orderid,ITEM)
)

insert into customer values('1','ABC','Banglore')
insert into customer values('1','ABC','Banglore')
insert into customer values('3','GHI','Banglore')
insert into customer values('4','JKL','CHITOOR')
insert into customer values ('5','MNO','MYSORE')
insert into customer values ('2','DEF','KOLAR')

INSERT INTO CUSTORDER VALUES('1', '2006-01-06' ,2, 5000.5 )
SELECT * FROM `custorder`
INSERT INTO CUSTORDER VALUEs('2', '2006-04-26' ,3 ,2500 )
INSERT INTO CUSTORDER VALUEs('3', '2006-04-27' ,3 ,1000 )
INSERT INTO CUSTORDER VALUES('4', ,'2006-04-30', 5, 1000 )
INSERT INTO CUSTORDER VALUES('4', '2006-04-30', 5, 1000 )
INSERT INTO CUSTORDER VALUES('5', '2006-05-25', 1, 5000 )

insert into item values(1,2500)
insert into item values(2,5000)
insert into item values(3,1000)
insert into item values(4,5)
insert into item values(5,200)

insert into order_item VALUES(1,2,1)
insert into order_item VALUES(1,4,1)
insert into order_item VALUES(2,1,1)
insert into order_item VALUES(3,5,5)
insert into order_item VALUES(4,2,2)

insert into warehouse VALUES(2,'KOLAR')
insert into warehouse VALUES(1,'Banglore')
insert into warehouse VALUES(3,'CHITOOR')
insert into warehouse VALUES(4,'Manglore')
insert into warehouse VALUES(5,'Mysore')

insert into shipment values(1,1,'2006-04-26')
insert into shipment values(2,2,'2006-04-29')
insert into shipment values(3,2,'2006-04-24')
insert into shipment values(4,5,'2006-04-30')
insert into shipment values(5,3,'2006-06-01')

Q1)SELECT C.CNAME, COUNT(*),AVG(O.ORD_AMT) FROM CUSTOMER C, custorder O WHERE C.CUST=O.CUST GROUP BY C.CNAME
Q2)SELECT distinct orderid FROM WAREHOUSE W, SHIPMENT S WHERE W.WAREHOUSE=S.WAREHOUSE AND CITY='BANGLORE'
Q3)
