**free
ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-proc Main;
dcl-s msg varchar(2000);

msg = 'A=' + %char(1) + ' B=' + %char(2) + ' C=' + %char(3)
+ ' D=' + %char(4) + ' E=' + %char(5)
+ ' F=' + %char(6);

dsply(msg);
end-proc;
