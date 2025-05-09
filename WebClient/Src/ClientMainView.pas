unit ClientMainView;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.StdCtrls, WEBLib.Forms, WEBLib.Dialogs, WEBLib.PushNotifications,
  WEBLib.Storage, Vcl.StdCtrls, Vcl.Controls;

type
  TClientMain = class(TWebForm)
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
    ls: TLocalStorage;
    procedure DoAddToLocalStorage;
    procedure DoRemoveFromLocalStorage;
    procedure SetButtonState;
    function ValidUserID: Boolean;
  end;

var
  ClientMain: TClientMain;

implementation

{$R *.dfm}

procedure TClientMain.DoAddToLocalStorage;
begin
  TWebLocalStorage.SetValue('pushUserID', WebEdit1.Text);
  SetButtonState;
end;

procedure TClientMain.DoRemoveFromLocalStorage;
begin
  TWebLocalStorage.RemoveKey('pushUserID');
  SetButtonState;
end;

procedure TClientMain.SetButtonState;
begin
  if WebEdit1.Text = '' then
  begin
    WebButton1.Enabled := False;
    WebButton2.Enabled := False;
    Exit;
  end;

  if TLocalStorage.GetValue('pushUserID') = WebEdit1.Text then
  begin
    WebButton1.Enabled := False;
    WebButton2.Enabled := True;
  end
  else if TLocalStorage.GetValue('pushUserID') <> '' then
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

function TClientMain.ValidUserID: Boolean;
begin
  Result := True;
  if WebEdit1.Text = '' then
  begin
    Result := False;
    ShowMessage('UserID cannot be empty!');
  end;
end;

procedure TClientMain.WebButton1Click(Sender: TObject);
begin
  if ValidUserID then
  begin
    WebPushNotifications1.RegistrationUserID := WebEdit1.Text;
    WebPushNotifications1.RegisterServiceWorker;

    DoAddToLocalStorage;
  end;
end;

procedure TClientMain.WebButton2Click(Sender: TObject);
begin
  if ValidUserID then
  begin
    WebPushNotifications1.RegistrationUserID := WebEdit1.Text;
    WebPushNotifications1.Unsubscribe;

    DoRemoveFromLocalStorage;
  end;
end;

procedure TClientMain.WebEdit1Change(Sender: TObject);
begin
  SetButtonState;
end;

procedure TClientMain.WebFormCreate(Sender: TObject);
begin
  ls := TLocalStorage.Create(Self);
  if ls.Count > 0 then
  begin
    WebEdit1.Text := TLocalStorage.GetValue('pushUserID');
  end;

  SetButtonState;
end;

procedure TClientMain.WebFormExit(Sender: TObject);
begin
  ls.Free;
end;

end.