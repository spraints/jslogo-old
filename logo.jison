/* http://en.wikipedia.org/wiki/List_of_Logo_Commands */

%lex

NAME      [a-zA-Z]+
NUMBER    [0-9]+

%%

";".*                          /* comment */
{NUMBER}                       return 'NUMBER';
{NAME}                         return 'NAME';
\s+                            /*return 'SPACE';*/

/lex

/* operator associations and precedence */


%start program

%%

program
    :
        { return []; }
    | expressions
        { return $1; }
    ;

expressions
    : expressions e
        { $$ = $1.concat($2); }
    | e
        { $$ = [$1]; }
    ;

e
    : NAME NUMBER
        { $$ = Logo.buildCommand($1, $2); }
    ;
