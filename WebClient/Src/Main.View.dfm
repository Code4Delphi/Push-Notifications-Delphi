object MainView: TMainView
  Width = 433
  Height = 480
  OnCreate = WebFormCreate
  OnExit = WebFormExit
  object pnFormulario: TWebPanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 423
    Height = 177
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ElementID = 'divFormulario'
    Align = alTop
    ChildOrder = 3
    TabOrder = 0
    object lbNome: TWebLabel
      Left = 0
      Top = 0
      Width = 423
      Height = 15
      Align = alTop
      Caption = 'UserID'
      ElementID = 'edtUserID'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      ExplicitWidth = 34
    end
    object edtUserID: TWebEdit
      AlignWithMargins = True
      Left = 0
      Top = 15
      Width = 423
      Height = 22
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      ChildOrder = 1
      ElementID = 'edtUserID'
      HeightPercent = 100.000000000000000000
      TextHint = 'Enter Userid'
      WidthPercent = 100.000000000000000000
      OnChange = edtUserIDChange
    end
    object pnBotoes: TWebPanel
      Left = 0
      Top = 42
      Width = 423
      Height = 48
      ElementID = 'divBotoes'
      Align = alTop
      BorderStyle = bsNone
      ChildOrder = 5
      TabOrder = 1
      object btnSubscribe: TWebButton
        Left = 0
        Top = 0
        Width = 210
        Height = 48
        Align = alLeft
        Caption = 'Subscribe for push notifications'
        ChildOrder = 1
        ElementID = 'btnSubscribe'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnSubscribeClick
        ExplicitTop = 3
      end
      object btnUnsubscribe: TWebButton
        Left = 210
        Top = 0
        Width = 210
        Height = 48
        Align = alLeft
        Caption = 'Unsubscribe from push notifications'
        ChildOrder = 1
        ElementID = 'btnUnsubscribe'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnUnsubscribeClick
      end
    end
  end
  object WebPushNotifications1: TWebPushNotifications
    RegisterSubscriptionURL = 'http://localhost:8081/registerSubscription'
    UnregisterSubscriptionURL = 'http://localhost:8081/unregisterSubscription'
    VapidPublickeyURL = 'http://localhost:8081/vapidPublicKey'
    Left = 168
    Top = 120
  end
end
