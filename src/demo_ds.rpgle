**free
ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-ds Customer   qualified  inz;
custIdint(10);
firstNamevarchar(30);
lastName varchar(30);
streetvarchar(60);
zipchar(10);
cityvarchar(40);
isActive ind;
end-ds;

Customer.custId=1;
Customer.firstName='Levent';
Customer.lastName='Akdogan';
Customer.street='Main Street 12';
Customer.zip='12345';
Customer.city='Heilbronn';
Customer.isActive=*on;
