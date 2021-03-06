object MainForm: TMainForm
  Left = 268
  Top = 310
  Caption = #1057#1074#1086#1076#1082#1072' '#1087#1086#1075#1086#1076#1099
  ClientHeight = 510
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object TablePanel: TPanel
    Left = 264
    Top = 53
    Width = 433
    Height = 449
    Caption = 'TablePanel'
    TabOrder = 0
    object MainTable: TStringGrid
      Left = 16
      Top = 24
      Width = 401
      Height = 377
      DefaultColWidth = 78
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = MainTableEnter
      ColWidths = (
        78
        78
        78
        78
        78)
      RowHeights = (
        24
        24)
    end
    object DeleteButton: TButton
      Left = 275
      Top = 416
      Width = 140
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      TabOrder = 1
      OnClick = DeleteButtonClick
    end
    object EditButton: TButton
      Left = 16
      Top = 416
      Width = 140
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      TabOrder = 2
      OnClick = EditButtonClick
    end
  end
  object InsertPanel: TPanel
    Left = 8
    Top = 53
    Width = 225
    Height = 449
    TabOrder = 1
    object LabelDate: TLabel
      Left = 16
      Top = 29
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object LabelT: TLabel
      Left = 16
      Top = 85
      Width = 85
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072', '#176'C'
    end
    object LabelD: TLabel
      Left = 16
      Top = 141
      Width = 106
      Height = 13
      Caption = #1044#1072#1074#1083#1077#1085#1080#1077', '#1084#1084' '#1088#1090'. '#1089#1090'.'
    end
    object LabelV: TLabel
      Left = 16
      Top = 196
      Width = 73
      Height = 13
      Caption = #1042#1083#1072#1078#1085#1086#1089#1090#1100', %'
    end
    object IncertLabel: TLabel
      Left = 16
      Top = 8
      Width = 184
      Height = 13
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = #1055#1072#1085#1077#1083#1100' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object TimeOfDayRadioGroup: TRadioGroup
      Left = 16
      Top = 256
      Width = 185
      Height = 105
      Caption = #1042#1088#1077#1084#1103' '#1089#1091#1090#1086#1082
      Items.Strings = (
        #1044#1077#1085#1100
        #1053#1086#1095#1100)
      TabOrder = 0
    end
    object EditT: TEdit
      Left = 16
      Top = 104
      Width = 184
      Height = 21
      TabOrder = 1
    end
    object EditD: TEdit
      Left = 16
      Top = 160
      Width = 185
      Height = 21
      TabOrder = 2
    end
    object EditV: TEdit
      Left = 16
      Top = 215
      Width = 184
      Height = 21
      TabOrder = 3
    end
    object AddButton: TButton
      Left = 16
      Top = 416
      Width = 140
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      TabOrder = 4
      OnClick = AddButtonClick
    end
    object EditDate: TMaskEdit
      Left = 16
      Top = 48
      Width = 184
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 5
      Text = '  .  .    '
    end
  end
  object ActionPanel: TPanel
    Left = 8
    Top = 8
    Width = 689
    Height = 39
    TabOrder = 2
    object SaveButton: TButton
      Left = 9
      Top = 8
      Width = 140
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      TabOrder = 0
      OnClick = SaveButtonClick
    end
    object LoadButton: TButton
      Left = 167
      Top = 8
      Width = 140
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      TabOrder = 1
      OnClick = LoadButtonClick
    end
    object StatButton: TButton
      Left = 522
      Top = 8
      Width = 151
      Height = 25
      Caption = #1057#1074#1086#1076#1082#1072' '#1087#1086#1075#1086#1076#1099' '#1080' '#1075#1088#1072#1092#1080#1082#1080
      TabOrder = 2
      OnClick = StatButtonClick
    end
  end
end
