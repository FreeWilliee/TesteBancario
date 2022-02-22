unit uMov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, StdCtrls, DBCtrls,
  Grids, DBGrids, ExtCtrls, cxLabel, cxDBLabel, Buttons, DB, Mask, ADODB,
  cxCalc, cxCurrencyEdit, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ppCtrls, jpeg, ppPrnabl, ppClass, ppDB, ppDBPipe,
  ppBands, ppCache, ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppVar, INIFILES;

type
  TfrMovi = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label9: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Edit5: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    sai: TcxCurrencyEdit;
    ent: TcxCurrencyEdit;
    VlrAtual: TcxDBCurrencyEdit;
    Bevel1: TBevel;
    Panel3: TPanel;
    Bevel2: TBevel;
    BancDB: TDBLookupComboBox;
    Button6: TButton;
    Ext: TDataSource;
    adida: TADOStoredProc;
    tab: TDataSource;
    Pesq: TDataSource;
    combinho: TEdit;
    Rel1: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBPipeline1: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    BitBtn1: TBitBtn;
    ppFooterBand1: TppFooterBand;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel11: TppLabel;
    ppLine5: TppLine;
    ppDBText8: TppDBText;
    ppLine2: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure entExit(Sender: TObject);
    procedure saiExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMovi: TfrMovi;

implementation
uses uBanqueiro, Unit2;
{$R *.dfm}

procedure TfrMovi.FormCreate(Sender: TObject);
begin
dbedit1.Text := '';
dbedit2.Text := '';
vlratual.text := '';
end;

procedure TfrMovi.entExit(Sender: TObject);
begin
    if ent.Value > 0 then
  begin
    vlratual.Value:= (ent.Value + vlratual.Value)
  end
end;

procedure TfrMovi.saiExit(Sender: TObject);
begin
    if sai.Value > 0 then
  begin
    vlratual.Value:= ((sai.Value - vlratual.Value)* -1)
  end
end;
procedure TfrMovi.Button1Click(Sender: TObject);
begin
  if(bancDB.Text = '') then
  begin
    MessageDlg('Preencha os campos com *', mtInformation, [mbOK], 0);
  end
    else
    begin

        adida.Parameters[2].Value := bancdb.KeyValue;
        adida.Parameters[5].Value := dbedit1.Text;
        adida.Parameters[4].Value := dbedit2.Text;
        adida.Parameters[6].Value := edit5.Text;
        adida.Parameters[7].Value := now;
        adida.Parameters[8].Value := ent.Text;
        adida.Parameters[9].Value := sai.Text;
        adida.Parameters[10].Value := vlratual.Text;
        adida.ExecProc;

        ent.value := 0;
        sai.Value := 0;
end;
end;
procedure TfrMovi.Button6Click(Sender: TObject);
begin
  IF
    combinho.Text = '' then
    showmessage ('Campo vazio')
  else
    form1.ADOsis.Close;
    form1.ADOsis.SQL.Clear;
    form1.ADOsis.SQL.Add('SELECT Conta.id_conta, Cadastro.nome, Mov.Agencia, Mov.banco, mov.data, mov.descricao, mov.entrada, mov.saida, mov.total from cadastro, conta, mov where Conta.ID_Cadastro = Cadastro.ID_Cadastro and Conta.id_conta = Mov.id_conta and nome like' + quotedStr('%' + combinho.text + '%'));
    form1.ADOsis.SQL.Add('order by data asc');
    form1.ADOsis.Open;
end;

procedure TfrMovi.Button4Click(Sender: TObject);
begin
 form1.ADOsis.Close;
end;

procedure TfrMovi.Button5Click(Sender: TObject);
begin
close;
dbedit1.Text := '';
dbedit2.Text := '';
vlratual.text := '';
end;

procedure TfrMovi.Button3Click(Sender: TObject);
begin
rel1.Print;
end;

procedure TfrMovi.Button2Click(Sender: TObject);
begin
      dbedit1.Text := '';
      dbedit2.Text := '';
      edit5.Text := '';
      ent.Text := '';
      sai.Text := '';
      vlratual.Text := '';
end;

end.
