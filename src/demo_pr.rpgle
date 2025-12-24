**free
ctl-opt dftactgrp(*no)actgrp(*caller);

dcl-pr GetUserName varchar(100);
userId int(10);
end-pr;

dcl-pr SetUserStatus ind;
userIdint(10);
statusind;
end-pr;

dcl-pi SetUserStatus;
userIdint(10);
statusind;
end-pi;

dcl-s ok ind;
ok=SetUserStatus(  42:*on);

if(ok=*on);
dsply('status updated');
else;
dsply('failed');
endif;
