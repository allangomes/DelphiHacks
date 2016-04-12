unit CustomConectionHack;

interface

uses
  Data.DB;

type
  TCustomConectionHack = class(TCustomConnection)
  protected
    procedure LoadedPatch;
  end;

implementation

uses
  CodeRedirect;

var
  C: TCodeRedirect;

{ TCustomConectionHack }

procedure TCustomConectionHack.LoadedPatch;
begin

end;

initialization
  C := TCodeRedirect.Create(@TCustomConectionHack.Loaded, @TCustomConectionHack.LoadedPatch);

finalization
  C.Free;


end.
