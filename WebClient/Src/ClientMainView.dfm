object ClientMain: TClientMain
  Width = 640
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
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel3: TWebLabel
    Left = 312
    Top = 33
    Width = 130
    Height = 16
    Caption = 'Push Notification demo'
    ElementID = 'title'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel4: TWebLabel
    Left = 312
    Top = 65
    Width = 184
    Height = 16
    Caption = 'Usage of TWebPushNotifications'
    ElementID = 'description'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebEdit1: TWebEdit
    Left = 57
    Top = 8
    Width = 216
    Height = 19
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnChange = WebEdit1Change
  end
  object WebButton1: TWebButton
    Left = 8
    Top = 33
    Width = 265
    Height = 25
    Caption = 'Subscribe for push notifications'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton1Click
  end
  object WebButton2: TWebButton
    Left = 8
    Top = 64
    Width = 265
    Height = 25
    Caption = 'Unsubscribe from push notifications'
    ChildOrder = 2
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton2Click
  end
  object WebPushNotifications1: TWebPushNotifications
    RegisterSubscriptionURL = 'http://localhost:8081/registerSubscription'
    UnregisterSubscriptionURL = 'http://localhost:8081/unregisterSubscription'
    VapidPublickeyURL = 'http://localhost:8081/vapidPublicKey'
    Left = 168
    Top = 120
  end
end
