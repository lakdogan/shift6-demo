**free
// ------------------------------------------------------------
// Program     : Demo - Shift6 Formatter
// Purpose     : /include directives and line continuation
// Notes       :
//   - Intentional spacing issues for formatter demo
// ------------------------------------------------------------

ctl-opt dftactgrp(*no) actgrp(*caller);

/include  QCPYSRC,QRPGLESRC
/include 'MYLIB/QRPGLESRC,PROTOTYPES'

dcl-proc Main;

dcl-s msg varchar(2000);

msg = 'Include demo running' + % char( % timestamp( ) );
dsply( msg );

end-proc;
