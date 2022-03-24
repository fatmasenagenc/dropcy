
%token FLIGHT 
FLIGHT_END 
COMMENT_FACE            
COMMENT
STRING
CHAR
SEMICOLON                
COLON                    
COMMA      
DOT              
EXCLAMATION_M            
QUESTION_M               
GT                       
LT                       
LTE                     
GTE                     
EQUAL_CHECK              
AND_OP                   
OR_OP                    
MULTIPLICATION_OP        
DIVISION_OP              
PLUS                     
MINUS                    
AND_SIGN                 
PIPE_SIGN                
APOSTROPHE               
MODULO_OP                
ASSIGNMENT_OP            
TILDE                    
LP                       
RP                       
QUOTATION_M              
LCB                      
RCB
NEWLINE                      
INTEGER                                  
INT_TYPE                
CHAR_TYPE               
STRING_TYPE             
HEADING_TYPE             
ALTITUDE_TYPE           
TEMPERATURE_TYPE          
VOID_TYPE    
BOOLEAN_TYPE 
TIMER_TYPE    
TRUE                    
FALSE                
BOOLEAN              
IF                      
ELSE                  
ENTER                  
RETURN                  
EXIT                    
CALL                    
GET_HEADING             
GET_ALTITUDE            
GET_TEMPERATURE         
GO_UP                   
GO_DOWN                  
VERTICAL_STOP           
GO_FORWARD            
GO_BACKWARD             
HORIZONTAL_STOP         
TURN_LEFT             
TURN_RIGHT             
NOZZLE_ON              
NOZZLE_OFF           
WIFI_CONNECT            
WIFI_DISCONNECT 
END_TIMER
START_TIME        
CREATE                  
MAKE                    
INPUT                  
OUTPUT                  
WHILE                   
FOR                     
IDENTIFIER  
COLON      

%start program
%%
program : FLIGHT lp string rp lcb statements FLIGHT_END rcb {printf("No syntax error found. Valid program.\n");}; 
statements : statement | statement statements;
statement : matched | unmatched;
matched : loops | function_declare | function_call | input | output | variable_declaration | variable_assign_value 
        | variable_declare_initialize | comments | IF lp logic_exp rp lcb matched_statement rcb ELSE lcb matched rcb;
unmatched :  IF lp logic_exp rp lcb unmatched rcb | IF lp logic_exp rp lcb matched_statement rcb ELSE lcb unmatched rcb;
matched_statement : matched | matched_statement matched;
identifier : IDENTIFIER;
function_declare : return_type identifier lp function_parameters rp ENTER statements RETURN return_var EXIT | return_type identifier lp rp ENTER statements RETURN return_var EXIT;
function_call : CALL function_name lp function_arguments rp | CALL function_name lp rp;
return_type : variable_types | void;
return_var : identifier | void;
function_parameter : variable_types identifier;
function_parameters : function_parameter | function_parameter function_parameters;
function_argument : identifier;
function_arguments : function_argument | function_argument function_arguments;
function_name : primitive_function_names | identifier;
primitive_function_names : GET_HEADING | GET_ALTITUDE | GET_TEMPERATURE | GO_UP | GO_DOWN | VERTICAL_STOP | GO_FORWARD 
                        | GO_BACKWARD | HORIZONTAL_STOP | TURN_LEFT | TURN_RIGHT | NOZZLE_ON | NOZZLE_OFF | WIFI_CONNECT | WIFI_DISCONNECT | END_TIMER | START_TIME;
comments : COMMENT;
expressions : arithmetic_exp | logic_exp | function_call;
logic_exp : relational_exp | boolean_exp;
arithmetic_exp : arithmetic_exp plus terms | arithmetic_exp plus int | arithmetic_exp minus terms | arithmetic_exp minus int | terms | identifier plus terms | identifier plus int | int plus identifier | identifier minus terms | int minus identifier | identifier minus int | identifier plus identifier | identifier minus identifier ;
terms : terms multiplication_op component| terms multiplication_op int | terms division_op component | terms division_op int |terms modulo_op component | terms modulo_op int ;
component : lp arithmetic_exp rp ;
relational_exp : variable_values relational_op variable_values | identifier relational_op identifier 
                | identifier relational_op variable_values | arithmetic_exp relational_op arithmetic_exp 
                | identifier relational_op arithmetic_exp | arithmetic_exp relational_op variable_values;
boolean_exp : relational_exp logic_op boolean_exp | exclamation_m logic_exp colon;
string : STRING;
char : CHAR;
int : INTEGER;

boolean : true | false;
variable_types : INT_TYPE | CHAR_TYPE | STRING_TYPE | BOOLEAN_TYPE | HEADING_TYPE | ALTITUDE_TYPE | TEMPERATURE_TYPE | TIMER_TYPE;
variable_declaration : CREATE variable_types identifier;
variable_declare_initialize : CREATE variable_types identifier assignment_op variable_values 
                            | CREATE variable_types identifier assignment_op expressions;
variable_assign_value : MAKE identifier assignment_op variable_values | MAKE identifier assignment_op expressions;
variable_values : int | char | string | boolean;
input : INPUT tilde identifier;
output : OUTPUT tilde variable_values | OUTPUT tilde identifier;
loops : while_loop | for_loop;
while_loop : WHILE lp logic_exp rp lcb statements rcb;
for_loop : FOR lp variable_declare_initialize semicolon logic_exp semicolon statements rp lcb statements rcb;
void : VOID_TYPE;

semicolon : SEMICOLON;
exclamation_m : EXCLAMATION_M;
gt : GT;
lt : LT;
lte : LTE;
gte : GTE;
equal_check : EQUAL_CHECK;
and_op : AND_OP;
or_op : OR_OP;
multiplication_op : MULTIPLICATION_OP;
division_op : DIVISION_OP;
plus : PLUS;
minus : MINUS;
true : TRUE;
false : FALSE;
modulo_op : MODULO_OP;
assignment_op : ASSIGNMENT_OP;
tilde : TILDE;
lp : LP;
rp : RP;
lcb : LCB;
rcb : RCB;
relational_op : lt | gt | gte | lte | equal_check;
logic_op : and_op | or_op | exclamation_m;
colon : COLON

%%
#include "lex.yy.c"
int lineno=1;
yyerror(char *s) { printf("%s - line %d\n", s, lineno); }
main() {
 return yyparse();
}