object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'GWS_idf'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object SingleESRImvGrid: TSingleESRIgrid
    Left = 80
    Top = 64
  end
  object HeadsIDF: TSingleESRIgrid
    Left = 80
    Top = 120
  end
end
