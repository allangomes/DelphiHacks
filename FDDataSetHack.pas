unit FDDataSetHack;

interface

uses
  FireDAC.Comp.DataSet, CodeRedirect;

type
  TFDDataSetHack = class(TFDDataSet)
  protected
    procedure LoadedPatch;
  end;

implementation

{ TFDDataSetHack }

procedure TFDDataSetHack.LoadedPatch;
begin

end;

var
  Loaded: TCodeRedirect;

initialization
  Loaded := TCodeRedirect.Create(@TFDDataSetHack.Loaded, @TFDDataSetHack.LoadedPatch);

finalization

end.
