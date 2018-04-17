unit formPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, IniFiles, formUsuario, dmPrincipal;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    miTabelasGerais: TMenuItem;
    miEstadoCivil: TMenuItem;
    miStatusReg: TMenuItem;
    miUsuarios: TMenuItem;
    miCadastro: TMenuItem;
    miSistema: TMenuItem;
    miSair: TMenuItem;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure miUsuariosClick(Sender: TObject);
    procedure ConexaoBD();
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.ConexaoBD();
var
  BdConfig: TIniFile;
begin
  BdConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'LightData.Ini' );
  try
    dm1.conn.Connected := false;
    dm1.conn.HostName := BdConfig.ReadString('BDConfig','Servidor','');
    dm1.conn.Port := BdConfig.ReadInteger('BDConfig','Porta',0);
    dm1.conn.User := BdConfig.ReadString('BDConfig','Usuario','');
    dm1.conn.Password := BdConfig.ReadString('BDConfig','Senha','');
    dm1.conn.Database := BdConfig.ReadString('BDConfig','BancoDeDados','');
    dm1.conn.Connected := true;
  except
    on E: Exception do
    begin
      ShowMessage(E.ClassName + ': ' + E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TfrmMain.miSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ConexaoBD();
end;

procedure TfrmMain.miUsuariosClick(Sender: TObject);
var
  fUsuarios: TfrmUsuario;
begin
  try
    fUsuarios := TfrmUsuario.Create(nil);
    fUsuarios.ShowModal;
  finally
    fUsuarios.Free;
  end;
end;

end.

