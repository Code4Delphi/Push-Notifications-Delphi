object MainView: TMainView
  Width = 322
  Height = 432
  Caption = 'Push Notifications Delphi - TMS FNC'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormContainer = 'appcontent'
  ParentFont = False
  OnCreate = WebFormCreate
  OnExit = WebFormExit
  object WebLabel1: TWebLabel
    Left = 24
    Top = 27
    Width = 43
    Height = 16
    Caption = 'UserID:'
    ElementID = 'lbUserID'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object edtUserID: TWebEdit
    Left = 73
    Top = 24
    Width = 216
    Height = 19
    ElementID = 'edtUserID'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnChange = edtUserIDChange
  end
  object btnWebSubscribe: TWebButton
    Left = 24
    Top = 49
    Width = 265
    Height = 25
    Caption = 'Subscribe for push notifications'
    ChildOrder = 1
    ElementID = 'btnSubscribe'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnWebSubscribeClick
  end
  object btnWebUnsubscribe: TWebButton
    Left = 24
    Top = 80
    Width = 265
    Height = 25
    Caption = 'Unsubscribe from push notifications'
    ChildOrder = 2
    ElementID = 'btnUnsubscribe'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnWebUnsubscribeClick
  end
  object WebPushNotifications1: TWebPushNotifications
    RegisterSubscriptionURL = 'http://localhost:8081/registerSubscription'
    UnregisterSubscriptionURL = 'http://localhost:8081/unregisterSubscription'
    VapidPublickeyURL = 'http://localhost:8081/vapidPublicKey'
    Left = 184
    Top = 136
  end
end
