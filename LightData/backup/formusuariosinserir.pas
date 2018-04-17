unit formUsuariosEdicao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, Usuarios;

type

  { TfrmUsuariosInserir }

  TfrmUsuariosInserir = class(TForm)
    bBtnCancelar: TBitBtn;
    bBtnConfirmar: TBitBtn;
    edtNome: TEdit;
    edtUsuario: TEdit;
    edtEmail: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    gpDadosUsuario: TGroupBox;
    lblNome: TLabel;
    lblUsuario: TLabel;
    lblEmail: TLabel;
    lblSenha: TLabel;
    lblConfirmarSenha: TLabel;
    procedure bBtnCancelarClick(Sender: TObject);
    procedure bBtnConfirmarClick(Sender: TObject);
    procedure edtConfirmarSenhaExit(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    tempUsua: TUsuario;
  public

  end;

var
  frmUsuariosInserir: TfrmUsuariosInserir;

implementation

{$R *.lfm}

{ TfrmUsuariosInserir }

procedure TfrmUsuariosInserir.bBtnConfirmarClick(Sender: TObject);
var
  NovoUsuario: TUsuario;
begin
  try
    NovoUsuario := TUsuario.Create;
    NovoUsuario.Nome := edtNome.Text;
    NovoUsuario.Usuario := edtUsuario.Text;
    NovoUsuario.Senha := edtSenha.Text;
    NovoUsuario.Email := edtEmail.Text;
    NovoUsuario.IdUsuaRegistro := 1;
    NovoUsuario.InsertUsuario(NovoUsuario);
    ShowMessage('Usuario inserido com sucesso!');
  finally
    NovoUsuario.Free;
    ModalResult := mrOk;
  end;
end;

procedure TfrmUsuariosInserir.edtConfirmarSenhaExit(Sender: TObject);
begin
  if edtSenha.Text <> edtConfirmarSenha.Text then
  begin
    ShowMessage('As senhas não conferem. Por favor digite-as novamente.');
    edtSenha.Text := '';
    edtConfirmarSenha.Text := '';
    edtSenha.SetFocus;
  end;
end;

procedure TfrmUsuariosInserir.edtEmailExit(Sender: TObject);
begin
  if (edtEmail.Text <> '') and (TempUsua.ChecarEmailUsuario(edtEmail.Text)) then
  begin
    ShowMessage('Esse email já existe para outro usuário. Por favor utilize um email diferente.');
    edtEmail.SetFocus;
  end;
end;

procedure TfrmUsuariosInserir.edtUsuarioExit(Sender: TObject);
begin
  if (edtUsuario.Text <> '') and (TempUsua.ChecarUsuario(edtUsuario.Text)) then
  begin
    ShowMessage('Usuário já existente. Por favor escolha outro.');
    edtUsuario.SetFocus;
  end;
end;

procedure TfrmUsuariosInserir.FormShow(Sender: TObject);
begin
  TempUsua := TUsuario.Create;
end;

procedure TfrmUsuariosInserir.bBtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

end.

