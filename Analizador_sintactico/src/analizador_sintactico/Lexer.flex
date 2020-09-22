package analizador_sintactico;

import java_cup.runtime.Symbol;
import analizador_sintactico.sym;


%%
%cup
%unicode
%class Lexer
%type java_cup.runtime.Symbol
%public
%column
%char
%full
%line
%state comment
%state comment_single
%state cont_instruction
%ignorecase


ESPACIO =(\t|\r\n|\r|" ")*
NEW_LINE = [\n]+
/* Simbolos */

ASSIGN = [<][=]
COLON = [:]
COMMA = [,]
BACKLASH = \
INIT_CODE_BLOCK = [-][>][\n]*
END_CODE_BLOCK = [<][.][\n]*
LEFT_PARENTHESIS = [(]
RIGHT_PARENTHESIS = [)]
LEFT_BRACKET = \[
RIGHT_BRACKET = \]
LEFT_BRACE = [{]
RIGHT_BRACE = [}]
QUOTATION_MARK=[']
COMMENT_SINGLE_LINE = [#]
COMMENT_INIT = [#][>]
COMMENT_END = [<][#]


/* Operadores Relacionales */

REL_OP = (=|<|>|=<|>=)


/* Operadores Logicos */

AND = and
OR = or
NOT = not

/* Operadores Matematicos */

ADD_OP = [\+\-]
MULT_OP = [\*\/]
EXP_OP = [\^]


/* palabras reservadas */

/* Tipos de dato */

TYPE = (int|bool|chr)

/* Condiciones */

IF = if
OTHERWISE = otherwise

/* Entrada y Salida (consola) */

INPUT = input
OUTPUT = output

/* ciclos */

LOOP = loop
IN = in
NEXT = next

/* switch */

WHEN = when
DO = do
END = end

/* funciones */

FUNCTION = fun

/* other */
 
ID = [a-zA-Z_][_0-9a-zA-Z]*
NUM = [0-9]+
//char= (['][a-zA-Z]['])|('\\n'|'\\t'|'\\r')
CHAR = ['].[']|('\\n'|'\\t'|'\\r')
BOOLEAN = (true|false)


%%

<YYINITIAL>{
	
        {INIT_CODE_BLOCK}	{return new Symbol(sym.INIT_CODE_BLOCK, yyline, yycolumn, yytext().substring(0,2));}
	{END_CODE_BLOCK}	{return new Symbol(sym.END_CODE_BLOCK, yyline, yycolumn, yytext().substring(0,2));}
        {CHAR}			{return new Symbol(sym.CHR_VAL, yyline, yycolumn, yytext());}
	{BACKLASH}	 	{yybegin(cont_instruction);}
	{NEW_LINE}		{return new Symbol(sym.NEW_LINE, yyline, yycolumn, "\n");}
	{NUM}			{return new Symbol(sym.NUM, yyline, yycolumn, yytext());}
	{FUNCTION}		{return new Symbol(sym.FUNCTION, yyline, yycolumn, yytext());}
	{ASSIGN}		{return new Symbol(sym.ASSIGN, yyline, yycolumn, yytext());}
	{REL_OP}		{return new Symbol(sym.REL_OP, yyline, yycolumn, yytext());}
	{COMMA}			{return new Symbol(sym.COMMA, yyline, yycolumn, yytext());}
	{LEFT_PARENTHESIS}	{return new Symbol(sym.LEFT_PARENTHESIS, yyline, yycolumn, yytext());}
	{RIGHT_PARENTHESIS}	{return new Symbol(sym.RIGHT_PARENTHESIS, yyline, yycolumn, yytext());} 
	{LEFT_BRACKET}	 	{return new Symbol(sym.LEFT_BRACKET, yyline, yycolumn, yytext());}
	{RIGHT_BRACKET} 	{return new Symbol(sym.RIGHT_BRACKET, yyline, yycolumn, yytext());}
	{LEFT_BRACE} 		{return new Symbol(sym.LEFT_BRACE, yyline, yycolumn, yytext());}
	{RIGHT_BRACE}		{return new Symbol(sym.RIGHT_BRACE, yyline, yycolumn, yytext());}
	{AND}                   {return new Symbol(sym.AND, yyline, yycolumn, yytext());}
        {OR}                    {return new Symbol(sym.OR, yyline, yycolumn, yytext());}
        {NOT}                   {return new Symbol(sym.NOT, yyline, yycolumn, yytext());}
	{TYPE}			{return new Symbol(sym.TYPE, yyline, yycolumn, yytext());}
	{INPUT}			{return new Symbol(sym.INPUT, yyline, yycolumn, yytext());}
	{OUTPUT}		{return new Symbol(sym.OUTPUT, yyline, yycolumn, yytext());}	
	{IF}			{return new Symbol(sym.IF, yyline, yycolumn, yytext());}
	{OTHERWISE}		{return new Symbol(sym.OTHERWISE, yyline, yycolumn, yytext());}
	{LOOP}			{return new Symbol(sym.LOOP, yyline, yycolumn, yytext());}
	{IN}			{return new Symbol(sym.IN, yyline, yycolumn, yytext());}
	{NEXT}			{return new Symbol(sym.NEXT, yyline, yycolumn, yytext());}
	{WHEN}			{return new Symbol(sym.WHEN, yyline, yycolumn, yytext());}
	{DO}			{return new Symbol(sym.DO, yyline, yycolumn, yytext());}
	{COLON}			{return new Symbol(sym.COLON, yyline, yycolumn, yytext());}
	{END}  			{return new Symbol(sym.END, yyline, yycolumn, yytext());}
	{ADD_OP}		{return new Symbol(sym.ADD_OP, yyline, yycolumn, yytext());}
	{MULT_OP}		{return new Symbol(sym.MULT_OP, yyline, yycolumn, yytext());}
	{EXP_OP}		{return new Symbol(sym.EXP_OP, yyline, yycolumn, yytext());}
	{BOOLEAN}		{return new Symbol(sym.BOOL_VAL, yyline, yycolumn, yytext());}
	{COMMENT_SINGLE_LINE}	{yybegin(comment_single);}
	{COMMENT_INIT}		{yybegin(comment);}
	{ID}			{return new Symbol(sym.ID, yyline, yycolumn, yytext());}
        {ESPACIO}               {}

}

<comment>{
	
	{COMMENT_END}		{yybegin(YYINITIAL);}
        {ESPACIO}               {}
        {NEW_LINE}		{}
	.			{}	

}
<comment_single>{
	
	{NEW_LINE}		{yybegin(YYINITIAL);}
	.			{}	

}

<cont_instruction>{
        
        {NEW_LINE}              {yybegin(YYINITIAL);}
        .			{/*error*/}

}






