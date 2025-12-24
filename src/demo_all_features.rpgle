**free
// ------------------------------------------------------------
// Program     : Demo - Shift6 Formatter
// Purpose     : Combined showcase of formatting behaviors
// Notes       :
//   - Intentional spacing issues for formatter demo
// ------------------------------------------------------------

ctl-opt dftactgrp(*  no ) actgrp( *caller ) option( *  srcstmt : *nodebugio );

/define DEBUG
/define  MAX_ROWS   100
/include  QCPYSRC,QRPGLESRC
/include 'MYLIB/QRPGLESRC,PROTOTYPES'

dcl-ds Customer qualified;
id int(10);
name varchar(30);
credit packed(9:2);
end-ds;

dcl-ds Temp likeds(Customer) inz;

dcl-pr IsActive ind;
p_flag ind;
end-pr;

dcl-proc IsActive;
dcl-pi * n ind;
p_flag ind;
end-pi;
if(p_flag=*on);
return * on;
endif;
return * off;
end-proc;

dcl-proc Main;

dcl-s i int(10) inz(0);
dcl-s rows int(10) inz(0);
dcl-s total packed(9:2) inz(0);
dcl-s ok ind inz( * off );
dcl-s msg varchar(2000);

/if defined( DEBUG )
dsply('debug on');
/else
dsply('debug off');
/endif

/if MAX_ROWS > 10
rows = MAX_ROWS;
/endif

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

if( * in99 = * on );
dsply('indicator 99 set');
endif;

if( * in05 = * off );
dsply('indicator 05 off');
endif;

ok = * on ;

msg = 'User=' + % trim( % char( Customer.id ) ) + ';Ok=' + % char( ok )
+ ';Name=' + % trim( Customer.name ) + ';Credit=' + % char( Customer.credit )
+ ';Rows=' + % char( rows ) + ';Total=' + % char( total )
+ ';Timestamp=' + % char( % timestamp( ) )
+ ';Details=' + 'This line starts with plus and should align with the previous plus operator';

msg = msg + ';Concat=' + 'Another long literal segment that forces wrapping for the continuation logic to be visible';

if( IsActive( ok ) = * on );
dsply( (  'string only'  ) );
dsply( 'keep (  inside  ) text' );
else;
dsply('inactive');
endif;

dsply( 'rows=' + % char( rows ) );
dsply( msg );

end-proc;
