program Compression;

uses
  Vcl.Forms,
  UPrincP in 'UPrincP.pas' {FPrincP},
  ImageButton in 'ImageButton.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincP, FPrincP);
  Application.Run;
end.
