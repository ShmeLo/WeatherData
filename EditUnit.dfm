object EditForm: TEditForm
  Left = 0
  Top = 0
  Caption = #1054#1082#1085#1086' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 165
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EditPanel: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 168
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 0
    object EditLabelDate: TLabel
      Left = 21
      Top = 45
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object EditLabelT: TLabel
      Left = 134
      Top = 45
      Width = 66
      Height = 13
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
    end
    object EditLabelD: TLabel
      Left = 247
      Top = 45
      Width = 50
      Height = 13
      Caption = #1044#1072#1074#1083#1077#1085#1080#1077
    end
    object EditLabelV: TLabel
      Left = 360
      Top = 45
      Width = 55
      Height = 13
      Caption = #1042#1083#1072#1078#1085#1086#1089#1090#1100
    end
    object EditLabel: TLabel
      Left = 151
      Top = 10
      Width = 235
      Height = 13
      Caption = #1054#1090#1088#1077#1076#1072#1082#1090#1080#1088#1091#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditTimeOfDayRadioGroup: TRadioGroup
      Left = 473
      Top = 47
      Width = 89
      Height = 97
      Caption = #1042#1088#1077#1084#1103' '#1089#1091#1090#1086#1082
      Items.Strings = (
        #1044#1077#1085#1100
        #1053#1086#1095#1100)
      TabOrder = 0
    end
    object EditEditT: TEdit
      Left = 134
      Top = 64
      Width = 85
      Height = 21
      TabOrder = 1
    end
    object EditEditD: TEdit
      Left = 247
      Top = 64
      Width = 85
      Height = 21
      TabOrder = 2
    end
    object EditEditV: TEdit
      Left = 360
      Top = 64
      Width = 85
      Height = 21
      TabOrder = 3
    end
    object EditOkButton: TButton
      Left = 21
      Top = 119
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 4
      OnClick = EditOkButtonClick
    end
    object EditCancelButton: TButton
      Left = 134
      Top = 119
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 5
      OnClick = EditCancelButtonClick
    end
    object EditEditDate: TMaskEdit
      Left = 21
      Top = 64
      Width = 85
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 6
      Text = '  .  .    '
    end
  end
end
