**free
ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-proc Main;
dcl-s x int(10) inz(1);
if(x=1);
dsply('hello');
endif;
end-proc;
