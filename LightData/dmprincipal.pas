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

var
  Dm1: TDm1;

implementation

{$R *.lfm}

end.

