unit uCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBGrids, DB, ADODB, Buttons, INIFILES;

type
  TfrmCadastro = class(TForm)
    edtCPF: TMaskEdit;
    edtCEP: TMaskEdit;
    edtRG: TMaskEdit;
    edtTel: TMaskEdit;
    edtCel: TMaskEdit;
    edtNome: TEdit;
    edtCity: TEdit;
    edtRua: TEdit;
    edtBairro: TEdit;
    edtNumero: TEdit;
    cbUF: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    btnCadastro: TButton;
    btnAltera: TButton;
    btnExclui: TButton;
    btnCancela: TButton;
    Label11: TLabel;
    edtEmail: TEdit;
    DataSource1: TDataSource;
    Label10: TLabel;
    edtNascimento: TMaskEdit;
    CadUs: TADOStoredProc;
    BitBtn1: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses Unit2;

{$R *.dfm}
procedure TfrmCadastro.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastro.btnCadastroClick(Sender: TObject);
begin
  if(edtNome.Text = '') or (edtCPF.Text = '') or (edtRG.Text = '')
  or (edtRua.Text = '') or (edtNascimento.Text = '') or (edtBairro.Text = '')
  or (edtCity.Text = '') or (cbUF.Text = '') or (edtCEP.Text = '')then
  begin
    MessageDlg('Preencha os campos com *', mtInformation, [mbOK], 0);
  end
    else
    begin
      Form1.ADOCadastro.Close;
      form1.ADOCadastro.SQL.Clear;
      form1.ADOCadastro.SQL.Add('INSERT INTO Cadastro');
      form1.ADOCadastro.SQL.Add('(Nome, Rua, Bairro, Cep, Numero, Cidade, RG, CPF, DTNascimento, UF, telefone, celular, email)');
      form1.ADOCadastro.SQL.Add('values');
      form1.ADOCadastro.SQL.Add('(:Nome, :Rua, :Bairro, :Cep, :Numero, :Cidade, :RG, :CPF, :DTNascimento, :UF, :telefone, :celular, :email)');
      form1.ADOCadastro.Parameters.ParamByName('Nome').Value := edtNome.Text;
      form1.ADOCadastro.Parameters.ParamByName('DTNascimento').Value := edtNascimento.Text;
      form1.ADOCadastro.Parameters.ParamByName('CPF').Value := edtCPF.Text;
      form1.ADOCadastro.Parameters.ParamByName('RG').Value := edtRG.Text;
      form1.ADOCadastro.Parameters.ParamByName('Rua').Value := edtRua.Text;
      form1.ADOCadastro.Parameters.ParamByName('Numero').Value :=  edtNumero.Text;
      form1.ADOCadastro.Parameters.ParamByName('Bairro').Value := edtBairro.Text;
      form1.ADOCadastro.Parameters.ParamByName('Cep').Value := edtCEP.Text;
      form1.ADOCadastro.Parameters.ParamByName('Cidade').Value := edtCity.Text;
      form1.ADOCadastro.Parameters.ParamByName('UF').Value := cbUF.Text;
      form1.ADOCadastro.Parameters.ParamByName('Telefone').Value := edtTel.Text;
      form1.ADOCadastro.Parameters.ParamByName('Celular').Value := edtCel.Text;
      form1.ADOCadastro.Parameters.ParamByName('Email').Value := edtEmail.Text;
      form1.ADOCadastro.ExecSQL;

        MessageDlg('Cadastro Concluido com Sucesso!!', mtInformation, [mbOK], 1);
        edtNome.Text := '';
        edtNascimento.Text := '';
        edtCPF.Text := '';
        edtRG.Text := '';
        edtRua.Text := '';
        edtNumero.Text := '';
        edtBairro.Text := '';
        edtCEP.Text := '';
        edtCity.Text := '';
        cbUF.Text := '';
        edtTel.Text := '';
        edtCel.Text := '';
        edtEmail.Text := '';
      begin
        form1.ADOCadastro.Close;
        form1.ADOCadastro.sql.Clear;
        form1.ADOCadastro.SQL.Add('select * from cadastro');
        form1.ADOCadastro.Open;
      end
    end
  end;
