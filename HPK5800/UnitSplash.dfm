object FrmSplash: TFrmSplash
  Left = 636
  Top = 328
  BorderStyle = bsNone
  Caption = 'FrmSplash'
  ClientHeight = 156
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LbSplash: TLabel
    Left = 208
    Top = 32
    Width = 337
    Height = 19
    AutoSize = False
    Caption = 'TSC2016'#21021#22987#21270#20013#65292#35831#32784#24515#31561#24453#12290#12290#12290
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LbIniInfo: TLabel
    Left = 24
    Top = 80
    Width = 63
    Height = 14
    Caption = 'LbIniInfo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object RzProgressBar1: TRzProgressBar
    Left = 24
    Top = 104
    Width = 809
    Height = 19
    BorderWidth = 0
    InteriorOffset = 0
    PartsComplete = 0
    Percent = 0
    ShowPercent = False
    TotalParts = 0
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 464
    Top = 16
  end
end
