**free
// ------------------------------------------------------------
// Program     : Demo - Shift6 Formatter
// Purpose     : Block keywords, mid keywords, inline DCL-DS
// Notes       :
//   - Intentional spacing issues for formatter demo
// ------------------------------------------------------------

ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-ds Customer qualified;
id int(10);
name varchar(30);
credit packed(9:2);
end-ds;

dcl-ds Temp likeds(Customer) inz;

dcl-proc Main;

dcl-s i int(10) inz(0);
dcl-s total packed(9:2) inz(0);

for i = 1 to 3;
if(i=1);
Customer.id=1;
Customer.name='A';
elseif( i = 2 );
Customer.id=2;
Customer.name='B';
else;
Customer.id=3;
Customer.name='C';
endif;
endfor;

select;
when Customer.id=1;
total = total + 10;
when Customer.id=2;
total=total+20;
other;
total=total+30;
endsl;

monitor;
total = total / 0;
on-error;
dsply('error');
on-exit;
dsply('exit');
endmon;

dou total > 100;
total= total + 25;
enddo;

end-proc;
