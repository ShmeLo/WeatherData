unit WelcomeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TWelcomeForm = class(TForm)
    WelcomeMemo: TMemo;
    WelcomeButton: TButton;
    procedure WelcomeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WelcomeForm: TWelcomeForm;

implementation

{$R *.dfm}

procedure TWelcomeForm.WelcomeButtonClick(Sender: TObject);
begin
 close;
end;

end.
