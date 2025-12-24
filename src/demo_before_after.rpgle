**free
ctl-opt  dftactgrp(*no)actgrp(*caller);

dcl-dsMyData   qualified;
id   int(10);
name    varchar(50);
amountpacked(7:2);
end-ds;

dcl-prCalculateTotal   packed(9:2);
p_idint(10);
p_amount   packed(7:2);
end-pr;

dcl-proc CalculateTotal;
dcl-pi *n packed(9:2);
p_idint(10);
p_amountpacked(7:2);
end-pi;

dcl-s resultpacked(9:2);
result= p_amount * 1.19;

if(result>1000);
result =result -100;
endif;

return   result;
end-proc;
