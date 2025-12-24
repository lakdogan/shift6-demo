**free
ctl-opt dftactgrp(*   no) actgrp(*     caller);

dcl-proc Main;
dcl-s var1 int(10) inz(10);
dcl-s var2 int(10) inz(3);
dcl-s var3 int(10) inz(2);
dcl-s multi int(10);
dcl-s c packed(7:2) inz(0);

multi=var1*var2*var3;
c = (var1+var2)*  2.5;

if(var1<>var2 and var1>0 and var2<10);
c=c-1;
endif;

if((var1+var2)>(var1*var2)or (var1-var2)<0);
c =c+100;
endif;

dsply(  'multi='+%char(multi)+' c='+%char(c)  );
end-proc;
