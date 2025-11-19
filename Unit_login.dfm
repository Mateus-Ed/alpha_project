object Form_login: TForm_login
  Left = 448
  Top = 231
  Width = 306
  Height = 342
  BorderIcons = [biSystemMenu]
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 204
    Height = 34
    Caption = 'Entre na sua conta'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Impact'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 64
    Width = 54
    Height = 22
    Caption = 'Usu'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Palatino Linotype'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 120
    Width = 42
    Height = 22
    Caption = 'Senha'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Palatino Linotype'
    Font.Style = []
    ParentFont = False
  end
  object but_entrar: TButton
    Left = 88
    Top = 208
    Width = 105
    Height = 33
    Caption = 'Entrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = but_entrarClick
  end
  object but_cadastrar: TButton
    Left = 88
    Top = 256
    Width = 105
    Height = 33
    Caption = 'Cadastrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = but_cadastrarClick
  end
  object edt_usuario: TEdit
    Left = 56
    Top = 88
    Width = 169
    Height = 21
    MaxLength = 30
    TabOrder = 2
  end
  object edt_senha: TEdit
    Left = 56
    Top = 144
    Width = 161
    Height = 21
    MaxLength = 30
    PasswordChar = '#'
    TabOrder = 3
  end
  object CB_senha: TCheckBox
    Left = 56
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Mostrar senha'
    TabOrder = 4
    OnClick = CB_senhaClick
  end
  object ConexaoBD: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=alpha_access;Initial Catalog=Projeto_Alpha;Data Source=DESKT' +
      'OP-4DR45IS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 200
  end
  object ADOQuery_aux: TADOQuery
    Connection = ConexaoBD
    Parameters = <>
    Left = 24
    Top = 240
  end
end
