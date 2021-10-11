program RushHour;

uses
  Forms,
  VCL_Mainform in 'VCL_Mainform.pas' {MainForm},
  Unit_Car in 'Unit_Car.pas',
  VCL_InfoForm in 'VCL_InfoForm.pas' {InfoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Rush Hour';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInfoForm, InfoForm);
  Application.Run;
end.
