program Hacks;

uses
  Vcl.Forms,
  FormTeste in 'FormTeste.pas' {Form1},
  CodeRedirect in 'CodeRedirect.pas',
  DataSetHack in 'DataSetHack.pas',
  CustomConectionHack in 'CustomConectionHack.pas',
  FDDataSetHack in 'FDDataSetHack.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
