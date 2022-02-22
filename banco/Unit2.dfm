object Form1: TForm1
  OldCreateOrder = False
  Left = 532
  Top = 226
  Height = 449
  Width = 660
  object ADOBanco: TADOConnection
    Connected = True
    ConnectionString = 'FILE NAME=C:\Users\HSVP\Desktop\banco\teste.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 27
    Top = 4
  end
  object ADOCadastro: TADOQuery
    Active = True
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Cadastro'
      '')
    Left = 104
    Top = 4
    object ADOCadastroID_Cadastro: TAutoIncField
      FieldName = 'ID_Cadastro'
    end
    object ADOCadastroNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ADOCadastroRua: TStringField
      FieldName = 'Rua'
      Size = 50
    end
    object ADOCadastroBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object ADOCadastroCep: TStringField
      FieldName = 'Cep'
      Size = 50
    end
    object ADOCadastroNumero: TIntegerField
      FieldName = 'Numero'
    end
    object ADOCadastroCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object ADOCadastroRG: TStringField
      FieldName = 'RG'
      Size = 11
    end
    object ADOCadastroCPF: TStringField
      FieldName = 'CPF'
      Size = 16
    end
    object ADOCadastroDTNascimento: TStringField
      FieldName = 'DTNascimento'
      Size = 50
    end
    object ADOCadastroUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object ADOCadastroTelefone: TStringField
      FieldName = 'Telefone'
      Size = 50
    end
    object ADOCadastrocelular: TStringField
      FieldName = 'celular'
      Size = 50
    end
    object ADOCadastroemail: TStringField
      FieldName = 'email'
      Size = 50
    end
  end
  object ADOTeste: TADOQuery
    Active = True
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Conta.id_conta, Cadastro.nome, Mov.Agencia, Mov.banco'
      'FROM Cadastro, Conta, Mov '
      'WHERE Conta.ID_Cadastro = Cadastro.ID_Cadastro'
      'and Cadastro.ID_Cadastro = :id')
    Left = 104
    Top = 52
  end
  object ADOConta: TADOQuery
    Active = True
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from conta'
      '')
    Left = 104
    Top = 100
  end
  object ADOMov: TADOQuery
    Active = True
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Mov'
      '')
    Left = 171
    Top = 4
  end
  object ADOPesq: TADOQuery
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.id_cadastro, a.Id_conta, b.banco, b.agencia, b.id_conta'
      'from conta as a'
      'inner join Mov as b'
      'on a.id_conta = b.id_conta')
    Left = 170
    Top = 52
  end
  object ADOExt: TADOQuery
    Active = True
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id_conta, agencia, banco, total'
      'from mov'
      'group by id_conta, agencia, banco, total')
    Left = 224
    Top = 4
  end
  object ADOsis: TADOQuery
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Conta.id_conta, Cadastro.nome, Mov.Agencia, Mov.banco, mo' +
        'v.data, mov.descricao, mov.entrada, mov.saida, mov.total'
      'FROM Cadastro, Conta, Mov '
      'WHERE Conta.ID_Cadastro = Cadastro.ID_Cadastro'
      'and Conta.id_conta = Mov.id_conta')
    Left = 222
    Top = 52
  end
  object adoSenha: TADOQuery
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from usuario')
    Left = 440
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from direito')
    Left = 440
    Top = 72
  end
end
