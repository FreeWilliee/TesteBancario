unit uSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB;

type
  TFrSenha = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnEntra: TButton;
    Button2: TButton;
    procedure btnEntraClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrSenha: TFrSenha;

implementation

uses uPrincipal1, uCadastro, unit2;

{$R *.dfm}

procedure TFrSenha.btnEntraClick(Sender: TObject);
begin
if frmPrincipal = nil then
   frmPrincipal := TfrmPrincipal.Create(self);
  begin
    form1.adoSenha.open;
    if form1.adoSenha.Locate('USU_NOME', edtLogin.Text, [loCaseInsensitive ]) and
       form1.adoSenha.Locate('USU_SENHA', edtSenha.Text, [loCaseInsensitive ]) then
  begin
    form1.adoSenha.Close();
    edtLogin.Clear;
    edtSenha.Clear;
    frmPrincipal.Show;
    Self.Hide;
    end
    else if (edtLogin.Text = '') and (edtSenha.Text= '') then
       begin
         // mostra mensagem
       frmPrincipal.Close;
       ShowMessage('Preencha os campos login e senha!');
       edtLogin.SetFocus;
       end
       else
       begin
         // campos nao conferem
         frmPrincipal.Close;
         ShowMessage('Usuario ou senha inválidos!');
         edtLogin.SetFocus;
         edtLogin.Clear;
         edtSenha.Clear;
       end;
 end;
 end;

procedure TFrSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  btnEntra.Click;
end;

procedure TFrSenha.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  btnEntra.Click;
end;

end.
