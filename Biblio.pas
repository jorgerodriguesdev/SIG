unit Biblio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Dbtables, Inifiles, ZIbSqlQuery, ZMySqlQuery;

Function  minuscula(InString: String): String;
function ConsultaNormal(ConsultaNormal:TQuery;Expressao:string):Boolean;
function Consulta(Consulta:TZIbSqlQuery;Expressao:string):Boolean;
function ZConsulta(ZConsulta:TZQuery;Expressao:string):Boolean;
function Repete(Caractere: char; nCaracteres: integer): string;
function TestaCgc(xCGC: String):Boolean;
function TestaCpf( xCPF:String ):Boolean;
function ChecaEstado(Dado : string) : boolean;
function RoundNum(Valor:Extended;Decimais:Integer):Extended;
function MixCase(InString: String): String;
function StrToPChar(const Str: string): PChar;
function DataToSQL(sdata:string):string;
function OrderData(sdata:string):string;
function RTrim( Texto:String) : String;
function LTrim( Texto:String) : String;
function Alltrim( Texto:String) : String;
function StrZero(Num:Real ; Zeros,Deci:integer): string;
function Hora_Seg( Horas:string ):LongInt;
function Seg_Hora( Seg:LongInt ):string;
Procedure ZapFiles(vMasc:String);
procedure PegaEmpresa;
procedure PegaEndereco;

var
   I : TextFile;
   Fname, InString : String;

implementation

Procedure PegaEndereco;
begin
   Fname := 'c:\Nivek Informatica\endereco.Txt';
   AssignFile(I,Fname);
   Reset(I);
   ReadLn(I,InString);
   CloseFile(I);
end;

Procedure PegaEmpresa;
begin
   Fname := 'c:\Nivek Informatica\empresa.Txt';
   AssignFile(I,Fname);
   Reset(I);
   ReadLn(I,InString);
   CloseFile(I);
end;

function ConsultaNormal(ConsultaNormal:TQuery;Expressao:string):Boolean;
//realiza a consulta em codigo SQL no sistema
var resultado:boolean;
begin
   resultado := true;
   consultaNormal.active := false;
   consultaNormal.sql.clear;
   consultaNormal.sql.add(expressao);
   consultaNormal.active := true;
   consultaNormal.first;
   if consultaNormal.recordcount = 0 then
      resultado := false;
   result := resultado;
end;

function Consulta(Consulta:TZIbSqlQuery;Expressao:string):Boolean;
//realiza a consulta em codigo SQL no sistema
var resultado:boolean;
begin
   resultado := true;
   consulta.active := false; consulta.sql.clear; consulta.sql.add(expressao);
   consulta.active := true; consulta.first;
   if consulta.recordcount = 0 then
      resultado := false;
   result := resultado;
end;

function ZConsulta(ZConsulta:TZQuery;Expressao:string):Boolean;
//realiza a consulta em codigo SQL no sistema
var resultado:boolean;
begin
   resultado := true;
   myconsulta.active := false;
   myconsulta.sql.clear;
   myconsulta.sql.add(expressao);
   myconsulta.active := true;
   myconsulta.first;
   if myconsulta.recordcount = 0 then
      resultado := false;
   result := resultado;
end;

function Repete(Caractere: char; nCaracteres: integer): string;
var n : integer; CadeiaCar : string;
begin
   CadeiaCar := '';
   for n := 1 to nCaracteres do CadeiaCar := CadeiaCar + Caractere;
   Result := CadeiaCar;
end;

function TestaCgc(xCGC: String):Boolean;
{Testa se o CGC é válido ou não}
Var
d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
Check : String;
begin
d1 := 0;
d4 := 0;
xx := 1;
for nCount := 1 to Length( xCGC )-2 do
    begin
    if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
       begin
       if xx < 5 then
          begin
          fator := 6 - xx;
          end
       else
          begin
          fator := 14 - xx;
          end;
       d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
       if xx < 6 then
          begin
          fator := 7 - xx;
          end
       else
          begin
          fator := 15 - xx;
          end;
       d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
       xx := xx+1;
       end;
    end;
    resto := (d1 mod 11);
    if resto < 2 then
       begin
       digito1 := 0;
       end
   else
       begin
       digito1 := 11 - resto;
       end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
      digito2 := 0;
      end
   else
      begin
      digito2 := 11 - resto;
      end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCGC,succ(length(xCGC)-2),2) then
      begin
      Result := False;
      end
   else
      begin
      Result := True;
      end;
