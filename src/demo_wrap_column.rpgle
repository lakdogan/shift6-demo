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

ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-proc Main;

dcl-s a int(10) inz(1);
dcl-s b int(10) inz(2);
dcl-s c int(10) inz(3);
dcl-s d int(10) inz(4);
dcl-s e int(10) inz(5);
dcl-s f int(10) inz(6);
dcl-s ok ind;

ok = a=1 and b=2 and c=3 and d=4 and e=5 and f=6 and (a+b+c+d+e+f)>10 and (a*b*c*d)>0 and (a<>b) and (c<>d) and (e<>f);

if(ok=*on);
dsply('ok');
else;
dsply('not ok');
endif;

end-proc;
