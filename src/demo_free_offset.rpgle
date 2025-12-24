**FREE
ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-proc Main;

dcl-s  userId    int(10) inz(42);
dcl-s  isAdmin   ind     inz(*off);
dcl-s  msg       varchar(2000);

if(userId=42);
isAdmin=*on;
endif;

if(isAdmin=*on);
msg='access granted';
else;
msg='access denied';
endif;

dsply(msg);

end-proc;
