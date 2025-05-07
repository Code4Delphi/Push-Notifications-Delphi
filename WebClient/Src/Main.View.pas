unit Main.View;

interface

uses
  System.SysUtils,
  System.Classes,
  JS,
  Web,
  WEBLib.Graphics,
  WEBLib.Controls,
  WEBLib.Forms,
  WEBLib.Dialogs,
  Vcl.StdCtrls,
  WEBLib.StdCtrls,
  Vcl.Controls,
  WEBLib.ExtCtrls,
  WEBLib.PushNotifications,
  WEBLib.Storage;

type
  TMainView = class(TWebForm)
    pnFormulario: TWebPanel;
    lbNome: TWebLabel;
    edtUserID: TWebEdit;
    pnBotoes: TWebPanel;
    btnSubscribe: TWebButton;
    btnUnsubscribe: TWebButton;
    WebPushNotifications1: TWebPushNotifications;
    procedure WebFormCreate(Sender: TObject);
    procedure WebFormExit(Sender: TObject);
    procedure edtUserIDChange(Sender: TObject);
    procedure btnSubscribeClick(Sender: TObject);
    procedure btnUnsubscribeClick(Sender: TObject);
  private
    ls: TLocalStorage;
    procedure DoAddToLocalStorage;
    procedure DoRemoveFromLocalStorage;
    procedure SetButtonState;
    function ValidUserID: Boolean;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.WebFormCreate(Sender: TObject);
begin
  ls := TLocalStorage.Create(Self);
  if ls.Count > 0 then
  begin
    edtUserID.Text := TLocalStorage.GetValue('pushUserID');
  end;

  SetButtonState;
end;

procedure TMainView.WebFormExit(Sender: TObject);
begin
  ls.Free;
end;

procedure TMainView.SetButtonState;
begin
  if edtUserID.Text = '' then
  begin
    btnSubscribe.Enabled := False;
    btnUnsubscribe.Enabled := False;
    Exit;
  end;

  if TLocalStorage.GetValue('pushUserID') = edtUserID.Text then
  begin
    btnSubscribe.Enabled := False;
    btnUnsubscribe.Enabled := True;
  end
  else if TLocalStorage.GetValue('pushUserID') <> '' then
  begin
    btnSubscribe.Enabled := False;
    btnUnsubscribe.Enabled := False;
  end
  else
  begin
    btnSubscribe.Enabled := True;
    btnUnsubscribe.Enabled := False;
  end;
end;

procedure TMainView.DoAddToLocalStorage;
begin
  TWebLocalStorage.SetValue('pushUserID', edtUserID.Text);
  Self.SetButtonState;
end;

procedure TMainView.DoRemoveFromLocalStorage;
begin
  TWebLocalStorage.RemoveKey('pushUserID');
  Self.SetButtonState;
end;

procedure TMainView.edtUserIDChange(Sender: TObject);
begin
  Self.SetButtonState;
end;

function TMainView.ValidUserID: Boolean;
begin
  Result := True;
  if edtUserID.Text = '' then
  begin
    Result := False;
    ShowMessage('UserID cannot be empty!');
  end;
end;

procedure TMainView.btnSubscribeClick(Sender: TObject);
begin
  if ValidUserID then
  begin
    WebPushNotifications1.RegistrationUserID := edtUserID.Text;
    WebPushNotifications1.RegisterServiceWorker;

    DoAddToLocalStorage;
  end;
end;

procedure TMainView.btnUnsubscribeClick(Sender: TObject);
begin
  if ValidUserID then
  begin
    WebPushNotifications1.RegistrationUserID := edtUserID.Text;
    WebPushNotifications1.Unsubscribe;

    DoRemoveFromLocalStorage;
  end;
end;

end.
