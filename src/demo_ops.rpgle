**free
// ------------------------------------------------------------
// Program     : Demo – Shift6 Formatter
// Purpose     : Showcase RPG Free formatting behavior
// Author      : Levent Akdogan
// Created     : 2025-12-23
// Notes       :
//   - This file intentionally contains inconsistent formatting
//   - Used to demonstrate Shift6 formatter rules
//   - Comments must remain unchanged
// ------------------------------------------------------------

ctl-opt dftactgrp(*   no) actgrp(*     caller);

dcl-proc Main;

dcl-s var1 int(10) inz(10);
dcl-s var2 int(10) inz(3);
dcl-s var3 int(10) inz(2);
dcl-s multi int(10);
dcl-s ok ind inz(*off);

multi=var1*var2*var3;

if(var1<>var2 and var1>0 and var2<10);
ok=*on;
endif;

if(ok=*on);
dsply('multi='+% char( multi ));
else;
dsply('no');
endif;

end-proc;

dcl-proc CalcDiscount;
dcl-pi * n packed(7:2);
p_amount packed(9:2);
end-pi;

if(p_amount>=1000);
return p_amount*0.05;
endif;

return 0;
end-proc;
