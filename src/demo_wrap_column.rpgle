**free
ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-proc Main;
dcl-s a int(10) inz(1);
dcl-s b int(10) inz(2);
dcl-s c int(10) inz(3);
dcl-s d int(10) inz(4);
dcl-s e int(10) inz(5);
dcl-s ok ind;

ok = a=1 and b=2 and c=3 and d=4 and e=5 and (a+b+c+d+e)>10 and (a*b*c)>0 and (a<>b);

if(ok=*on);
dsply('ok');
endif;

end-proc;
