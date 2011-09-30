/* http://en.wikipedia.org/wiki/List_of_Logo_Commands */

%lex

NAME      [a-zA-Z]+
NUMBER    [0-9]+

%%

";".*                          /* comment */
{NUMBER}                       return 'NUMBER';
{NAME}                         return 'NAME';
'['                            return 'START_LIST';
']'                            return 'END_LIST';
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
    | NAME
        { $$ = Logo.buildCommand($1); }
    | NAME START_LIST expressions END_LIST
        { $$ = Logo.buildLoop($1, null, $3); }
    | NAME NUMBER START_LIST expressions END_LIST
        { $$ = Logo.buildLoop($1, $2, $4); }
    ;
