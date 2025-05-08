unit Main.View;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.StdCtrls, WEBLib.Forms, WEBLib.Dialogs, WEBLib.PushNotifications,
  WEBLib.Storage, Vcl.StdCtrls, Vcl.Controls;

type
  TMainView = class(TWebForm)
    edtUserID: TWebEdit;
    btnSubscribe: TWebButton;
    btnUnsubscribe: TWebButton;
    WebLabel1: TWebLabel;
    WebPushNotifications1: TWebPushNotifications;
    procedure btnSubscribeClick(Sender: TObject);
    procedure btnUnsubscribeClick(Sender: TObject);
    procedure edtUserIDChange(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure WebFormExit(Sender: TObject);
  private
    LStorage: TLocalStorage;
    procedure DoAddToLocalStorage;
    procedure DoRemoveFromLocalStorage;
    procedure SetButtonState;
    function ValidUserID: Boolean;
  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

const
  KEY_STORAGE = 'pushUserID';

procedure TMainView.WebFormCreate(Sender: TObject);
begin
  LStorage := TLocalStorage.Create(Self);
  if LStorage.Count > 0 then
    edtUserID.Text := TLocalStorage.GetValue(KEY_STORAGE);

  Self.SetButtonState;
end;

procedure TMainView.WebFormExit(Sender: TObject);
begin
  LStorage.Free;
end;

procedure TMainView.DoAddToLocalStorage;
begin
  TWebLocalStorage.SetValue(KEY_STORAGE, edtUserID.Text);
  Self.SetButtonState;
end;

procedure TMainView.DoRemoveFromLocalStorage;
begin
  TWebLocalStorage.RemoveKey(KEY_STORAGE);
  Self.SetButtonState;
end;

procedure TMainView.SetButtonState;
begin
  if Trim(edtUserID.Text).IsEmpty then
  begin
    btnSubscribe.Enabled := False;
    btnUnsubscribe.Enabled := False;
    Exit;
  end;

  if TLocalStorage.GetValue(KEY_STORAGE) = edtUserID.Text then
  begin
    btnSubscribe.Enabled := False;
    btnUnsubscribe.Enabled := True;
  end
  else if not TLocalStorage.GetValue(KEY_STORAGE).IsEmpty then
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

function TMainView.ValidUserID: Boolean;
begin
  Result := True;
  if Trim(edtUserID.Text).IsEmpty then
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

procedure TMainView.edtUserIDChange(Sender: TObject);
begin
  SetButtonState;
end;

end.