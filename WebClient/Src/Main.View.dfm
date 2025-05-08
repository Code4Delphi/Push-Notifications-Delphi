object MainView: TMainView
  Width = 315
  Height = 480
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
    Left = 8
    Top = 11
    Width = 43
    Height = 16
    Caption = 'UserID:'
    ElementID = 'lbUserID'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object edtUserID: TWebEdit
    Left = 57
    Top = 8
    Width = 216
    Height = 19
    ElementID = 'edtUserID'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnChange = edtUserIDChange
  end
  object btnSubscribe: TWebButton
    Left = 8
    Top = 33
    Width = 265
    Height = 25
    Caption = 'Subscribe for push notifications'
    ChildOrder = 1
    ElementID = 'btnSubscribe'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnSubscribeClick
  end
  object btnUnsubscribe: TWebButton
    Left = 8
    Top = 64
    Width = 265
    Height = 25
    Caption = 'Unsubscribe from push notifications'
    ChildOrder = 2
    ElementID = 'btnUnsubscribe'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnUnsubscribeClick
  end
  object WebPushNotifications1: TWebPushNotifications
    RegisterSubscriptionURL = 'http://localhost:8081/registerSubscription'
    UnregisterSubscriptionURL = 'http://localhost:8081/unregisterSubscription'
    VapidPublickeyURL = 'http://localhost:8081/vapidPublicKey'
    Left = 168
    Top = 120
  end
end
