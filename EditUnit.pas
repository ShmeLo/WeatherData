unit EditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask;

type
  TEditForm = class(TForm)
    EditPanel: TPanel;
    EditLabelDate: TLabel;
    EditLabelT: TLabel;
    EditLabelD: TLabel;
    EditLabelV: TLabel;
    EditLabel: TLabel;
    EditTimeOfDayRadioGroup: TRadioGroup;
    EditEditT: TEdit;
    EditEditD: TEdit;
    EditEditV: TEdit;
    EditOkButton: TButton;
    EditCancelButton: TButton;
    EditEditDate: TMaskEdit;
    procedure EditOkButtonClick(Sender: TObject);
    procedure EditCancelButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;

implementation

uses DataUnit, MainUnit;

{$R *.dfm}


procedure TEditForm.EditCancelButtonClick(Sender: TObject);
begin
 //������ ��������� ����� ��������������
 Close;
end;

procedure TEditForm.EditOkButtonClick(Sender: TObject);
var
 a:real;    //���������� ��� �������� �� ������
 b:TDateTime; //���������� ��� �������� �� ������
  error:boolean; //���� ������
begin
  error:=false;
  try    //������ �� ������. ������
    b:=StrToDate(EditForm.EditEditDate.Text);
    a:=StrToFloat(EditForm.EditEditT.Text);
    a:=StrToFloat(EditForm.EditEditD.Text);
    a:=StrToFloat(EditForm.EditEditV.Text);
  except
   error:=true;
   MessageDlg('������� ������������ ������!',mtError, mbOKCancel, 0);
  end;       //������ �� ������. ���������

 if error=false  //���� ������ ���, �� ��������� ���������
 then
  begin
  //��������� ���������
    wtable[id].date:= EditForm.EditEditDate.Text;
    wtable[id].t:= EditForm.EditEditT.Text;
     wtable[id].d:= EditForm.EditEditD.Text;
     wtable[id].v:= EditForm.EditEditV.Text;
     if EditForm.EditTimeOfDayRadioGroup.ItemIndex=0 then
        wtable[id].dn:='����'
       else
        wtable[id].dn:='����';

     Close;
  end;
end;

end.
