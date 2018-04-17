unit formUsuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  Buttons, DbCtrls, DBExtCtrls, StdCtrls, ComCtrls, ZDataset, db,
  formUsuariosInserir;

type

  { TfrmUsuarios }

  TfrmUsuarios = class(TForm)
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
    ilUsuarios: TImageList;
    lblDataRegistro: TLabel;
    lblId: TLabel;
    lblNome: TLabel;
    lblUsuario: TLabel;
    lblUsuarioRegistro: TLabel;
    lblUsuarioRegistro1: TLabel;
    query: TZQuery;
    ToolBar1: TToolBar;
    tBtnIncluir: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure bBtnSairClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tBtnIncluirClick(Sender: TObject);
  private

  public

  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.lfm}

{ TfrmUsuarios }

procedure TfrmUsuarios.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction := caFree;
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  query.Active := true;
end;

procedure TfrmUsuarios.tBtnIncluirClick(Sender: TObject);
var
  novoUsuario: TfrmUsuariosInserir;
begin
  try
    novoUsuario := TfrmUsuariosInserir.Create(nil);
    novoUsuario.ShowModal;
  finally
    novoUsuario.Free;
    query.Refresh;
  end;
end;

procedure TfrmUsuarios.bBtnSairClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmUsuarios.Button1Click(Sender: TObject);
begin

end;

procedure TfrmUsuarios.DBGrid1TitleClick(Column: TColumn);
begin
  query.IndexFieldNames := Column.FieldName;
end;

end.

