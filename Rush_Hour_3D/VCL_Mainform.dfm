object MainForm: TMainForm
  Left = 240
  Top = 128
  Width = 606
  Height = 442
  Caption = 'Rush Hour 3D'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000001000
    0111110000111100111111100111111111111111111101111111111111100111
    1999999911100000999999999000000099999999900000000999999900000000
    099999990000000000999990000000000099999000000000000000000000FFFF
    0000FFFF0000CFE7000087C30000000000000000000000000000800100008001
    0000F0070000F0070000F80F0000F80F0000FC1F0000FC1F0000FFFF0000}
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 430
    Top = 0
    Width = 168
    Height = 394
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 207
      Width = 59
      Height = 16
      Caption = 'Position X'
    end
    object Label2: TLabel
      Left = 10
      Top = 266
      Width = 59
      Height = 16
      Caption = 'Position Z'
    end
    object ListBox1: TListBox
      Left = 1
      Top = 1
      Width = 166
      Height = 120
      Align = alTop
      ItemHeight = 16
      Items.Strings = (
        'Plateau'
        'Mur Nord'
        'Mur Sud'
        'Mur Ouest'
        'Mur Nord Est'
        'Mur Sud Est'
        'Player'
        'Truck 1'
        'Truck 2'
        'Truck 3'
        'Truck 4'
        'Car 1'
        'Car 2'
        'Car 3'
        'Car 4'
        'Car 5'
        'Car 6'
        'Car 7'
        'Car 8'
        'Car 9'
        'Car 10'
        'Car 11'
        'Car 12'
        ''
        ''
        '')
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 128
      Width = 119
      Height = 21
      Caption = 'Visible'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 10
      Top = 148
      Width = 119
      Height = 21
      Caption = 'Pivoter'
      TabOrder = 2
      OnClick = CheckBox2Click
    end
    object TrackBar1: TTrackBar
      Left = 10
      Top = 226
      Width = 149
      Height = 31
      Max = 7
      Min = -7
      TabOrder = 3
      OnChange = TrackBar1Change
    end
    object TrackBar2: TTrackBar
      Left = 10
      Top = 286
      Width = 149
      Height = 30
      Max = 7
      Min = -7
      TabOrder = 4
      OnChange = TrackBar2Change
    end
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Load1: TMenuItem
        Caption = 'Open ...'
        ShortCut = 16463
        OnClick = Load1Click
      end
      object Quit1: TMenuItem
        Caption = 'Exit'
        ShortCut = 16465
        OnClick = Quit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Editor'
      object On1: TMenuItem
        Caption = 'Show'
        ShortCut = 16461
        OnClick = On1Click
      end
      object Off1: TMenuItem
        Caption = 'Hide'
        ShortCut = 16451
        OnClick = Off1Click
      end
      object Save1: TMenuItem
        Caption = 'Save as...'
        ShortCut = 16467
        OnClick = Save1Click
      end
    end
    object Infos1: TMenuItem
      Caption = 'Info'
      object Credits1: TMenuItem
        Caption = 'Credits'
        OnClick = Credits1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 72
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 104
    Top = 8
  end
  object ColorDialog1: TColorDialog
    Left = 136
    Top = 8
  end
end
