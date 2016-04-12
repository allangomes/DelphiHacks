unit FormTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Data.FMTBcd, Data.SqlExpr;

type
  TForm1 = class(TForm)
    btnAction: TButton;
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    SQLConnection: TSQLConnection;
    SQLQuery: TSQLQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblOpenedFDConnection: TLabel;
    lblOpenedSQLConnection: TLabel;
    lblOpenedFDQuery: TLabel;
    lblOpenedSQLQuery: TLabel;
    lblActiveFDConnection: TLabel;
    lblActiveSQLConnection: TLabel;
    lblActiveFDQuery: TLabel;
    lblActiveSQLQuery: TLabel;
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure ConnectionAfterConnect(Sender: TObject);
    procedure QueryAfterClose(DataSet: TDataSet);
    procedure ConnectionAfterDisconnect(Sender: TObject);
    procedure btnActionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  LABEL_OPENED = 'lblOpened';
  LABEL_ACTIVE = 'lblActive';
  SIM_NAO: array[Boolean] of string = ('NÃO', 'SIM');

implementation

{$R *.dfm}

procedure TForm1.btnActionClick(Sender: TObject);
begin
  FDConnection.Open;
  SQLConnection.Open;
  FDQuery.Open;
  SQLQuery.Open;
end;

procedure TForm1.ConnectionAfterConnect(Sender: TObject);
begin
  TLabel(FindComponent(LABEL_OPENED + TComponent(Sender).Name)).Caption := SIM_NAO[True];
  TLabel(FindComponent(LABEL_ACTIVE + TComponent(Sender).Name)).Caption := SIM_NAO[True];
end;

procedure TForm1.ConnectionAfterDisconnect(Sender: TObject);
begin
  TLabel(FindComponent(LABEL_ACTIVE + TComponent(Sender).Name)).Caption := SIM_NAO[False];
end;

procedure TForm1.QueryAfterClose(DataSet: TDataSet);
begin
  TLabel(FindComponent(LABEL_ACTIVE + DataSet.Name)).Caption := SIM_NAO[False];
end;

procedure TForm1.QueryAfterOpen(DataSet: TDataSet);
begin
  TLabel(FindComponent(LABEL_OPENED + DataSet.Name)).Caption := SIM_NAO[True];
  TLabel(FindComponent('lblActive'+DataSet.Name)).Caption := SIM_NAO[True];
end;

end.
