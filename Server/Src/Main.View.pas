unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  TMS.TMSFNCWebPushSender,
  TMS.TMSFNCWebPushServer,
  TMS.TMSFNCWebPushDB,
  TMS.TMSFNCWebPushCommon,
  IdContext,
  IdCustomHTTPServer,
  System.JSON;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    lbTitle: TLabel;
    edtTitle: TEdit;
    lbBody: TLabel;
    mmBody: TMemo;
    ckAddUrlToClick: TCheckBox;
    edtUrlToClick: TEdit;
    btnStart: TBitBtn;
    GroupBox1: TGroupBox;
    mmLog: TMemo;
    TMSFNCWebPushSender1: TTMSFNCWebPushSender;
    TMSFNCWebPushDB1: TTMSFNCWebPushDB;
    TMSFNCWebPushServer1: TTMSFNCWebPushServer;
    btnStop: TBitBtn;
    ckAddIconURL: TCheckBox;
    edtIconURL: TEdit;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    Panel2: TPanel;
    btnSendToSelectedUserId: TBitBtn;
    btnSendToAll: TBitBtn;
    btnDeleteUserIDSelected: TBitBtn;
    lbClearLog: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCWebPushSender1NotificationError(Sender: TObject; AResponseCode: Integer; AResponse, AEndpoint,
      APayload, AUserID, ABrowserID: string; var ADelete: Boolean);
    procedure TMSFNCWebPushSender1NotificationSent(Sender: TObject; AResponseCode: Integer; AResponse, AEndpoint,
      APayload, AUserID, ABrowserID: string);
    procedure TMSFNCWebPushServer1HTTPRequest(Sender: TObject; AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo; var AHandled: Boolean);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure TMSFNCWebPushServer1RegisterSubscription(Sender: TObject; AData: TJSONObject; var AHandled: Boolean);
    procedure TMSFNCWebPushServer1UnregisterSubscription(Sender: TObject; AData: TJSONObject; var AHandled: Boolean);
    procedure btnSendToAllClick(Sender: TObject);
    procedure btnSendToSelectedUserIdClick(Sender: TObject);
    procedure btnDeleteUserIDSelectedClick(Sender: TObject);
    procedure lbClearLogClick(Sender: TObject);
  private
    procedure ConfScreen;
    function GetPortsText: string;
    function GetUrlToClick: string;
    function GetIconURL: string;
    function GetUserIDSelected: string;
    procedure DeleteUserIdList(const AUserID: string);
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

  //AO NAO E OBRIGATORIO, MAS O FIREFOX E O SAFARI NAO ACEITARAO SE NAO ESTIVEREM PRESENTES
  TMSFNCWebPushSender1.Claims.Subject := 'mailto:admin@example.com';

  TMSFNCWebPushServer1.DefaultHTTPPort := 8081;
  TMSFNCWebPushServer1.DefaultHTTPSPort := 8443;

  Self.ConfScreen;
end;

procedure TMainForm.btnStartClick(Sender: TObject);
begin
  TMSFNCWebPushServer1.Active := True;

  mmLog.Lines.Add('# START PUSH SERVER. ' + Self.GetPortsText);
  Self.ConfScreen;
end;

procedure TMainForm.btnStopClick(Sender: TObject);
begin
  TMSFNCWebPushServer1.Active := False;

  mmLog.Lines.Add('# STOP PUSH SERVER.' + Self.GetPortsText);
  Self.ConfScreen;
end;

procedure TMainForm.ConfScreen;
begin
  btnStart.Enabled := not TMSFNCWebPushServer1.Active;
  btnStop.Enabled := not btnStart.Enabled;
end;

procedure TMainForm.lbClearLogClick(Sender: TObject);
begin
  mmLog.Lines.Clear;
end;

procedure TMainForm.TMSFNCWebPushSender1NotificationError(Sender: TObject; AResponseCode: Integer; AResponse, AEndpoint,
  APayload, AUserID, ABrowserID: string; var ADelete: Boolean);
begin
  mmLog.Lines.Add('Error sending notification to ' + AUserID + ' (' + AResponseCode.ToString + '): ' + AResponse);
end;

procedure TMainForm.TMSFNCWebPushSender1NotificationSent(Sender: TObject; AResponseCode: Integer; AResponse, AEndpoint,
  APayload, AUserID, ABrowserID: string);
begin
  mmLog.Lines.Add('Sent to ' + AUserID);
end;

procedure TMainForm.TMSFNCWebPushServer1HTTPRequest(Sender: TObject; AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo; var AHandled: Boolean);
begin
  //mmLog.Lines.Add('Got request from: ' + ARequestInfo.URI);
end;

procedure TMainForm.TMSFNCWebPushServer1RegisterSubscription(Sender: TObject; AData: TJSONObject;
  var AHandled: Boolean);
begin
  var LUserID := AData.GetValue<string>('userID');
  mmLog.Lines.Add('Register Subscription: ' + LUserID);
  ListBox1.Items.Add(LUserID);
end;

procedure TMainForm.TMSFNCWebPushServer1UnregisterSubscription(Sender: TObject; AData: TJSONObject;
  var AHandled: Boolean);
begin
  var LUserID := AData.GetValue<string>('userID');
  mmLog.Lines.Add('Unregister Subscription: ' + LUserID);
  Self.DeleteUserIdList(LUserID);
end;

procedure TMainForm.DeleteUserIdList(const AUserID: string);
begin
  ListBox1.Items.Delete(ListBox1.Items.IndexOf(AUserID));
end;

function TMainForm.GetPortsText: string;
begin
  Result := Format('HTTP PORT: %d - HTTPS PORT: %d', [TMSFNCWebPushServer1.DefaultHTTPPort, TMSFNCWebPushServer1.DefaultHTTPSPort]);
end;

function TMainForm.GetUrlToClick: string;
begin
  Result := '';
  if ckAddUrlToClick.Checked then
    Result := edtUrlToClick.Text;
end;

function TMainForm.GetIconURL: string;
begin
  Result := '';
  if ckAddIconURL.Checked then
    Result := edtIconURL.Text;
end;

function TMainForm.GetUserIDSelected: string;
begin
  if ListBox1.ItemIndex < 0 then
    raise Exception.Create('No items selected');

  Result := ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TMainForm.btnDeleteUserIDSelectedClick(Sender: TObject);
var
  LUserID: string;
  LSubscription: TTMSFNCWebPushSubscription;
begin
  LUserID := Self.GetUserIDSelected;
  TMSFNCWebPushDB1.DeleteSubscription(LUserID);

  if not TMSFNCWebPushDB1.TryFindSubscriptionByID(LUserID, LSubscription) then
    Self.DeleteUserIdList(LUserID);
end;

procedure TMainForm.btnSendToAllClick(Sender: TObject);
begin
  TMSFNCWebPushSender1.SendNotificationAll(edtTitle.Text, mmBody.Lines.Text, Self.GetIconURL, Self.GetUrlToClick);
end;

procedure TMainForm.btnSendToSelectedUserIdClick(Sender: TObject);
begin
  var LUserID := Self.GetUserIDSelected;
  var LTitle := LUserID + ' - ' + edtTitle.Text;
  TMSFNCWebPushSender1.SendNotificationById(LUserID, LTitle, mmBody.Lines.Text, Self.GetIconURL, Self.GetUrlToClick);
end;

end.
