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
dcl-s msg varchar(2000);
dcl-s user varchar(50) inz('Levent');
dcl-s action varchar(50) inz('EXPORT');
dcl-s status varchar(10) inz('OK');

msg='User='+%trim(user)+';Action='+%trim(action)+';Status='+%trim(status)+';Timestamp='+%char(%timestamp())+';Details='+
'Some very long detail text that should show how continuation lines get aligned and made readable by the formatter in a consistent way';
dsply(msg);
end-proc;
