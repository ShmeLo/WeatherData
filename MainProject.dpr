program MainProject;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DataUnit in 'DataUnit.pas',
  EditUnit in 'EditUnit.pas' {EditForm},
  StatUnit in 'StatUnit.pas' {StatForm},
  WelcomeUnit in 'WelcomeUnit.pas' {WelcomeForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TEditForm, EditForm);
  Application.CreateForm(TStatForm, StatForm);
  Application.CreateForm(TWelcomeForm, WelcomeForm);
  Application.Run;
end.
