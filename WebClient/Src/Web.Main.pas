unit Web.Main;

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
  TClienteMainView = class(TWebForm)
    WebEdit1: TWebEdit;
    WebButton1: TWebButton;
    WebButton2: TWebButton;
    WebLabel1: TWebLabel;
    WebPushNotifications1: TWebPushNotifications;
    WebLabel3: TWebLabel;
    WebLabel4: TWebLabel;
    procedure WebButton1Click(Sender: TObject);
    procedure WebButton2Click(Sender: TObject);
    procedure WebEdit1Change(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure WebFormExit(Sender: TObject);
  private
    LLocalStorage: TLocalStorage;
    procedure DoAddToLocalStorage;
    procedure DoRemoveFromLocalStorage;
    procedure SetButtonState;
    procedure ValidUserID;
  end;

var
  ClienteMainView: TClienteMainView;

implementation

{$R *.dfm}

const
  STORAGE_KEY = 'pushUserID';

procedure TClienteMainView.WebFormCreate(Sender: TObject);
begin
  LLocalStorage := TLocalStorage.Create(Self);
  if LLocalStorage.Count > 0 then
  begin
    WebEdit1.Text := TLocalStorage.GetValue(STORAGE_KEY);
  end;

  Self.SetButtonState;
end;

procedure TClienteMainView.WebFormExit(Sender: TObject);
begin
  LLocalStorage.Free;
end;

procedure TClienteMainView.WebEdit1Change(Sender: TObject);
begin
  Self.SetButtonState;
end;

procedure TClienteMainView.SetButtonState;
begin
  if Trim(WebEdit1.Text).IsEmpty then
  begin
    WebButton1.Enabled := False;
    WebButton2.Enabled := False;
    Exit;
  end;

  if TLocalStorage.GetValue(STORAGE_KEY) = WebEdit1.Text then
  begin
    WebButton1.Enabled := False;
    WebButton2.Enabled := True;
  end
  else if not TLocalStorage.GetValue(STORAGE_KEY).Trim.IsEmpty then
  begin
    WebButton1.Enabled := False;
    WebButton2.Enabled := False;
  end
  else
  begin
    WebButton1.Enabled := True;
    WebButton2.Enabled := False;
  end;
end;

procedure TClienteMainView.ValidUserID;
begin
  if Trim(WebEdit1.Text).IsEmpty then
    raise Exception.Create('UserID cannot be empty!');
end;

procedure TClienteMainView.WebButton1Click(Sender: TObject);
begin
  Self.ValidUserID;

  WebPushNotifications1.RegistrationUserID := WebEdit1.Text;
  WebPushNotifications1.RegisterServiceWorker;

  DoAddToLocalStorage;
end;

procedure TClienteMainView.WebButton2Click(Sender: TObject);
begin
  Self.ValidUserID;

  WebPushNotifications1.RegistrationUserID := WebEdit1.Text;
  WebPushNotifications1.Unsubscribe;

  DoRemoveFromLocalStorage;
end;

procedure TClienteMainView.DoRemoveFromLocalStorage;
begin
  TWebLocalStorage.RemoveKey(STORAGE_KEY);
  SetButtonState;
end;

procedure TClienteMainView.DoAddToLocalStorage;
begin
  TWebLocalStorage.SetValue(STORAGE_KEY, WebEdit1.Text);
  SetButtonState;
end;

end.