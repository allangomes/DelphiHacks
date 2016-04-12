unit DataSetHack;

interface

uses
  Data.DB;

type
  TDataSetHack = class(TDataSet)
  protected
    procedure LoadedPatch;
  end;

implementation

uses
  CodeRedirect;

{ TDataSetHack }

var
  C: TCodeRedirect;

procedure TDataSetHack.LoadedPatch;
begin

end;

initialization
  C := TCodeRedirect.Create(@TDataSetHack.Loaded, @TDataSetHack.LoadedPatch);

finalization
  C.Free;

end.
