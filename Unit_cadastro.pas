unit Unit_cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, DB, ADODB;

type
  TForm_cadastro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edt_nome: TEdit;
    Label3: TLabel;
    Mask_CPF: TMaskEdit;
    edt_usuario: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edt_senha: TEdit;
    but_cadastro: TButton;
    but_cancelar: TButton;
    CB_senha: TCheckBox;
    DateNasc: TDateTimePicker;
    Label6: TLabel;
    ADOQuery_aux: TADOQuery;
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure CB_senhaClick(Sender: TObject);
    procedure but_cancelarClick(Sender: TObject);
    procedure but_cadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cadastro: TForm_cadastro;

implementation

uses Unit_login;

{$R *.dfm}

procedure TForm_cadastro.edt_nomeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['a'..'z', 'A'..'Z', #8, #32]) then
    Key := #0;
end;

procedure TForm_cadastro.CB_senhaClick(Sender: TObject);
begin
  if (CB_senha.Checked = True) then
    edt_senha.PasswordChar := #0
  else if (CB_senha.Checked = False) then
    edt_senha.PasswordChar := '#';
end;

procedure TForm_cadastro.but_cancelarClick(Sender: TObject);
begin
  edt_nome.Clear;
  Mask_CPF.Clear;
  edt_usuario.Clear;
  edt_senha.Clear;
  Close;
end;

procedure TForm_cadastro.but_cadastroClick(Sender: TObject);
var
  DataNascimento, hoje : TDate;
  Idade: Integer;
  AnoNasc, MesNasc, DiaNasc: Word;
  AnoHoje, MesHoje, DiaHoje: Word;
begin
  DataNascimento := DateNasc.Date;
  Hoje := Date;

  DecodeDate(DataNascimento, AnoNasc, MesNasc, DiaNasc);
  DecodeDate(Hoje, AnoHoje, MesHoje, DiaHoje);

  Idade := AnoHoje - AnoNasc;

  if (MesHoje < MesNasc) or ((MesHoje = MesNasc) and (DiaHoje < DiaNasc)) then
    begin
      Dec(Idade)
    end
      else
        begin
          if (edt_nome.Text='') or (Mask_CPF.Text='') or (edt_usuario.Text='') or (edt_senha.Text='') then
            begin
              Showmessage('Preencha todos os campos')
            end
              else
                begin
                  if Idade < 18 then
                        begin
                          ShowMessage('A idade mínima é 18 anos');
                        end
                          else
                            begin
                              ADOQuery_aux.SQL.Text := ' INSERT INTO Clientes '+
                                                       '(Nome, CPF, Nascimento, Usuario, Senha) VALUES '+
                                                       '(' + QuotedStr(edt_nome.Text) +
                                                       ',' + QuotedStr(Mask_CPF.Text) +
                                                       ',' + QuotedStr(FormatDateTime('yyyy-mm-dd', DateNasc.Date)) +
                                                       ',' + QuotedStr(edt_usuario.Text) +
                                                       ',' + QuotedStr(edt_senha.Text) + ')';

                                Form_login.ConexaoBD.BeginTrans;
                                ADOQuery_aux.ExecSQL;
                                Form_login.ConexaoBD.CommitTrans;

                                edt_nome.Clear;
                                Mask_CPF.Clear;
                                edt_usuario.Clear;
                                edt_senha.Clear;

                                Showmessage('Cliente cadastrado com sucesso');
                              end;
                    end;
            end;
        end;

end.