end;

function TestaCpf( xCPF:String ):Boolean;
{Testa se o CPF é válido ou não}
Var
d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
Check : String;
Begin
d1 := 0; d4 := 0; xx := 1;
for nCount := 1 to Length( xCPF )-2 do
    begin
    if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
       begin
       d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
       d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
       xx := xx+1;
       end;
    end;
resto := (d1 mod 11);
if resto < 2 then
   begin
   digito1 := 0;
   end
else
   begin
   digito1 := 11 - resto;
   end;
d4 := d4 + 2 * digito1;
resto := (d4 mod 11);
if resto < 2 then
   begin
   digito2 := 0;
   end
else
   begin
   digito2 := 11 - resto;
   end;
Check := IntToStr(Digito1) + IntToStr(Digito2);
if Check <> copy(xCPF,succ(length(xCPF)-2),2) then
   begin
   Result := False;
   end
else
   begin
   Result := True;
   end;
end;

function ChecaEstado(Dado : string) : boolean;
{Checa se o Simbolo da UF é Valido}
const
  Estados = 'SPMGRJRSSCPRESDFMTMSGOTOBASEALPBPEMARNCEPIPAAMAPFNACRRRO';
var
  Posicao : integer;
begin
Result := true;
if Dado <> '' then
   begin
   Posicao := Pos(UpperCase(Dado),Estados);
   if (Posicao = 0) or ((Posicao mod 2) = 0) then
      begin
      Result := false;
      end;
    end;
end;

function RoundNum(Valor:Extended;Decimais:Integer):Extended;
{Quando houver,Arredonda uma possivel terceira casa decimal em uma variável}
var
  I:Integer;
  Multiplicador:Integer;
begin
  if Decimais > 15 then
     begin
     Decimais := 15;
     end
  else if Decimais < 0 then
          begin
          Decimais := 0;
          end;
  Multiplicador := 1;
  for I:=1 to Decimais do
      begin
      Multiplicador := Multiplicador*10;
      end;
Result := round(Valor*Multiplicador)/Multiplicador;
end;

Function  MixCase(InString: String): String;
{ Corrige a string que contenha caracteres maiusculos
  inseridos no meio dela para tudo minusculo e com a
  primeira letra maiuscula}
