**free
// ------------------------------------------------------------
// Program     : Demo - Shift6 Formatter
// Purpose     : CTL-OPT trimming, %builtins, parentheses
// Notes       :
//   - Intentional spacing issues for formatter demo
// ------------------------------------------------------------

ctl-opt dftactgrp(*  no ) actgrp( *caller ) option( *  srcstmt : *nodebugio );
ctl-opt bnddir( 'QC2LE' : 'MYLIB' );

dcl-proc Main;

dcl-s userId int(10) inz(42);
dcl-s ok ind inz( * off );
dcl-s msg varchar(2000);

if( userId = 42 );
ok = * on ;
endif;

msg = 'User=' + % trim( % char( userId ) ) + ';Ok=' + % char( ok );
dsply( (  'string only'  ) );
dsply( 'keep (  inside  ) text' );

end-proc;
