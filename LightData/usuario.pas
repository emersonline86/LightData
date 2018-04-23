unit Usuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ZDataset;

type

  { TUsuario }
  TUsuario = class
  private
    FId: integer ;
    FNome: string;
    FUsuario: string;
    FSenha: string;
    FEmail: string;
    FIdUsuaRegistro: integer;
    FDataRegistro: TDateTime;
    FDataRegistroOffset: integer;
  public
    property Id: integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;
    property Email: string read FEmail write FEmail;
    property IdUsuaRegistro: integer read FIdUsuaRegistro write FIdUsuaRegistro;
    property DataRegistro: TDateTime read FDataRegistro write FDataRegistro;
    property DataRegistroOffset: integer read FDataRegistroOffset write FDataRegistroOffset;
    procedure InsertUsuario();
    procedure UpdateUsuario();
    function ChecarUsuario(usua: string): boolean;
    function ChecarEmailUsuario(emailNovo: string): boolean;
  end;

  TMyException = class(Exception);

implementation
uses
  dmPrincipal;

{ TUsuario }

procedure TUsuario.InsertUsuario();
var
  SqlQuery: TZQuery;
begin
  SqlQuery := TZQuery.Create(nil);
  if (Id = -1) then
  begin
    try
      { TODO 5 -oEmerson -cPadronização de queries : Reformular query para utilização de parâmetros ao invés e concatenar os valores diretamente no texto da query. }
      SqlQuery.Active := false;
      SqlQuery.Connection := Dm1.conn;
      SqlQuery.Sql.Text := '';
      SqlQuery.SQL.Add('INSERT INTO usuario (nome, usuario, senha, email, usuario_registro_id) VALUES (');
      SqlQuery.SQL.Add('''' + Nome + ''',');
      SqlQuery.SQL.Add('''' + Usuario + ''',');
      SqlQuery.SQL.Add('''' + Senha + ''',');
      SqlQuery.SQL.Add('''' + Email + ''',');
      SqlQuery.SQL.Add('''' + IntToStr(IdUsuaRegistro) + ''')');
      SqlQuery.Active := true;
    finally
      SqlQuery.Free;
    end;
  end
  else
    Raise TMyException.Create('Objeto Usuario possui Id; Inserção no banco de dados abortada.');
end;

procedure TUsuario.UpdateUsuario();
begin

end;

function TUsuario.ChecarUsuario(usua: string): boolean;
var
  SqlQuery: TZQuery;
begin
  try
    SqlQuery := TZQuery.Create(nil);
    SqlQuery.Connection := Dm1.conn;
    SqlQuery.Active := false;
    SqlQuery.SQL.Add('SELECT COUNT(*) AS Total FROM usuario where lower(usuario) = :UserName');
    SqlQuery.ParamByName('UserName').AsString := LowerCase(usua);
    SqlQuery.Active := true;
    if SqlQuery.FieldByName('Total').AsInteger > 0 then
      result := true
    else
      result := false;
  finally
    SqlQuery.Free;
  end;
end;

function TUsuario.ChecarEmailUsuario(emailNovo: string): boolean;
var
  SqlQuery: TZQuery;
begin
  try
    SqlQuery := TZQuery.Create(nil);
    SqlQuery.Connection := Dm1.conn;
    SqlQuery.Active := false;
    SqlQuery.SQL.Add('SELECT COUNT(*) AS Total FROM usuario where lower(email) = :Email');
    SqlQuery.ParamByName('Email').AsString := LowerCase(emailNovo);
    SqlQuery.Active := true;
    if SqlQuery.FieldByName('Total').AsInteger > 0 then
      result := true
    else
      result := false;
  finally
    SqlQuery.Free;
  end;
end;

end.
