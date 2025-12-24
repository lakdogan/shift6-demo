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

dcl-ds Customer qualified;
id int(10);
firstName varchar(30);
lastName varchar(30);
isActive ind;
end-ds;

dcl-pr GetCustomerName varchar(100);
p_id int(10);
end-pr;

dcl-proc GetCustomerName;
dcl-pi *n varchar(100);
p_id int(10);
end-pi;

dcl-s full varchar(100);

if(p_id=Customer.id and Customer.isActive=*on);
full = %trim(Customer.firstName) + ' ' + %trim(Customer.lastName);
return full;
endif;

return 'unknown';
end-proc;

dcl-proc Main;

Customer.id=42;
Customer.firstName='Levent';
Customer.lastName='Akdogan';
Customer.isActive=*on;

dsply(GetCustomerName( 42 ));

end-proc;
