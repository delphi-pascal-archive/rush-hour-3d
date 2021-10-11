object InfoForm: TInfoForm
  Left = 512
  Top = 238
  BorderStyle = bsDialog
  Caption = 'Credits'
  ClientHeight = 216
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 413
    Height = 174
    Align = alClient
    Color = clScrollBar
    Enabled = False
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 174
    Width = 413
    Height = 42
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 152
      Top = 10
      Width = 105
      Height = 23
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
  end
end
