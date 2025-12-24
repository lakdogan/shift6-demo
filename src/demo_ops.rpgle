**free
ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-s a int(10) inz(10);
dcl-s b int(10) inz(3);
dcl-s c packed(7:2) inz(0);

c = (a+b)*  2.5;
if(a<>b and a>0 and b<10);
c=c-1;
endif;

if((a+b)>(a*b)or (a-b)<0);
c =c+100;
endif;

dsply(  'c='+%char(c)  );
