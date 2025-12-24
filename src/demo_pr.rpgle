**free
ctl-opt dftactgrp(*no)actgrp(*caller);

dcl-pr GetUserName varchar(100);
userId int(10);
end-pr;

dcl-pr SetUserStatus ind;
userIdint(10);
statusind;
end-pr;

dcl-proc SetUserStatus;
dcl-pi *n ind;
userIdint(10);
statusind;
end-pi;

if(status=*on);
dsply('status updated for '+%char(userId));
return *on;
else;
dsply('failed for '+%char(userId));
return *off;
endif;

end-proc;

dcl-s ok ind;
ok=SetUserStatus(  42:*on);
