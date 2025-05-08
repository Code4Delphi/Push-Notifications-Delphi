program WebPushClient;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  Client.Main.View in 'Src\Client.Main.View.pas' {ClientMainView: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientMainView, ClientMainView);
  Application.Run;
end.