Var I: Integer;
Begin
  Result := LowerCase(InString);
  Result[1] := UpCase(Result[1]);
  For I := 1 To Length(InString) - 1 Do Begin
    If (Result[I] = ' ') Or (Result[I] = '''') Or (Result[I] = '"')
    Or (Result[I] = '-') Or (Result[I] = '.')  Or (Result[I] = '(') Then
      Result[I + 1] := UpCase(Result[I + 1]);
    if Result[I] = 'Ç' then
      Result[I] := 'ç';
    if Result[I] = 'Ã' then
      Result[I] := 'ã';
    if Result[I] = 'Á' then
      Result[I] := 'á';
    if Result[I] = 'É' then
      Result[I] := 'é';
    if Result[I] = 'Í' then
      Result[I] := 'í';
    if Result[I] = 'Õ' then
      Result[I] := 'õ';
    if Result[I] = 'Ó' then
      Result[I] := 'ó';
    if Result[I] = 'Ú' then
      Result[I] := 'ú';
    if Result[I] = 'Â' then
      Result[I] := 'â';
    if Result[I] = 'Ê' then
      Result[I] := 'ê';
    if Result[I] = 'Ô' then
      Result[I] := 'ô';
  End;
End;

function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
     begin
     Result := @Str[1];
     end
  else
     begin
     Result := StrAlloc(Length(Str)+1);
     RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
     StrPCopy(Result,Str);
     StrDispose(Ring[RingIndex]);
     Ring[RingIndex]:= Result;
     end;
end;

function OrderData(sdata:string):string;
begin
   result := copy(sdata,7,4)+'-'+copy(sdata,4,2)+'-'+copy(sdata,1,2);
end;


function DataToSQL(sdata:string):string;
begin
   result := copy(sdata,7,4)+'/'+copy(sdata,4,2)+'/'+copy(sdata,1,2);
end;

Procedure ZapFiles(vMasc:String);
{Apaga arquivos usando mascaras tipo: c:\Temp\*.zip, c:\Temp\*.*
 Obs: Requer o Path dos arquivos a serem deletados}
Var Dir : TsearchRec;
    Erro: Integer;
Begin
   Erro := FindFirst(vMasc,faArchive,Dir);
   While Erro = 0 do Begin
      DeleteFile( ExtractFilePAth(vMasc)+Dir.Name );
      Erro := FindNext(Dir);
   End;
   FindClose(Dir);
End;

function RTrim( Texto:String) : String;
var i,a,b : integer;
begin
a := 01; b := 00;
for i := Length( Texto ) DownTo 01 do
  if Texto[i] <> ' ' then
     begin
        b := i; BREAK;
     end;
b := b - a+1;Result := Copy(Texto,a,b);
end;

function LTrim( Texto:String) : String;
var i,a,b : integer;
begin
a := 00; b := Length( Texto );
for i := 1 to Length( Texto ) do
  if Texto[i] <> ' ' then
     begin
        a := i; BREAK;
     end;
b := b - a+1;Result := Copy(Texto,a,b);
end;

function Alltrim( Texto:String) : String;
begin
 Texto := RTrim( Texto );
  Texto := LTrim( Texto );
  Result := Texto;
end;

function StrZero(Num:Real ; Zeros,Deci:integer): string;
var Tam,Z:integer;
    Res,Zer:string;
begin
   Str(Num:Zeros:Deci,Res);
   Res := Alltrim(Res);
   Tam := Length(Res);
   Zer := '';
   for z := 01 to (Zeros-Tam) do
      Zer := Zer + '0';
   Result := Zer+Res;
end;

function Hora_Seg( Horas:string ):LongInt;
Var Hor,Min,Seg:LongInt;
begin
   Horas[Pos(':',Horas)]:= '[';
   Horas[Pos(':',Horas)]:= ']';
   Hor := StrToInt(Copy(Horas,1,Pos('[',Horas)-1));
   Min := StrToInt(Copy(Horas,Pos('[',Horas)+1,(Pos(']',Horas)-Pos('[',Horas)-1)));
   if Pos(':',Horas) > 0 then
      Seg := StrToInt(Copy(Horas,Pos(']',Horas)+1,(Pos(':',Horas)-Pos(']',Horas)-1)))
   else
      Seg := StrToInt(Copy(Horas,Pos(']',Horas)+1,2));
   Result := Seg + (Hor*3600) + (Min*60);
end;

function Seg_Hora( Seg:LongInt ):string;
Var Hora,Min:LongInt;
    Tmp : Double;
begin
   Tmp := Seg / 3600;
   Hora := Round(Int(Tmp));
   Seg :=  Round(Seg - (Hora*3600));
   Tmp := Seg / 60;
   Min := Round(Int(Tmp));
   Seg :=  Round(Seg - (Min*60));
   Result := StrZero(Hora,2,0)+':'+StrZero(Min,2,0)+':'+StrZero(Seg,2,0);
end;

Function  minuscula(InString: String): String;
{converte tudo para minuscula}
Var I: Integer;
Begin
  Result := LowerCase(InString);
  For I := 1 To Length(InString) - 1 Do Begin
    If (Result[I] = ' ') Or (Result[I] = '''') Or (Result[I] = '"')
    Or (Result[I] = '-') Or (Result[I] = '.')  Or (Result[I] = '(') Then
      Result[I] := UpCase(Result[I]);
    if Result[I] = 'Ç' then
      Result[I] := 'ç';
    if Result[I] = 'Ã' then
      Result[I] := 'ã';
    if Result[I] = 'Á' then
      Result[I] := 'á';
    if Result[I] = 'É' then
      Result[I] := 'é';
    if Result[I] = 'Í' then
      Result[I] := 'í';
    if Result[I] = 'Õ' then
      Result[I] := 'õ';
    if Result[I] = 'Ó' then
      Result[I] := 'ó';
    if Result[I] = 'Ú' then
      Result[I] := 'ú';
    if Result[I] = 'Â' then
      Result[I] := 'â';
    if Result[I] = 'Ê' then
      Result[I] := 'ê';
    if Result[I] = 'Ô' then
      Result[I] := 'ô';
  End;
End;

end.
