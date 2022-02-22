program TelaPrincipal;

uses
  Dialogs,
  Windows,
  SysUtils,
  inifiles,
  Forms,
  uSenha in 'uSenha.pas' {FrSenha},
  uPrincipal1 in 'uPrincipal1.pas' {frmPrincipal},
  uCadastro in 'uCadastro.pas' {frmCadastro},
  uBanqueiro in 'uBanqueiro.pas' {frmConta},
  uMov in 'uMov.pas' {frMovi},
  Unit2 in 'Unit2.pas' {Form1: TDataModule};

{$R *.res}
Var HprevHist : HWND;
begin
Application.Initialize;
HprevHist := FindWindow(Nil, PChar('TheProgrammer'));
if HprevHist = 0 then begin
Application.Title := 'TheProgrammer';
Application.CreateForm(TfrSenha, frSenha);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.CreateForm(TfrmConta, frmConta);
  Application.CreateForm(TfrMovi, frMovi);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end else
MessageDlg('Você não pode executar outra cópia do aplicativo', mtInformation, [mbOK], 0);
end.




