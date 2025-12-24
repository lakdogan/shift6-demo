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

dcl-s  amount    packed(9:2) inz(1234.50);
dcl-s  taxRate   packed(5:4) inz(0.1900);
dcl-s  total     packed(9:2);
dcl-s  user      varchar(50) inz('Levent');
dcl-s  status    varchar(10) inz('OK');
dcl-s  info      varchar(2000);

total= amount* (1+taxRate);

if(total>1000);
total =total-100;
endif;

if(total<=0 or total<>total);
dsply('unexpected');
endif;

info = 'User=' + %  trim(  user ) + ';Status=' + %  char(  total ) + ';Flag=' + %  char(  *on  );
dsply(info);

end-proc;
