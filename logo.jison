/* http://en.wikipedia.org/wiki/List_of_Logo_Commands */

%lex
%%

";".*                          /* comment */
[0-9]+\b                       return 'NUMBER';
[fF][oO][rR][wW][aA][rR][dD]   return 'FORWARD';
[fF][dD]                       return 'FORWARD';
\s+                            /* whitespace */
<<EOF>>                        return 'ENDOFFILE';

/lex

/* operator associations and precedence */


%start expressions

%%

expressions
    : e
        { return $1; }
    ;

e
    : FORWARD NUMBER
        { $$ = { 'command': 'forward', 'distance': $2 }; }
    ;
