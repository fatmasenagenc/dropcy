
FLIGHT                  flight
FLIGHT_END              flight_end 

COMMENT_FACE            {LP}{MULTIPLICATION_OP}{COMMA}{MULTIPLICATION_OP}{RP}{DIVISION_OP}
COMMENT                 {COMMENT_FACE}{STRING}


DOT                     \. 
SEMICOLON               \; 
COLON                   \: 
COMMA                   \, 
EXCLAMATION_M           \! 
QUESTION_M              \? 
GT                      \> 
LT                      \< 
LTE                     \<\= 
GTE                     \>\= 
EQUAL_CHECK             \=\= 
AND_OP                  \&\& 
OR_OP                   \|\| 
MULTIPLICATION_OP       \* 
DIVISION_OP             \/ 
PLUS                    \+ 
MINUS                   \- 
AND_SIGN                \& 
PIPE_SIGN               \| 
APOSTROPHE              \‘ 
MODULO_OP               \% 
ASSIGNMENT_OP           \= 
TILDE                    \~ 
LP                      \( 
RP                      \) 
QUOTATION_M             \“ 
LCB                     \{ 
RCB                     \} 
NEWLINE					\n


INT_TYPE                int
CHAR_TYPE               char
STRING_TYPE             string
HEADING_TYPE            heading 
ALTITUDE_TYPE           altitude
TEMPERATURE_TYPE        temperature     
VOID_TYPE               void
BOOLEAN_TYPE 			boolean
TIMER_TYPE				timer

TRUE                    true
FALSE                   false


IF                      if 
ELSE                    else 
ENTER                   enter 
RETURN                  return 
EXIT                    exit 
CALL                    call 
GET_HEADING             getHeading 
GET_ALTITUDE            getAltitude 
GET_TEMPERATURE         getTemperature 
GO_UP                   goUp 
GO_DOWN                 goDown 
VERTICAL_STOP           verticalStop 
GO_FORWARD              goForward 
GO_BACKWARD             goBackward 
HORIZONTAL_STOP         horizontalStop 
TURN_LEFT               turnLeft 
TURN_RIGHT              turnRight 
NOZZLE_ON               nozzleOn 
NOZZLE_OFF              nozzleOff 
WIFI_CONNECT            wifiConnect 
WIFI_DISCONNECT         wifiDisconnect 
END_TIMER	            endTimer
START_TIME 				startTime	

CREATE                  create
MAKE                    make
INPUT                   input
OUTPUT                  output
WHILE                   while
FOR                     for

INTEGER                 [0-9]+
CHAR					[A-Za-z]
IDENTIFIER              \#[A-Za-z0-9_]+
STRING                  \"([^\\\"]|\\\"|\\\n|\\\\)*\"

%%
{FLIGHT} return FLIGHT;
{FLIGHT_END} return FLIGHT_END;

{COMMENT} return COMMENT;

{DOT} return DOT;
{SEMICOLON} return SEMICOLON;
{COLON} return COLON;
{COMMA} return COMMA;
{EXCLAMATION_M} return EXCLAMATION_M;
{QUESTION_M} return QUESTION_M;
{GT} return GT;
{LT} return LT;
{LTE} return LTE;
{GTE}  return GTE;
{EQUAL_CHECK} return EQUAL_CHECK;
{AND_OP} return AND_OP;
{OR_OP} return OR_OP;
{MULTIPLICATION_OP} return MULTIPLICATION_OP;
{DIVISION_OP} return DIVISION_OP;
{PLUS} return PLUS;
{MINUS} return MINUS;
{AND_SIGN} return AND_SIGN;
{PIPE_SIGN} return PIPE_SIGN;
{APOSTROPHE} return APOSTROPHE;
{MODULO_OP} return MODULO_OP;
{ASSIGNMENT_OP} return ASSIGNMENT_OP;
{TILDE} return TILDE;
{LP} return LP;
{RP} return RP;
{QUOTATION_M} return QUOTATION_M;
{LCB} return LCB;
{RCB} return RCB;
{NEWLINE} { extern int lineno; lineno++;}

{INT_TYPE} return INT_TYPE;
{CHAR_TYPE} return CHAR_TYPE;
{STRING_TYPE} return STRING_TYPE;
{HEADING_TYPE} return HEADING_TYPE;
{ALTITUDE_TYPE} return ALTITUDE_TYPE;
{TEMPERATURE_TYPE} return TEMPERATURE_TYPE;
{VOID_TYPE} return VOID_TYPE;
{BOOLEAN_TYPE} return BOOLEAN_TYPE;
{TIMER_TYPE} return TIMER_TYPE;
{TRUE} return TRUE;
{FALSE} return FALSE;

{IF} return IF;
{ELSE} return ELSE;
{ENTER} return ENTER;
{RETURN} return RETURN;
{EXIT} return EXIT;
{CALL} return CALL;
{GET_HEADING} return GET_HEADING;
{GET_ALTITUDE} return GET_ALTITUDE;
{GET_TEMPERATURE} return GET_TEMPERATURE;
{GO_UP} return GO_UP;
{GO_DOWN} return GO_DOWN;
{VERTICAL_STOP} return VERTICAL_STOP;
{GO_FORWARD} return GO_FORWARD;
{GO_BACKWARD} return GO_BACKWARD;
{HORIZONTAL_STOP} return HORIZONTAL_STOP;
{TURN_LEFT} return TURN_LEFT;
{TURN_RIGHT} return TURN_RIGHT;
{NOZZLE_ON} return NOZZLE_ON;
{NOZZLE_OFF} return NOZZLE_OFF;
{WIFI_CONNECT} return WIFI_CONNECT;
{WIFI_DISCONNECT} return WIFI_DISCONNECT;
{END_TIMER}	return END_TIMER;
{START_TIME} return START_TIME; 

{CREATE} return CREATE;
{MAKE} return MAKE;
{INPUT} return INPUT;
{OUTPUT} return OUTPUT;
{WHILE} return WHILE;
{FOR} return FOR;

{INTEGER} return INTEGER;
{IDENTIFIER} return IDENTIFIER;
{CHAR} return CHAR;
{STRING} return STRING;

%%
int yywrap(void) {
	return 1;
}