unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Mask;

type
TMainForm = class(TForm)
    TablePanel: TPanel;
    InsertPanel: TPanel;
    MainTable: TStringGrid;
    TimeOfDayRadioGroup: TRadioGroup;
    EditT: TEdit;
    EditD: TEdit;
    EditV: TEdit;
    AddButton: TButton;
    LabelDate: TLabel;
    EditDate: TMaskEdit;
    LabelT: TLabel;
    LabelD: TLabel;
    LabelV: TLabel;
    DeleteButton: TButton;
    SaveButton: TButton;
    LoadButton: TButton;
    EditButton: TButton;
    ActionPanel: TPanel;
    IncertLabel: TLabel;
    StatButton: TButton;
    procedure AddButtonClick(Sender: TObject);
    procedure MainTableEnter(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure StatButtonClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

  implementation

uses DataUnit, EditUnit, StatUnit, WelcomeUnit;

{$R *.dfm}



procedure TMainForm.AddButtonClick(Sender: TObject);
begin
  //������� ���������� �����
  DataUnit.AddRow;

 //���������� ���������� �������
 MainForm.MainTable.Cells[0,0]:= '����';
 MainForm.MainTable.Cells[1,0]:= '�����������';
 MainForm.MainTable.Cells[2,0]:= '��������';
 MainForm.MainTable.Cells[3,0]:= '���������';
 MainForm.MainTable.Cells[4,0]:= '����� �����';

// ShowMessage('������ ���������');

end;


procedure TMainForm.DeleteButtonClick(Sender: TObject);
begin
  //������� �������� ���������� ������
  DataUnit.DeleteRow;
end;

procedure TMainForm.EditButtonClick(Sender: TObject);
begin
 try      //������ �� ������. ������
   EditRow; //�������� ������ �� ����� ��������������
   EditForm.ShowModal; //��������� ����� ��������������
   UpdateTable; //��������� �������

except
  //��������� �� ������
  MessageDlg('������!',mtError, mbOKCancel, 0);
end;       //������ �� ������. ���������
end;


procedure TMainForm.LoadButtonClick(Sender: TObject);
begin
 DataUnit.LoadData;
end;

procedure TMainForm.MainTableEnter(Sender: TObject);
begin
 //���������� ���������� �������
 MainForm.MainTable.Cells[0,0]:= '����';
 MainForm.MainTable.Cells[1,0]:= '�����������';
 MainForm.MainTable.Cells[2,0]:= '��������';
 MainForm.MainTable.Cells[3,0]:= '���������';
 MainForm.MainTable.Cells[4,0]:= '����� �����';

 //�������� "����" �� ���������
 MainForm.TimeOfDayRadioGroup.ItemIndex:=0;

 WelcomeForm.ShowModal;

end;


procedure TMainForm.SaveButtonClick(Sender: TObject);
begin
 DataUnit.SaveData;
end;

procedure TMainForm.StatButtonClick(Sender: TObject);
begin
 
 AllDataToStatTable; //�������� ��� ������ � �������
 StatForm.Show; //�������� ���� ����������

end;

end.