procedure TfrmCadastro.DBGrid1DblClick(Sender: TObject);
  begin
    edtNome.Text := form1.ADOCadastro.Fields[1].AsString;
    edtNascimento.Text := form1.ADOCadastro.Fields[9].AsString;
    edtRua.Text := form1.ADOCadastro.Fields[2].AsString;
    edtBairro.Text := form1.ADOCadastro.Fields[3].AsString;
    edtCEP.Text := form1.ADOCadastro.Fields[4].AsString;
    edtNumero.Text := form1.ADOCadastro.Fields[5].AsString;
    edtCity.Text := form1.ADOCadastro.Fields[6].AsString;
    edtRG.Text := form1.ADOCadastro.Fields[7].AsString;
    edtCPF.Text := form1.ADOCadastro.Fields[8].AsString;
    cbUF.Text := form1.ADOCadastro.Fields[10].AsString;
    edtTel.Text := form1.ADOCadastro.Fields[11].AsString;
    edtCel.Text := form1.ADOCadastro.Fields[12].AsString;
    edtEmail.Text := form1.ADOCadastro.Fields[13].AsString;

    btnCadastro.Enabled := false;
    btnAltera.Enabled := True;
    btnExclui.Enabled := True;
    btnCancela.Enabled := True;
  end;

procedure TfrmCadastro.btnExcluiClick(Sender: TObject);
  begin
    if not form1.ADOCadastro.IsEmpty then
      if application.MessageBox(PChar('Deseja realmente apagar o ' + DBGrid1.Columns.Items[1].Field.Text + ' do sistema?'),'atenção',mb_yesno+mb_iconquestion+mb_defbutton2)= id_yes then
      try
      form1.ADOCadastro.Delete;
      btnCadastro.Enabled :=  true;

      edtNome.Text := '';
      edtNascimento.Text := '';
      edtCPF.Text := '';
      edtRG.Text := '';
      edtRua.Text := '';
      edtNumero.Text := '';
      edtBairro.Text := '';
      edtCEP.Text := '';
      edtCity.Text := '';
      cbUF.Text := '';
      edtTel.Text := '';
      edtCel.Text := '';
      edtEmail.Text := '';
      except
        on EDatabaseError do
          showmessage('Cadastro com conta registrada');
    end;
  end;

procedure TfrmCadastro.FormShow(Sender: TObject);
  begin
    btnAltera.Enabled := False;
    btnExclui.Enabled := False;
    btnCancela.Enabled := False;
    
  end;

procedure TfrmCadastro.btnCancelaClick(Sender: TObject);
  begin
    btnCadastro.Enabled := True;
    btnAltera.Enabled := False;
    btnExclui.Enabled := False;
    btnCancela.Enabled := False;

      edtNome.Text := '';
      edtNascimento.Text := '';
      edtCPF.Text := '';
      edtRG.Text := '';
      edtRua.Text := '';
      edtNumero.Text := '';
      edtBairro.Text := '';
      edtCEP.Text := '';
      edtCity.Text := '';
      cbUF.Text := '';
      edtTel.Text := '';
      edtCel.Text := '';
      edtEmail.Text := '';
  end;

procedure TfrmCadastro.btnAlteraClick(Sender: TObject);
begin
   if messagedlg('Deseja realmente alterar estas informações?', mtconfirmation, [mbyes, mbno],0)=mryes then
     begin
      cadus.Parameters[2].Value := dbgrid1.Columns.Items[0].Field.Text;
      cadus.Parameters[3].Value := edtnome.Text;
      cadus.Parameters[4].Value := edtrua.Text;
      cadus.Parameters[5].Value := edtbairro.Text;
      cadus.Parameters[6].Value := edtCEP.Text;
      cadus.Parameters[7].Value := edtNumero.Text;
      cadus.Parameters[8].Value := edtCity.Text;
      cadus.Parameters[9].Value := edtRG.Text;
      cadus.Parameters[10].Value := edtCPF.Text;
      cadus.Parameters[11].Value := edtNascimento.Text;
      cadus.Parameters[12].Value := cbUF.Text;
      cadus.Parameters[13].Value := edtTel.Text;
      cadus.Parameters[14].Value := edtCel.Text;
      cadus.Parameters[15].Value := edtemail.Text;
      cadus.ExecProc;

      edtNome.Text := '';
      edtNascimento.Text := '';
      edtCPF.Text := '';
      edtRG.Text := '';
      edtRua.Text := '';
      edtNumero.Text := '';
      edtBairro.Text := '';
      edtCEP.Text := '';
      edtCity.Text := '';
      cbUF.Text := '';
      edtTel.Text := '';
      edtCel.Text := '';
      edtEmail.Text := '';

      form1.ADOCadastro.Close;
      form1.ADOCadastro.sql.Clear;
      form1.ADOCadastro.SQL.Add('select * from cadastro');
      form1.ADOCadastro.Open;
  end;
end;
procedure TfrmCadastro.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
