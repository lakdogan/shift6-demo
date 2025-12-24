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

dsply( 'plain' );
dsply(  'two spaces ok'  );

dsply( ( 'trim me' ) );
dsply( (  'already string only'   ) );

dsply( 'do not touch text: (  inside  )' );

end-proc;
