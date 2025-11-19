program Alpha_sistemas;

uses
  Forms,
  Unit_login in 'Unit_login.pas' {Form_login},
  Unit_cadastro in 'Unit_cadastro.pas' {Form_cadastro},
  Unit_menu in 'Unit_menu.pas' {Form_menu},
  Unit_cadastro_cliente in 'Unit_cadastro_cliente.pas' {Form_cadastro_cliente};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_login, Form_login);
  Application.CreateForm(TForm_cadastro, Form_cadastro);
  Application.CreateForm(TForm_menu, Form_menu);
  Application.CreateForm(TForm_cadastro_cliente, Form_cadastro_cliente);
  Application.Run;
end.
