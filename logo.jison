/* http://en.wikipedia.org/wiki/List_of_Logo_Commands */

%lex

NAME      [a-zA-Z]+

%%

";".*                          /* comment */
[0-9]+\b                       return 'NUMBER';
{NAME}                         return 'NAME';
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
    : NAME NUMBER
        { $$ = { 'command': $1, 'args': [$2] }; }
    ;
