object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Push Notifications Delphi - Server'
  ClientHeight = 661
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 661
    Cursor = crHandPoint
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 12
    Padding.Top = 10
    Padding.Right = 12
    Padding.Bottom = 12
    TabOrder = 0
    object lbTitle: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 80
      Width = 510
      Height = 15
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alTop
      Caption = 'Notification title'
      ExplicitLeft = 5
      ExplicitTop = 61
      ExplicitWidth = 86
    end
    object lbBody: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 125
      Width = 510
      Height = 15
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alTop
      Caption = 'Notification body'
      ExplicitLeft = 8
      ExplicitTop = 87
      ExplicitWidth = 93
    end
    object edtTitle: TEdit
      Left = 12
      Top = 97
      Width = 510
      Height = 23
      Align = alTop
      TabOrder = 1
      Text = 'Notification title with Delphi'
    end
    object mmBody: TMemo
      Left = 12
      Top = 142
      Width = 510
      Height = 51
      Align = alTop
      Lines.Strings = (
        'Push notification test created with Delphi using TMS FNC.'
        'Click to see more details')
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object ckAddUrlToClick: TCheckBox
      AlignWithMargins = True
      Left = 12
      Top = 198
      Width = 510
      Height = 17
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alTop
      Caption = 'Add URL to click'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object edtUrlToClick: TEdit
      Left = 12
      Top = 217
      Width = 510
      Height = 23
      Align = alTop
      TabOrder = 4
      Text = 'https://www.tmssoftware.com/site/tmsfncpushnotifications.asp'
    end
    object btnStart: TBitBtn
      Left = 12
      Top = 10
      Width = 510
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Right = 5
      Align = alTop
      Caption = 'Start push server'
      Glyph.Data = {
        3A030000424D3A030000000000003A0200002800000010000000100000000100
        08000000000000010000120B0000120B0000810000008100000000000000FFFF
        FF00FF00FF00FEFCFC00DCD9D800752E11007D32130065280F00893615007B31
        1300762F12006628100065281000692A11006B2D12007B34160099411500FEFC
        FB00A6420C009844100099461100984411009A4713009745130095461600BD58
        0B00BD580C00BD590C00BC580C00BB570C00BF5A0D00B8570F00FEF0E500FEF3
        EA00E97F1E00F3A96600FEF4EB005A350F00FED9B400FEDEBD00FEEFE000FEF0
        E200FEF6EE00FEF7F000FEF8F200FEFBF800FEFCFA00FED8B000FEDCB700FEDD
        BA00FEE0BF00FEE1C100FEE2C500FEE3C600FEE3C700FEE5CA00FEE6CB00FEE7
        CF00FEEAD400FEEBD700FEEEDC00FEEEDD00DCCFC100FEF0E100FEF2E500FEF4
        E900FEE9D100FEEDD900FEF3E600FEF7EF00DCD7D100DCD4CA00FEFBF700FEFA
        F400B2D49E00A4CE9100009C0400009E0700009707000198080003AA0C000267
        0600013C030003890A00026607000265060002640600026307000262060003A6
        0C00039A0C0005AA110005870F00046B0B0023B02D0047BF5000098E140034B6
        3F0005A11800116C1C0007AB1D00099D1C002992370083D88E000C82200023A5
        380027A93D000FA92D0007A5270011AF330018A9380046C162000EAB37000DAB
        3B0018B548000DAB40002CBA5A0077D0930084D79E0025B85B0041C573004DC7
        7B0050C97E008FDDAC0052CB820078D79E003553C700FEFEFE00DCDCDC000202
        02020202020202565252525802020202020202020202515C4F4E535752020806
        0909090909636B64675E4C5954550D293B3833302F60726C01015F4D5A510C2A
        20433934316077710101016150510B4845443C4236607C7301016F625B510B7F
        2D2C21283A6975797B74706D655D077F7F1149243F4B60767D7A786E6802077F
        7F7F03482A404A6A6060606625020B7F7F7F7F7F482B443D423527260A02077F
        7F7F7F7F7F2E2C41283A373205020E8080808080808080800446473E0F021014
        1313131313131516141617180A02102222222222222222222323227E1202021C
        1A1A1A1A1A1A1B1E191E1D1F020202020202020202020202020202020202}
      TabOrder = 0
      OnClick = btnStartClick
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 496
      Width = 510
      Height = 153
      Align = alBottom
      Caption = ' Log '
      TabOrder = 5
      object mmLog: TMemo
        Left = 2
        Top = 17
        Width = 506
        Height = 134
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object btnStop: TBitBtn
      Left = 12
      Top = 35
      Width = 510
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Right = 5
      Align = alTop
      Caption = 'Stop push server'
      Glyph.Data = {
        32030000424D3203000000000000320200002800000010000000100000000100
        08000000000000010000120B0000120B00007F0000007F00000000000000FFFF
        FF001F187500B6A9C400C1B5C900FF00FF00FEFCFC0065281C00DCD9D800752E
        11007D32130065280F00893615007B311300762F12006628100065281000692A
        11006B2D12007B34160099411500FEFCFB00A6420C0098441000994611009844
        11009A4713009745130095461600BD580B00BD580C00BD590C00BC580C00BB57
        0C00BF5A0D00B8570F00FEF0E500FEF3EA00E97F1E00F3A96600FEF4EB00FED9
        B400FEDEBD00FEEFE000FEF0E200FEF6EE00FEF7F000FEF8F200FEFBF800FEFC
        FA00FED8B000FEDCB700FEDDBA00FEE0BF00FEE1C100FEE2C500FEE3C600FEE3
        C700FEE5CA00FEE6CB00FEE7CF00FEEAD400FEEBD700FEEEDC00FEEEDD00DCCF
        C100FEF0E100FEF2E500FEF4E900FEE9D100FEEDD900FEF3E600FEF7EF00DCD7
        D100DCD4CA00FEFBF700FEFAF400FFFFFE007B99FF008BA4FF003553C7005E7F
        FF000220B4002147FF002349FF003559FF000121E2000222E100021FBB00021C
        B600021FB400021EB2000320BC00031FB2000420B4001C40FC000120F4000119
        C0000222F300021ECA000218AB000323FE000321DE000525E900001CFA000018
        E7000017C6000012B0000013AC000114A5000110A0000012FA000012F600010D
        A700010F9F00010C99000714BA00010B9E00010B9900010B980001076400030C
        9E002731B8002D33AC003F48C100FEFEFE00DCDCDC0005050505050505050576
        787878730505050505050505050571585B5B5B5B78050C0A0D0D0D0D0D025663
        5C5E5D5B6477112C3E3B3633327460660101016C5A6E102D24463C3734746562
        4D01016B526D0F4B48473F45397454680101016A59720F7D302F252B3D7C4E5F
        6F70695761750B7D7D154C284203744F5155536779050B7D7D7D064B2D43047A
        7474747B07050F7D7D7D7D7D4B2E474045382A290E050B7D7D7D7D7D7D312F44
        2B3D3A350905127E7E7E7E7E7E7E7E7E08494A4113051418171717171717191A
        181A1B1C0E051426262626262626262627272650160505201E1E1E1E1E1E1F22
        1D222123050505050505050505050505050505050505}
      TabOrder = 6
      OnClick = btnStopClick
    end
    object ckAddIconURL: TCheckBox
      AlignWithMargins = True
      Left = 12
      Top = 245
      Width = 510
      Height = 17
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alTop
      Caption = 'Add icon URL'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object edtIconURL: TEdit
      Left = 12
      Top = 264
      Width = 510
      Height = 23
      Align = alTop
      TabOrder = 8
      Text = 'https://code4delphi.com.br/img/Code4D-150X150.png'
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 12
      Top = 294
      Width = 510
      Height = 136
      Margins.Left = 0
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = ' UserID registered '
      Padding.Left = 2
      Padding.Right = 2
      Padding.Bottom = 2
      TabOrder = 9
      object ListBox1: TListBox
        Left = 4
        Top = 17
        Width = 502
        Height = 86
        Align = alClient
        Columns = 3
        ItemHeight = 15
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 13
      end
      object Panel2: TPanel
        Left = 4
        Top = 103
        Width = 502
        Height = 29
        Align = alBottom
        BevelOuter = bvNone
        Padding.Top = 2
        Padding.Bottom = 2
        TabOrder = 1
        object btnSendToSelectedUserId: TBitBtn
          Left = 0
          Top = 2
          Width = 105
          Height = 25
          Align = alLeft
          Caption = 'Send to selected'
          TabOrder = 0
          OnClick = btnSendToSelectedUserIdClick
        end
        object BitBtn1: TBitBtn
          Left = 105
          Top = 2
          Width = 144
          Height = 25
          Align = alLeft
          Caption = 'Disable send to selected'
          TabOrder = 1
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 249
          Top = 2
          Width = 144
          Height = 25
          Align = alLeft
          Caption = 'Enable send to selected'
          TabOrder = 2
          OnClick = BitBtn2Click
        end
      end
    end
    object btnSendToAll: TBitBtn
      AlignWithMargins = True
      Left = 12
      Top = 440
      Width = 510
      Height = 25
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Send to all'
      TabOrder = 10
      OnClick = btnSendToAllClick
    end
  end
  object TMSFNCWebPushSender1: TTMSFNCWebPushSender
    PushDB = TMSFNCWebPushDB1
    OnNotificationSent = TMSFNCWebPushSender1NotificationSent
    OnNotificationError = TMSFNCWebPushSender1NotificationError
    Left = 104
    Top = 512
  end
  object TMSFNCWebPushDB1: TTMSFNCWebPushDB
    Left = 264
    Top = 512
  end
  object TMSFNCWebPushServer1: TTMSFNCWebPushServer
    PushDB = TMSFNCWebPushDB1
    Active = False
    OnHTTPRequest = TMSFNCWebPushServer1HTTPRequest
    OnRegisterSubscription = TMSFNCWebPushServer1RegisterSubscription
    OnUnregisterSubscription = TMSFNCWebPushServer1UnregisterSubscription
    Left = 424
    Top = 512
  end
end
