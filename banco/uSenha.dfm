object FrSenha: TFrSenha
  Left = 530
  Top = 204
  Width = 488
  Height = 359
  Caption = 'Sistema banc'#225'rio'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 472
    Height = 33
    Align = alTop
    Alignment = taCenter
    Caption = 'ACESSO AO SISTEMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 472
    Height = 41
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 472
    Height = 280
    Color = clMoneyGreen
    TabOrder = 0
    object Label2: TLabel
      Left = 46
      Top = 64
      Width = 67
      Height = 25
      Caption = 'LOGIN:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 39
      Top = 136
      Width = 75
      Height = 25
      Caption = 'SENHA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtLogin: TEdit
      Left = 120
      Top = 64
      Width = 289
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 120
      Top = 136
      Width = 289
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = edtSenhaKeyPress
    end
    object btnEntra: TButton
      Left = 120
      Top = 192
      Width = 75
      Height = 33
      Caption = 'ENTRAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnEntraClick
    end
    object Button2: TButton
      Left = 256
      Top = 192
      Width = 75
      Height = 33
      Caption = 'CANCELAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
end
