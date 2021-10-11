unit VCL_InfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TInfoForm = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    Procedure InitCredit;
  end;

var
  InfoForm: TInfoForm;

implementation

{$R *.dfm}

Procedure TInfoForm.InitCredit;
begin
  With Memo1 do
  begin
    Clear;
    Lines.Add('RUSH HOUR 3D');
    Lines.Add('Programmer Par Dereumaux Hervi');
    Lines.Add('Version 1.0');
    Lines.Add('Create at 17.12.2007');
    Lines.Add('');
    Lines.Add('Based on original game "RUSH HOUR"');
  end;
end;

end.
