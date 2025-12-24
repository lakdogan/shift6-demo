**free
// ------------------------------------------------------------
// Program     : Demo - Shift6 Formatter
// Purpose     : Preprocessor directives (/define, /if, /else)
// Notes       :
//   - Intentional spacing issues for formatter demo
// ------------------------------------------------------------

ctl-opt dftactgrp(*no) actgrp(*caller);

/define DEBUG
/define  MAX_ROWS   100

dcl-proc Main;

dcl-s rows int(10) inz(0);

/if defined( DEBUG )
dsply('debug on');
/else
dsply('debug off');
/endif

/if MAX_ROWS > 10
rows = MAX_ROWS;
/endif

dsply( 'rows=' + % char( rows ) );

end-proc;
