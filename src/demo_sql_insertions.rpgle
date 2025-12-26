**free
// ------------------------------------------------------------
// Program     : Demo – Shift6 Formatter
// Purpose     : Showcase SQL INSERT formatting variations
// Author      : Levent Akdogan
// Created     : 2025-12-23
// Notes       :
//   - This file intentionally contains inconsistent formatting
//   - Used to demonstrate Shift6 formatter rules
//   - Comments must remain unchanged
// ------------------------------------------------------------

ctl-opt dftactgrp(* no ) actgrp(*caller) option(*srcstmt:*nodebugio);

dcl-proc Main;

dcl-s custId int(10) inz(1001);
dcl-s custName varchar(50) inz('Ada');
dcl-s status char(1) inz('A');
dcl-s credit packed(9:2) inz(120.50);
dcl-s created date inz(%date());
dcl-s rows int(10) inz(0);

exec sql insert into SALES/CUSTOMER
values( :custId , :custName , :status , :credit , :created );
end-exec;

exec sql
insert into SALES/CUSTOMER ( ID , NAME , STATUS , CREDIT , CREATED )
values ( :custId+1 , 'Grace' , 'A' , 900.00 , current_date );
end-exec;

exec sql insert into SALES/CUSTOMER (ID,NAME,STATUS,CREDIT,CREATED)
values
(2001,'Linus','I',0.00,current_date)
,(2002,'Ken','A',250.00,current_date)
,(2003,'Dennis','A',300.00,current_date);
end-exec;

exec sql
insert into SALES/CUSTOMER_HISTORY (ID,NAME,STATUS,CREDIT,CREATED)
select ID , NAME , STATUS , CREDIT , CREATED
from SALES/CUSTOMER
where STATUS='A';
end-exec;

exec sql
insert into SALES/AUDIT_LOG (EVENT_TS,EVENT_TYPE,DETAILS)
values ( current_timestamp , 'INSERT' ,
'Inserted customer ' concat char(:custId) );
end-exec;

exec sql
insert into SALES/DEFAULTS_ONLY default values;
end-exec;

exec sql
insert into SALES/ORDERS (ORDER_ID, CUSTOMER_ID, AMOUNT, CREATED)
values ( default , :custId , :credit , current_timestamp );
end-exec;

Exec SQL
insert into SALES/TEMP_IDS (ID)
select distinct ID from SALES/CUSTOMER
fetch first 5 rows only;
end-exec;

exec sql
get diagnostics :rows = row_count;
end-exec;

end-proc;
