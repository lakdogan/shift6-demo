**free
// ------------------------------------------------------------
// Exec SQL Formatter Full Before Sample
// Purpose : Exercise all exec sql formatting rules
// ------------------------------------------------------------

dcl-s custId int(10);
dcl-s custName varchar(50);
dcl-s status char(1);
dcl-s credit packed(9:2);
dcl-s rows int(10);

exec sql insert into SALES/CUSTOMER (ID,NAME,STATUS,CREDIT,CREATED)
values( :custId , :custName , :status , :credit , current_date );
end-exec;

exec sql insert into SALES/CUSTOMER_HISTORY (ID,NAME,STATUS,CREDIT,CREATED)
select ID , NAME , STATUS , CREDIT , CREATED from SALES/CUSTOMER
where STATUS='A';
end-exec;

exec sql update SALES/CUSTOMER C set NAME=:custName,STATUS='A'
from SALES/ORDERS O where C.ID=O.CUST_ID;
end-exec;

exec sql delete from SALES/CUSTOMER C using SALES/ORDERS O where C.ID=O.CUST_ID;
end-exec;

exec sql merge into SALES/CUSTOMER C using SALES/STAGING S on C.ID=S.ID
when matched and C.STATUS='I' then delete
when matched and C.STATUS='A' then update set C.CREDIT=S.CREDIT
when not matched by target and S.ACTIVE=1 then insert (ID,STATUS) values (S.ID,'A');
end-exec;

exec sql with Active as (select ID,NAME from SALES/CUSTOMER where STATUS='A')
select ID,NAME from Active union all select ID,NAME from SALES/ARCHIVE;
end-exec;

exec sql select C.ID,O.ID from SALES/CUSTOMER C left join SALES/ORDERS O
on C.ID=O.CUST_ID inner join SALES/STATUS S on S.ID=C.STATUS_ID
group by C.ID,C.NAME having sum(O.AMOUNT)>0 order by C.NAME
offset 10 rows fetch first 5 rows only for update of NAME,STATUS;
end-exec;

exec sql values (1,'A'),(2,'B');
end-exec;

exec sql values (1,'A') into :custId,:status;
end-exec;

exec sql declare C1 scroll cursor with hold for select ID,NAME from SALES/CUSTOMER;
end-exec;
exec sql open C1 using :custId,:status;
end-exec;
exec sql fetch next rowset from C1 for 10 rows into :rows;
end-exec;
exec sql fetch prior from C1 into :custId,:custName;
end-exec;
exec sql close C1;
end-exec;

exec sql prepare S1 from :stmt;
end-exec;
exec sql execute S1 into :custId using descriptor :desc;
end-exec;
exec sql execute immediate :stmt into :custId,:custName using descriptor :desc;
end-exec;
exec sql execute immediate :stmt using :custId,:status;
end-exec;

exec sql get diagnostics :rows = row_count;
end-exec;

exec sql set :rows = 0;
end-exec;
exec sql set option commit = *cs, closqlcsr = *endmod;
end-exec;
exec sql set current schema = MYLIB;
end-exec;
exec sql set current isolation = *cs;
end-exec;
exec sql set session authorization = :user;
end-exec;
exec sql set transaction isolation level *cs;
end-exec;

exec sql savepoint S1;
end-exec;
exec sql rollback to savepoint S1;
end-exec;
exec sql release savepoint S1;
end-exec;

exec sql declare section;
end-exec;
dcl-s stmt varchar(2000);
exec sql end declare section;
end-exec;
exec sql include sqlca;
end-exec;
exec sql whenever sqlerror goto ErrLabel;
end-exec;
exec sql whenever sqlwarning go to WarnLabel;
end-exec;
exec sql whenever not found continue;
end-exec;

exec sql connect to LOCAL user :user using :pwd;
end-exec;
exec sql set connection CURRENT;
end-exec;
exec sql disconnect ALL;
end-exec;
exec sql release CURRENT;
end-exec;

exec sql lock table SALES/CUSTOMER in exclusive mode;
end-exec;

// ------------------------------------------------------------
// Exec SQL Formatter Additional Cases
// ------------------------------------------------------------

dcl-s user varchar(20);
dcl-s pwd varchar(20);
dcl-s doc varchar(32000);

auth_id = 'APP1';

exec sql select abs(-1) as ABS1,mod(10,3) as M1,round(12.345,2) as R1,timestamp_format('2025-01-01','YYYY-MM-DD') as T1,varchar_format(current_timestamp,'YYYY-MM-DD') as V1,listagg(NAME,',') within group(order by NAME) as NAMES,xmlagg(xmlelement(name X,NAME) order by NAME) as XMLS,json_object('id':ID,'name':NAME) as J1,json_array(ID,NAME) as J2 from SALES/CUSTOMER;
end-exec;

exec sql create procedure P1() language sql begin declare v int default 0; set v = 1; if v = 1 then set v = 2; end if; return; end;
end-exec;

exec sql create function F1() returns int language sql begin declare outv int default 10; set outv = outv + 1; return outv; end;
end-exec;

exec sql begin declare x int default 3; set x = x + 1; end;
end-exec;

exec sql create trigger TR1 after insert on SALES/CUSTOMER referencing new as N for each row begin set N.STATUS = 'A'; end;
end-exec;

exec sql select row_number() over(partition by C.ID order by O.AMOUNT desc) as RN,rank() over(order by O.AMOUNT) as RK,sum(O.AMOUNT) over(partition by C.ID) as TOTAL from SALES/ORDERS O join SALES/CUSTOMER C on C.ID = O.CUST_ID;
end-exec;

exec sql select X.ID,O.ID from (select C.ID from SALES/CUSTOMER C where C.STATUS = 'A') X left join SALES/ORDERS O on X.ID = O.CUST_ID where exists (select 1 from SALES/ORDERS OO where OO.CUST_ID = X.ID);
end-exec;

exec sql select json_object('id':C.ID,'name':C.NAME) as J1,json_array(C.ID,C.NAME) as J2,xmltable('$d' passing xmlparse(document :doc) columns ID int path '@id') as XT from SALES/CUSTOMER;
end-exec;

exec sql create table SALES/CUSTOMER (ID int,NAME varchar(50)) rcdfmt CUSTREC ccsid 37 for system name CUSTSYS;
end-exec;

exec sql set current client_applname = 'MYAPP';
end-exec;
exec sql set current query optimization = 5;
end-exec;
exec sql values current client_user;
end-exec;
