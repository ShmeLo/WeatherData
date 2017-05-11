unit StatUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Grids;

type
  TStatForm = class(TForm)
    StatPanel: TPanel;
    StatTable: TStringGrid;
    RadioGroupWeatherType: TRadioGroup;
    OnDayPanel: TPanel;
    OnPeriodPanel: TPanel;
    OnDayEdit: TMaskEdit;
    OnDayLabel: TLabel;
    OnPeriodStartEdit: TMaskEdit;
    OnPeriodEndEdit: TMaskEdit;
    OnPeriodStartLabel: TLabel;
    OnPeriodEndLabel: TLabel;
    OnPeriodLabel: TLabel;
    GoButton: TButton;
    AvgTLabel: TLabel;
    AvgTResultLabel: TLabel;
    DiagramPanel: TPanel;
    AvgVLabel: TLabel;
    AvgVResultLabel: TLabel;
    AvgDLabel: TLabel;
    AvgDResultLabel: TLabel;
    TPeriodDiagram: TImage;
    TMinMaxDiagram: TImage;
    MinTLabel: TLabel;
    MaxTLabel: TLabel;
    MinTResultLabel: TLabel;
    MaxTResultLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GoButtonClick(Sender: TObject);
    procedure RadioGroupWeatherTypeClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatForm: TStatForm;

implementation

uses DataUnit;

{$R *.dfm}


procedure TStatForm.FormCreate(Sender: TObject);
begin
 //�������� ������ ������� ��-���������
 RadioGroupWeatherType.ItemIndex:=0;

 //����� ������� ��-���������
  //���������� ���������� �������
 StatForm.StatTable.Cells[0,0]:= '����';
 StatForm.StatTable.Cells[1,0]:= '�����������';
 StatForm.StatTable.Cells[2,0]:= '��������';
 StatForm.StatTable.Cells[3,0]:= '���������';
 StatForm.StatTable.Cells[4,0]:= '����� �����';

 //���������� ���� ������� ����������
 with StatForm.TPeriodDiagram do
   begin
    StatForm.TPeriodDiagram.Canvas.Pen.Width:=3;
    StatForm.TPeriodDiagram.Canvas.MoveTo(15,15);
    StatForm.TPeriodDiagram.Canvas.LineTo(15, StatForm.TPeriodDiagram.Height-15); //��� OY
    StatForm.TPeriodDiagram.Canvas.MoveTo(15, Round(StatForm.TPeriodDiagram.Height/2)); //��� OX
    StatForm.TPeriodDiagram.Canvas.LineTo(StatForm.TPeriodDiagram.Width-15, Round(StatForm.TPeriodDiagram.Height/2)); //��� OX
    StatForm.TPeriodDiagram.Canvas.TextOut(5,10,'y');   //������� ��� Y
    StatForm.TPeriodDiagram.Canvas.TextOut(StatForm.TPeriodDiagram.Width-19, Round(StatForm.TPeriodDiagram.Height/2)+3,'x');  //������� ��� X
   end;

  //���������� ���� ��������� min max ����������
 with StatForm.TMinMaxDiagram do
   begin
    StatForm.TMinMaxDiagram.Canvas.Pen.Width:=3;
    StatForm.TMinMaxDiagram.Canvas.MoveTo(15,15);
    StatForm.TMinMaxDiagram.Canvas.LineTo(15, Round(StatForm.TMinMaxDiagram.Height-15)); //��� OY
    StatForm.TMinMaxDiagram.Canvas.MoveTo(15, Round(StatForm.TMinMaxDiagram.Height/2));
    StatForm.TMinMaxDiagram.Canvas.LineTo(StatForm.TMinMaxDiagram.Width-15, Round(StatForm.TMinMaxDiagram.Height/2)); //��� OX
    StatForm.TMinMaxDiagram.Canvas.TextOut(5,10,'y');   //������� ��� Y
    StatForm.TMinMaxDiagram.Canvas.TextOut(StatForm.TMinMaxDiagram.Width-19, Round(StatForm.TMinMaxDiagram.Height/2+3),'x');  //������� ��� X
   end;

end;

procedure TStatForm.GoButtonClick(Sender: TObject);
begin
  FilterData;  //�������� ������
  UpdateFiltredTable;   //������� ������ � �������
  Stat; //������ �����������
end;

procedure TStatForm.RadioGroupWeatherTypeClick(Sender: TObject);
begin
 if RadioGroupWeatherType.ItemIndex=0 then
  begin
  OnPeriodPanel.Visible:=false;
  OnDayPanel.Visible:=true;
  end
 else
  begin
    OnPeriodPanel.Visible:=true;
    OnDayPanel.Visible:=false;
  end;
end;


end.
