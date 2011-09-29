/* http://en.wikipedia.org/wiki/List_of_Logo_Commands */

%lex

NAME      [a-zA-Z]+
NUMBER    [0-9]+

%%

";".*                          /* comment */
{NUMBER}                       return 'NUMBER';
{NAME}                         return 'NAME';
\s+                            return 'SPACE';

/lex

/* operator associations and precedence */


%start program

%%

program
    :
        { return ['empty']; }
    | expressions
        { return [$1]; }
    ;

expressions
    : expressions SPACE e
        { $$ = [$1, $3]; }
    | e
        { $$ = [$1]; }
    ;

e
    : NAME SPACE NUMBER
        { $$ = { 'command': $1, 'args': [$3] }; }
    ;
