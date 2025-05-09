program WebPushClient;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  WebMainView in 'WebMainView.pas' {MainView: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
