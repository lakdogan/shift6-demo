**free
// ------------------------------------------------------------
// Program     : Demo - Shift6 Formatter
// Purpose     : Operator spacing, long-line wrapping, continuations
// Notes       :
//   - Intentional spacing issues for formatter demo
// ------------------------------------------------------------

ctl-opt dftactgrp(*no) actgrp(*caller);

dcl-proc Main;

dcl-s a int(10) inz(1);
dcl-s b int(10) inz(2);
dcl-s c int(10) inz(3);
dcl-s d int(10) inz(4);
dcl-s e int(10) inz(5);
dcl-s f int(10) inz(6);
dcl-s g int(10) inz(7);
dcl-s h int(10) inz(8);
dcl-s i int(10) inz(9);
dcl-s j int(10) inz(10);
dcl-s k int(10) inz(11);
dcl-s total packed(9:2);
dcl-s text varchar(2000);

total = % int( (a+b+c+d+e+f+g+h+i+j+k) * 2 ) + (a*b*c*d*e*f*g*h*i*j*k) / (a+1);

text = 'A:' + % char(a) + ';B:' + % char(b) + ';C:' + % char(c) + ';D:' + % char(d) + ';E:' + % char(e) + ';F:' + % char(f) + ';G:' + % char(g) + ';H:' + % char(h)
+ ';I:' + % char(i) + ';J:' + % char(j) + ';K:' + % char(k) + ';SUM=' + % char( total );

dsply(text);

end-proc;
