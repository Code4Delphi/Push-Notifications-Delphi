unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.StdCtrls, WEBLib.Forms, WEBLib.Dialogs, WEBLib.PushNotifications,
  WEBLib.Storage, Vcl.StdCtrls, Vcl.Controls;

type
  TForm2 = class(TWebForm)
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
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.DoAddToLocalStorage;
begin
  TWebLocalStorage.SetValue('pushUserID', WebEdit1.Text);
  SetButtonState;
end;

procedure TForm2.DoRemoveFromLocalStorage;
begin
  TWebLocalStorage.RemoveKey('pushUserID');
  SetButtonState;
end;

procedure TForm2.SetButtonState;
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

function TForm2.ValidUserID: Boolean;
begin
  Result := True;
  if WebEdit1.Text = '' then
  begin
    Result := False;
    ShowMessage('UserID cannot be empty!');
  end;
end;

procedure TForm2.WebButton1Click(Sender: TObject);
begin
  if ValidUserID then
  begin
    WebPushNotifications1.RegistrationUserID := WebEdit1.Text;
    WebPushNotifications1.RegisterServiceWorker;

    DoAddToLocalStorage;
  end;
end;

procedure TForm2.WebButton2Click(Sender: TObject);
begin
  if ValidUserID then
  begin
    WebPushNotifications1.RegistrationUserID := WebEdit1.Text;
    WebPushNotifications1.Unsubscribe;

    DoRemoveFromLocalStorage;
  end;
end;

procedure TForm2.WebEdit1Change(Sender: TObject);
begin
  SetButtonState;
end;

procedure TForm2.WebFormCreate(Sender: TObject);
begin
  ls := TLocalStorage.Create(Self);
  if ls.Count > 0 then
  begin
    WebEdit1.Text := TLocalStorage.GetValue('pushUserID');
  end;

  SetButtonState;
end;

procedure TForm2.WebFormExit(Sender: TObject);
begin
  ls.Free;
end;

end.