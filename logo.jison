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

/*
optionally, write a tokenizer and use this:

NUMBER [0-9]+
STRING "\S*
VAR_REF :\S*
e
    : FORWARD  value                    { $$ = Logo.forward($2); }
    | BACKWARD value                    { $$ = Logo.backward($2); }
    | RIGHT    value                    { $$ = Logo.right($2); }
    | LEFT     value                    { $$ = Logo.left($2); }
    | PENUP                             { $$ = Logo.penUp(); }
    | PENDOWN                           { $$ = Logo.penDown(); }
    | HOME                              { $$ = Logo.home(); }
    | CLEAR                             { $$ = Logo.clear(); }
    | REPEAT NUMBER '[' expressions ']' { $$ = Logo.loop($2, $4) }
    | NEWTURTLE value                   { $$ = Logo.newTurtle($2); }
    | TALKTO    value                   { $$ = Logo.talkTo($2); }
    | MAKE      value value             { $$ = Logo.assign($2, $3); }
    | SETCOLOR  value                   { $$ = Logo.setPenColor($2); }
    | SETBG     value                   { $$ = Logo.setBgColor($2); }
value
    : NUMBER
    | STRING
    | VAR_REF

xlogo commands:
  bk|back num
  fd|forward num
  lt|left num
  rt|right num
  pd|pendown
  pe|penerase
  pu|penup
  if num list
  n|north
  nw|northwest
  w|west
  sw|southwest
  s|south
  se|southeast
  e|east
  ne|northeast
  ht|hideturtle
  st|showturtle
  cg|clear
  cc|clearcommands
  to
  tto str-or-list
  end
  ifelse num list list
  fill|floodfill
  seth|setheading num
  setc|setcolor num-or-str
  setbg|setbackground num-or-str
  setxy num num
  setpos|setposition list
  newturtle str-or-list
  remove|removeturtle str-or-list
  setturtlecolor num-or-str
  setturtlesize num
  repeat num list
  make str-or-list any
  home
  setpensize num

*/
