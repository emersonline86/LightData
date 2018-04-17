unit formUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  Buttons, DbCtrls, DBExtCtrls, StdCtrls, ComCtrls, ActnList, ZDataset, db,
  formUsuarioEdicao, dmPrincipal;

type

  { TfrmUsuario }

  TfrmUsuario = class(TForm)
    aInserirUsuario: TAction;
    alUsuario: TActionList;
    bBtnSair: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    dbEdtEmail: TDBEdit;
    dbEdtId: TDBEdit;
    dbEdtUsuario: TDBEdit;
    dbEdtUsuario1: TDBEdit;
    dbEdtUsuarioRegistro: TDBEdit;
    DBGrid1: TDBGrid;
    dsUsuario: TDataSource;
    GroupBox1: TGroupBox;
    ilusuario: TImageList;
    ilUsuarios: TImageList;
    lblDataRegistro: TLabel;
    lblId: TLabel;
    lblNome: TLabel;
    lblUsuario: TLabel;
    lblUsuarioRegistro: TLabel;
    lblUsuarioRegistro1: TLabel;
    query: TZQuery;
    ToolBarUsuario: TToolBar;
    tBtnIncluir: TToolButton;
    tBtnAlterar: TToolButton;
    tBtnCancelar: TToolButton;
    tBtnSeparador1: TToolButton;
    tBtnPesquisar: TToolButton;
    procedure aInserirUsuarioExecute(Sender: TObject);
    procedure bBtnSairClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmusuario: TfrmUsuario;

implementation

{$R *.lfm}

{ TfrmUsuario }

procedure TfrmUsuario.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction := caFree;
end;

procedure TfrmUsuario.FormShow(Sender: TObject);
begin
  query.Connection := Dm1.Conn;
  query.Active := true;
end;

procedure TfrmUsuario.bBtnSairClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmUsuario.aInserirUsuarioExecute(Sender: TObject);
var
  novoUsuario: TfrmUsuarioEdicao;
begin
  try
    novoUsuario := TfrmUsuarioEdicao.Create(nil);
    novoUsuario.ShowModal;
  finally
    novoUsuario.Free;
    query.Refresh;
  end;
end;

procedure TfrmUsuario.DBGrid1TitleClick(Column: TColumn);
begin
  query.IndexFieldNames := Column.FieldName;
end;

end.

