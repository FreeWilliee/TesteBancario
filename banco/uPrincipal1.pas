unit uPrincipal1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, Menus,
  cxStyles, cxGraphics, cxEdit, cxScheduler, cxSchedulerStorage, IniFiles,
  cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, dxSkinscxScheduler3Painter,
  StdCtrls, ExtCtrls, cxSchedulerDBStorage, cxContainer, cxLabel, jpeg,
  cxPC, cxControls, cxLookAndFeelPainters, cxButtons, cxLookAndFeels,
  ComCtrls, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinStardust, ppDB, ppParameter, ppBands, ppCtrls, ppVar, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, cxImage,
  cxGroupBox, DB, ADODB, Buttons, cxTextEdit, RxGIF, ppGIFImage,
  cxPropertiesStore, ppStrtch, ppRichTx, IdBaseComponent,
  IdComponent, IdIPWatch, CnsJpgGr, dxSkinGlassOceans, dxSkinBlack,
  dxSkiniMaginary, dxSkinLilian, dxSkinSilver, dxSkinValentine, SHELLAPI,
  Grids, DBGrids, cxDBEdit, ppBarCod, ppMemo, dxGDIPlusClasses, cxMemo;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    btnCliente: TBitBtn;
    btnConta: TBitBtn;
    btnMove: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    procedure btnClienteClick(Sender: TObject);
    procedure btnContaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uCadastro, uBanqueiro, uMov, Unit2, uSenha;

{$R *.dfm}


procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin
   if frmcadastro = nil then
      frmcadastro := frmcadastro.Create(self);
      frmcadastro.Parent := Panel2;
      frmcadastro.Show;
   end;
procedure TfrmPrincipal.btnContaClick(Sender: TObject);
begin
   if form1.adoSenha.locate('USU_ID', 1, []) then
      frmconta := frmconta.Create(self)
   else
      showmessage('Usuário sem permissão para acessar esse campo');
   end;
procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  label1.Caption := timetostr(now);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  label2.Caption := formatdatetime('dd/mm/yyyy', now);
end;

procedure TfrmPrincipal.btnMoveClick(Sender: TObject);
begin
    if frMovi = nil then
      frMovi := frMovi.Create(self);
      frMovi.Parent := Panel2;
      frMovi.Show;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frSenha.Close;
end;

end.
