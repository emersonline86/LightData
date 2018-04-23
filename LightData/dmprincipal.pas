unit dmPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZConnection;

type

  { TDm1 }

  TDm1 = class(TDataModule)
    conn: TZConnection;
  private

  public

  end;
  //Enumarator usado para definir o estado das telas de edição
  TModoEdicao = (Incluir, Editar, Visualizar);

var
  Dm1: TDm1;

implementation

{$R *.lfm}

end.

