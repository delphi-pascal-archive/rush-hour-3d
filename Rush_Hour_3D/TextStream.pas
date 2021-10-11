unit TextStream;

interface

Uses
  Classes,
  SysUtils;

Type
  TVector = Record X, Y , Z : Single; end;
  TRGB = Record R, G, B : Byte; end;
  TRGBA = Record R, G , B , A : Byte; end;
  TColor = Record R, G , B , A : Single; end;
  TCoord = Record U , V : Single; End;

{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{---- TTextStream -------------------------------------------------------------}
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

  TSetOfChar = set of Char;
  TTextStream = class(TStringList)
  private
    fSeparators: TSetOfChar;
    fOpenBracket: String;
    fCloseBracket: String;
    fText: String;
    fPosition: Integer;
    fBrackets: Integer;
    fLevel: integer;
    fSpace : String;
  public
    Constructor Create;
    Procedure LoadFromFile(Const FileName : String);Override;
    function GetNextToken: String;
    Function ExtractFromQuote: String;

    Procedure AddString(AMessage: String; AString: String);
    Procedure AddInteger(AMessage: String; AInteger: Integer);
    Procedure AddSingle(AMessage: String; ASingle: Single);
    Procedure AddBoolean(AMessage: String; ABoolean: Boolean);
    Procedure AddVector(AMessage: String; AVector: TVector);
    Procedure AddRGB(AMessage: String; ARGB: TRGB);
    Procedure AddRGBA(AMessage: String; ARGBA: TRGBA);
    Procedure AddColor(AMessage: String; AColor: TColor);
    Procedure AddCoord(AMessage: String; ACoord: TCoord);

    Function GetString(AMessage: String) : String;
    Function GetInteger(AMessage: String) : Integer;
    Function GetSingle(AMessage: String) : Single;
    Function GetBoolean(AMessage: String) : Boolean;
    Function GetVector(AMessage: String) : TVector;
    Function GetCoord(AMessage: String) : TCoord;
    Function GetColor(AMessage: String) : TColor;
    Function GetRGB(AMessage: String): TRGB;
    Function GetRGBA(AMessage: String): TRGBA;

    Procedure LevelUp;
    Procedure LevelDown;

    property BracketLevel: Integer read FBrackets;
    property Separators: TSetOfChar read FSeparators write FSeparators;
    property OpenBracket: String read FOpenBracket write FOpenBracket;
    property CloseBracket: String read FCloseBracket write FCloseBracket;
    Property Position : Integer Read fPosition;
  end;

function StripQuotes(const s: String): String;

implementation

function StripQuotes(const s: String): String;
begin
  Result := s;
  if (Result[1] = '''') or (Result[1] = '"') then
    Delete(Result, 1, 1);
  if (Result[Length(Result)] = '''') or (Result[Length(Result)] = '"') then
    Delete(Result, Length(Result), 1);
end;

{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{---- TTextStream ------------------------------------------------------------}
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

constructor TTextStream.Create;
var
  sl: TStringList;
begin
  inherited Create;

  FSeparators := [
        #0,       // Null character (is this ever used in Pascal strings?)
        #9,       // Tab
        #10,      // LF
        #13,      // CR
        ' '       // Space
      ];
  FOpenBracket := '{';
  FCloseBracket := '}';
  fLevel := 0;
end;

Procedure TTextStream.LoadFromFile(Const FileName : String);
Begin
  inherited LoadFromFile(FileName);
  FText := Text;
  FPosition := 1;
  FBrackets := 0;
End;

function TTextStream.GetNextToken: String;
var
  res: String;
  n: Integer;
begin
  n := Length(FText);
  while (FPosition <= n) and (FText[FPosition] in FSeparators) do INC(FPosition);
  res := '';
  while (FPosition <= n) and (not (FText[FPosition] in FSeparators)) do
  begin
    res := res + FText[FPosition];
    INC(FPosition);
  end;
  if res = FOpenBracket then INC(FBrackets)
  else if res = FCloseBracket then DEC(FBrackets);
  if FBrackets < 0 then raise Exception.Create('Brackets do not match!');
  Result := res;
end;

Function TTextStream.ExtractFromQuote : String;
Var
  Tok : String;
Begin
  tok := GetNextToken;
  Result := tok;
  while tok[Length(tok)] <> '"' do
  begin
    tok := GetNextToken;
    Result := Result + ' ' + tok;
  end;
  Result := StripQuotes(Result);
end;

Procedure TTextStream.AddString(AMessage: String; AString: String);
Begin
  Add(fSpace + AMessage + ' "' + AString + '"');
end;

Procedure TTextStream.AddInteger(AMessage: String; AInteger: Integer);
Var
  Tmp: String;
begin
  Tmp :=AMessage +  ' ' + IntToStr(AInteger);
  Add(fSpace +  Tmp);
end;

Procedure TTextStream.AddSingle(AMessage: String; ASingle: Single);
Var
  Tmp: String;
begin
  Tmp :=AMessage +  ' ' + FloatToStr(ASingle);
  Add(fSpace + Tmp);
end;

Procedure TTextStream.AddBoolean(AMessage: String; ABoolean: Boolean);
Var
  Tmp: String;
begin
  if ABoolean then Tmp := AMessage + ' TRUE' else Tmp := AMessage + ' FALSE';
  Add(fSpace + Tmp);
end;

Procedure TTextStream.AddVector(AMessage: String; AVector: TVector);
Var
  Tmp: String;
begin
  Tmp :=AMessage +  ' ' + FloatToStr(AVector.x)+ ' ' +  FloatToStr(AVector.Y)+ ' ' + FloatToStr(AVector.Z);
  Add(fSpace + Tmp);
end;

Procedure TTextStream.AddCoord(AMessage: String; ACoord: TCoord);
Var
  Tmp: String;
begin
  Tmp :=AMessage +  ' ' + FloatToStr(ACoord.U)+ ' ' +  FloatToStr(ACoord.V);
  Add(fSpace + Tmp);
end;

Procedure TTextStream.AddRGB(AMessage: String; ARGB: TRGB);
Var
  Tmp: String;
begin
  Tmp :=AMessage +  ' ' + IntToStr(ARGB.R)+ ' ' +  IntToStr(ARGB.G)+ ' ' + IntToStr(ARGB.B) ;
  Add(fSpace + Tmp);
end;

Procedure TTextStream.AddRGBA(AMessage: String; ARGBA: TRGBA);
Var
  Tmp: String;
begin
  Tmp :=AMessage +  ' ' + IntToStr(ARGBA.R)+ ' ' +  IntToStr(ARGBA.G)+ ' ' + IntToStr(ARGBA.B) + ' ' + IntToStr(ARGBA.A);
  Add(fSpace + Tmp);
end;

Procedure TTextStream.AddColor(AMessage: String; AColor: TColor);
Var
  Tmp: String;
begin
  Tmp :=AMessage +  ' ' + FloatToStr(AColor.R)+ ' ' +  FloatToStr(AColor.G)+ ' ' + FloatToStr(AColor.B) + ' ' + FloatToStr(AColor.A);
  Add(fSpace + Tmp);
end;

{------------------------------------------------------------------------------}

Function TTextStream.GetString(AMessage: String) : String;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then Result := ExtractFromQuote;
end;

Function TTextStream.GetInteger(AMessage: String) : Integer;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then Result := StrToInt(GetNextToken)
  else raise Exception.Create(AMEssage + ' Not Found !');
end;

Function TTextStream.GetSingle(AMessage: String) : Single;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then Result := StrToFloat(GetNextToken)
  else raise Exception.Create(AMEssage + ' Not Found !');
end;

Function TTextStream.GetBoolean(AMessage: String) : Boolean;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then
  begin
    Tok := GetNextToken;
    if SameText(Tok, 'TRUE') then REsult := True Else Result := False;
  end else raise Exception.Create(AMEssage + ' Not Found !');
end;

Function TTextStream.GetVector(AMessage: String) : TVector;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then
  begin
    REsult.X := StrToFloat(GetNextToken);
    REsult.Y := StrToFloat(GetNextToken);
    REsult.Z := StrToFloat(GetNextToken);
  end else raise Exception.Create(AMEssage + ' Not Found !');
end;

Function TTextStream.GetRGB(AMessage: String): TRGB;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then
  begin
    Result.R := StrToInt(GetNextToken);
    Result.G := StrToInt(GetNextToken);
    Result.B := StrToInt(GetNextToken);
  end else raise Exception.Create(AMEssage + ' Not Found !');
end;

Function TTextStream.GetRGBA(AMessage: String): TRGBA;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then
  begin
    Result.R := StrToInt(GetNextToken);
    Result.G := StrToInt(GetNextToken);
    Result.B := StrToInt(GetNextToken);
    Result.A := StrToInt(GetNextToken);
  end else raise Exception.Create(AMEssage + ' Not Found !');
end;

Function TTextStream.GetColor(AMessage: String) : TColor;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then
  begin
    Result.R := StrToFloat(GetNextToken);
    Result.G := StrToFloat(GetNextToken);
    Result.B := StrToFloat(GetNextToken);
    Result.A := StrToFloat(GetNextToken);
  end else raise Exception.Create(AMEssage + ' Not Found !');
end;

Function TTextStream.GetCoord(AMessage: String) : TCoord;
Var
  Tok : String;
Begin
  Tok := GetNextToken;
  if SameText(Tok, AMessage) then
  begin
    Result.U := StrToFloat(GetNextToken);
    Result.V := StrToFloat(GetNextToken);
  end else raise Exception.Create(AMEssage + ' Not Found !');
end;

Procedure TTextStream.LevelUp;
Var
  I:integer;
begin
  inc(flevel);
  fSpace := '';
  For I := 1 to fLevel do fSpace := fSpace + ' ';
end;

Procedure TTextStream.LevelDown;
Var
  I: integer;
begin
  Dec(fLevel);
  if fLevel<0 then Exception.Create('Level Too Low');
  fSpace := '';
  For I := 1 to fLevel do fSpace := fSpace + ' ';
end;

end.
