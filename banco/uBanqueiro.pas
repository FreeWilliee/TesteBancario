unit uBanqueiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, DB, Mask, ExtCtrls,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinsDefaultPainters,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, ADODB, INIFILES;

type
  TfrmConta = class(TForm)
    dbContas: TDBGrid;
    edtBanco: TEdit;
    edtCC: TEdit;
    edtAge: TEdit;
    bbAl: TBitBtn;
    dtCon: TDataSource;
    CadBtn: TButton;
    AtlBtn: TButton;
    ExBtn: TButton;
    dtPes: TDataSource;
    cbCli: TDBLookupComboBox;
    dtTab: TDataSource;
    bitFecha: TBitBtn;
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtSald: TEdit;
    Label5: TLabel;
    dtConM: TDataSource;
    Del: TADOStoredProc;
    ALT: TADOStoredProc;
    procedure bbAlClick(Sender: TObject);
    procedure CadBtnClick(Sender: TObject);
    procedure bitFechaClick(Sender: TObject);
    procedure dbContasDblClick(Sender: TObject);
    procedure ExBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtlBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConta: TfrmConta;

implementation
uses uCadastro, Unit2;
{$R *.dfm}

procedure TfrmConta.bbAlClick(Sender: TObject);
var
  num: integer;
begin
    randomize;
    num := random(10000000);
    edtCC.Text := IntToStr(num);
end;

procedure TfrmConta.CadBtnClick(Sender: TObject);
begin
begin
  if(edtBanco.Text = '') or (edtAge.Text = '')            
  or (edtCC.Text = '') or (cbCli.Text = '')then
  begin
    MessageDlg('Preencha os campos com *', mtInformation, [mbOK], 0);
  end
    else
    begin
        Form1.ADOConta.Close;
        form1.ADOConta.SQL.Clear;
        form1.ADOConta.SQL.Add('INSERT INTO Conta');
        form1.ADOConta.SQL.Add('(id_conta, ID_Cadastro, agencia, banco)');
        form1.ADOConta.SQL.Add('values');
        form1.ADOConta.SQL.Add('(:id_conta, :ID_Cadastro, :agencia, :banco)');
        form1.ADOConta.Parameters[0].Value := edtCC.Text;
        form1.ADOConta.Parameters[1].Value := cbcli.KeyValue;
        form1.ADOConta.Parameters[2].Value := edtage.Text;
        form1.ADOConta.Parameters[3].Value := edtbanco.Text;
        form1.ADOConta.ExecSQL;

        Form1.ADOMov.Close;
        form1.ADOMov.SQL.Clear;
        form1.ADOMov.SQL.Add('INSERT INTO Mov');
        form1.ADOMov.SQL.Add('(id_conta, Agencia, banco, entrada, total, descricao, data)');
        form1.ADOMov.SQL.Add('values');
        form1.ADOMov.SQL.Add('(:id_conta, :agencia, :banco, :entrada, :total, :descricao, :data)');
        form1.ADOMov.Parameters[0].Value := edtCC.Text;
        form1.ADOMov.Parameters[1].Value := edtAge.Text;
        form1.ADOMov.Parameters[2].Value := edtbanco.Text;
        form1.ADOMov.Parameters[3].Value := edtsald.Text;
        form1.ADOMov.Parameters[4].Value := edtsald.Text;
        form1.ADOMov.Parameters[5].Value := 'PRIMEIRO DEPOSITO';
        form1.ADOMov.Parameters[6].Value := now;
        form1.ADOMov.ExecSQL;

        MessageDlg('Cadastro Concluido com Sucesso!!', mtInformation, [mbOK], 1);
        edtCC.Text := '';
        edtAge.Text := '';
        edtbanco.Text := '';
        edtSald.Text := '';
        cbcli.KeyValue := null;

      begin
        form1.ADOConta.Close;
        form1.ADOConta.sql.Clear;
        form1.ADOConta.SQL.Add('select * from conta');
        form1.ADOConta.Open;
      end
    end
  end;
end;

procedure TfrmConta.bitFechaClick(Sender: TObject);
begin
close;
end;

procedure TfrmConta.dbContasDblClick(Sender: TObject);
begin
    edtBanco.Text := form1.ADOConta.Fields[3].AsString;
    edtCC.Text := form1.ADOConta.Fields[0].AsString;
    edtAge.Text := form1.ADOConta.Fields[2].AsString;

    CadBtn.Enabled := false;
    AtlBtn.Enabled := True;
    ExBtn.Enabled := True;
end;

procedure TfrmConta.ExBtnClick(Sender: TObject);
begin
    if not form1.ADOConta.IsEmpty then
    if application.MessageBox(PChar('Deseja realmente apagar o ' + dbContas.Columns.Items[1].Field.Text + ' do sistema?'),'atenção',mb_yesno+mb_iconquestion+mb_defbutton2)= id_yes then

    del.Parameters[2].Value := edtCC.Text;
    del.ExecProc;

    edtBanco.Text := '';
    edtCC.Text := '';
    edtAge.Text := '';

    CadBtn.Enabled := true;
    AtlBtn.Enabled := false;
    ExBtn.Enabled := false;

    form1.ADOConta.Close;
    form1.ADOConta.sql.Clear;
    form1.ADOConta.SQL.Add('select * from conta');
    form1.ADOConta.Open;
end;

procedure TfrmConta.FormShow(Sender: TObject);
begin
    atlbtn.Enabled := False;
    exbtn.Enabled := False;
    
end;

procedure TfrmConta.AtlBtnClick(Sender: TObject);
begin
if messagedlg('Deseja realmente alterar estas informações?', mtconfirmation, [mbyes, mbno],0)=mryes then
      begin
      alt.Parameters[2].Value := edtCC.Text;
      ALT.Parameters[3].Value := edtbanco.Text;
      alt.Parameters[4].Value := edtAge.Text;
      alt.ExecProc;

      edtBanco.Text := '';
      edtCC.Text := '';
      edtAge.Text := '';

      form1.ADOConta.Close;
      form1.ADOConta.sql.Clear;
      form1.ADOConta.SQL.Add('select * from conta');
      form1.ADOConta.Open;
  end;
end;
procedure TfrmConta.Button1Click(Sender: TObject);
begin
    CadBtn.Enabled := true;
    AtlBtn.Enabled := false;
    ExBtn.Enabled := false;

    edtBanco.Text := '';
    edtCC.Text := '';
    edtAge.Text := '';
end;

end.
