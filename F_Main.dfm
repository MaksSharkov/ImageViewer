object Form1: TForm1
  Left = 292
  Top = 170
  ActiveControl = scrlbx1
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Image Viever  v0.5'
  ClientHeight = 566
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object scrlbx1: TScrollBox
    Left = 5
    Top = 8
    Width = 880
    Height = 480
    DockSite = True
    TabOrder = 0
    object img1: TImage
      Left = -3
      Top = -3
      Width = 879
      Height = 479
      Center = True
      Proportional = True
      Transparent = True
      OnClick = img1Click
    end
  end
  object mmo1: TMemo
    Left = 296
    Top = 488
    Width = 241
    Height = 73
    ReadOnly = True
    TabOrder = 1
    Visible = False
    WordWrap = False
  end
  object SaveFile: TSaveDialog
    DefaultExt = #39'jpg'#39
    Filter = 'JPG|*.jpg|JPEG|*.jpeg|BMP|*.bmp|ICO|*.ico'
    InitialDir = 'C:\users\%USERNAME%\desktop'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1092#1072#1081#1083#1072
    Left = 848
    Top = 8
  end
  object OpenFile: TOpenDialog
    FileName = 'D:\YaDisk\'#1060#1086#1090#1086'\'#1048#1088#1080#1085#1082#1072'\rBpe3__krSs.jpg'
    Filter = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103'|*.jpg;*.jpeg;*.bmp'
    InitialDir = 'C:\users\%USERNAME%\desktop'
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083
    Left = 800
    Top = 8
  end
  object mm1: TMainMenu
    Left = 752
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        ShortCut = 16463
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1080#1079#1086#1073#1088#1086#1072#1078#1077#1085#1080#1077
        ShortCut = 16451
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        ShortCut = 16467
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        ShortCut = 113
        OnClick = N5Click
      end
    end
    object N11: TMenuItem
      Caption = #1057#1083#1072#1076#1081#1096#1086#1091
      object N9: TMenuItem
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1089#1083#1072#1081#1076#1096#1086#1091
        ShortCut = 122
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1080#1090#1100'/'#1087#1088#1086#1076#1086#1083#1078#1080#1090#1100' '#1089#1083#1072#1081#1076#1096#1086#1091
        ShortCut = 16464
        OnClick = N10Click
      end
      object N12: TMenuItem
        Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1089#1083#1072#1081#1076#1096#1086#1091
        ShortCut = 16465
        OnClick = N12Click
      end
    end
    object N7: TMenuItem
      Caption = #1054#1087#1094#1080#1080
      object N6: TMenuItem
        Caption = #1074#1082#1083'/'#1074#1099#1082#1083' '#1087#1086#1083#1085#1086#1101#1082#1088#1072#1085#1085#1099#1081' '#1088#1077#1078#1080#1084
        ShortCut = 123
        OnClick = N6Click
      end
      object N8: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1082#1088#1099#1090#1086#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        ShortCut = 46
        OnClick = N8Click
      end
    end
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmr1Timer
    Left = 701
    Top = 8
  end
end
