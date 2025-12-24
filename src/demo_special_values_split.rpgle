**free
// ------------------------------------------------------------
// Program     : Demo - Shift6 Formatter
// Purpose     : *special values, *INxx, statement splitting
// Notes       :
//   - Intentional spacing issues for formatter demo
// ------------------------------------------------------------

ctl-opt dftactgrp(*no) actgrp(*caller);

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

dcl-s flag ind;
dcl-s result int(10);

flag = * off; result=0; flag = * on;

if( * in99 = * on );
dsply('indicator 99 set');
endif;

if( * in05 = * off );
dsply('indicator 05 off');
endif;

if( flag = * off );
flag = * on;
endif;

result = 1+2+3+4+5+6+7+8+9+10+11+12;
if( IsActive( flag ) = * on );
dsply('active');
else;
dsply('inactive');
endif;

end-proc;
