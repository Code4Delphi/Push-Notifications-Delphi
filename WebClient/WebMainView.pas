unit WebMainView;

interface

uses
  System.SysUtils,
  System.Classes,
  JS,
  Web,
  WEBLib.Graphics,
  WEBLib.Controls,
  WEBLib.StdCtrls,
  WEBLib.Forms,
  WEBLib.Dialogs,
  WEBLib.PushNotifications,
  WEBLib.Storage,
  Vcl.StdCtrls,
  Vcl.Controls;

type
  TMainView = class(TWebForm)
    edtUserID: TWebEdit;
    btnWebSubscribe: TWebButton;
    btnWebUnsubscribe: TWebButton;
    WebLabel1: TWebLabel;
    WebPushNotifications1: TWebPushNotifications;
    procedure btnWebSubscribeClick(Sender: TObject);
    procedure btnWebUnsubscribeClick(Sender: TObject);
    procedure edtUserIDChange(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure WebFormExit(Sender: TObject);
  private
    LLocalStorage: TLocalStorage;
    procedure SetButtonState;
    procedure ValidUserID;
  public
  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

const
  STORAGE_KEY = 'pushUserID';

procedure TMainView.WebFormCreate(Sender: TObject);
begin
  LLocalStorage := TLocalStorage.Create(Self);
  if LLocalStorage.Count > 0 then
    edtUserID.Text := TLocalStorage.GetValue(STORAGE_KEY);

  Self.SetButtonState;
end;

procedure TMainView.WebFormExit(Sender: TObject);
begin
  LLocalStorage.Free;
end;

procedure TMainView.edtUserIDChange(Sender: TObject);
begin
  Self.SetButtonState;
end;

procedure TMainView.SetButtonState;
begin
  if edtUserID.Text = '' then
  begin
    btnWebSubscribe.Enabled := False;
    btnWebUnsubscribe.Enabled := False;
    Exit;
  end;

  if TLocalStorage.GetValue(STORAGE_KEY) = edtUserID.Text then
  begin
    btnWebSubscribe.Enabled := False;
    btnWebUnsubscribe.Enabled := True;
  end
  else if not Trim(TLocalStorage.GetValue(STORAGE_KEY)).IsEmpty then
  begin
    btnWebSubscribe.Enabled := False;
    btnWebUnsubscribe.Enabled := False;
  end
  else
  begin
    btnWebSubscribe.Enabled := True;
    btnWebUnsubscribe.Enabled := False;
  end;
end;

procedure TMainView.ValidUserID;
begin
  if Trim(edtUserID.Text).IsEmpty then
    raise Exception.Create('UserID cannot be empty!');
end;

procedure TMainView.btnWebSubscribeClick(Sender: TObject);
begin
  Self.ValidUserID;

  WebPushNotifications1.RegistrationUserID := edtUserID.Text;
  WebPushNotifications1.RegisterServiceWorker;

  TWebLocalStorage.SetValue(STORAGE_KEY, edtUserID.Text);
  Self.SetButtonState;
end;

procedure TMainView.btnWebUnsubscribeClick(Sender: TObject);
begin
  Self.ValidUserID;

  WebPushNotifications1.RegistrationUserID := edtUserID.Text;
  WebPushNotifications1.Unsubscribe;

  TWebLocalStorage.RemoveKey(STORAGE_KEY);
  Self.SetButtonState;
end;

end.