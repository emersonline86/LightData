unit formUsuarioEdicao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, Usuario;

type

  { TfrmUsuarioEdicao }

  TfrmUsuarioEdicao = class(TForm)
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
  frmUsuarioEdicao: TfrmUsuarioEdicao;

implementation

{$R *.lfm}

{ TfrmUsuarioEdicao }

procedure TfrmUsuarioEdicao.bBtnConfirmarClick(Sender: TObject);
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

procedure TfrmUsuarioEdicao.edtConfirmarSenhaExit(Sender: TObject);
begin
  if edtSenha.Text <> edtConfirmarSenha.Text then
  begin
    ShowMessage('As senhas não conferem. Por favor digite-as novamente.');
    edtSenha.Text := '';
    edtConfirmarSenha.Text := '';
    edtSenha.SetFocus;
  end;
end;

procedure TfrmUsuarioEdicao.edtEmailExit(Sender: TObject);
begin
  if (edtEmail.Text <> '') and (TempUsua.ChecarEmailUsuario(edtEmail.Text)) then
  begin
    ShowMessage('Esse email já existe para outro usuário. Por favor utilize um email diferente.');
    edtEmail.SetFocus;
  end;
end;

procedure TfrmUsuarioEdicao.edtUsuarioExit(Sender: TObject);
begin
  if (edtUsuario.Text <> '') and (TempUsua.ChecarUsuario(edtUsuario.Text)) then
  begin
    ShowMessage('Usuário já existente. Por favor escolha outro.');
    edtUsuario.SetFocus;
  end;
end;

procedure TfrmUsuarioEdicao.FormShow(Sender: TObject);
begin
  TempUsua := TUsuario.Create;
end;

procedure TfrmUsuarioEdicao.bBtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

end.

