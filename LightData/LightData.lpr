program LightData;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, formPrincipal, formUsuario, dmPrincipal, Usuario, formUsuarioEdicao
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDm1, Dm1);
  Application.CreateForm(TfrmUsuarioEdicao, frmUsuarioEdicao);
  Application.Run;
end.

