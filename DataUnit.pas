unit DataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Math;

type

 wdata = record        //�������� ���� ������-������
  date: String[10];      //����
  t:String[5];              //�����������
  d:String[5];              //��������
  v:String[5];              //���������
  dn:String[5];          //����� �����
 end;

 var
  wtable: array of wdata;   //������������ ������ ������
  f:wdata;     //������ �������
  wdatafile:file of wdata; //�������������� ����
  id:integer; //��������� id ������ � �������
  filtredwtable: array of wdata;   //��������������� ������������ ������ ������
  err: boolean; //���� ������ ��� ���������� ������
  procedure AddRow;
  procedure DeleteRow;
  procedure SaveData;
  procedure LoadData;
  procedure UpdateTable;
  procedure EditRow;
  procedure FilterData;
  procedure UpdateFiltredTable;
  procedure AllDataToStatTable;
  procedure Stat;
  procedure SortFiltredData;

implementation

uses MainUnit, EditUnit, StatUnit;


{��������� ���������� ������}
procedure AddRow;
var
 i:integer; //��������
 a:real;    //���������� ��� �������� �� ������
 b:TDateTime; //���������� ��� �������� �� ������
 error:boolean; //���� ������
begin
  error:=false;
  try    //������ �� ������. ������
    b:=StrToDate(MainForm.EditDate.Text);
    a:=StrToFloat(MainForm.EditT.Text);
    a:=StrToFloat(MainForm.EditD.Text);
    a:=StrToFloat(MainForm.EditV.Text);
  except
   error:=true;
   MessageDlg('������� ������������ ������!',mtError, mbOKCancel, 0);
  end;       //������ �� ������. ���������

 if error=false
 then
  begin
   //��������� ������ � ����� �����
    f.date:=DateToStr(StrToDate(MainForm.EditDate.Text)); //����� ���� ������ ��������� ��� ����
    f.t:=MainForm.EditT.Text;
    f.d:=MainForm.EditD.Text;
    f.v:=MainForm.EditV.Text;
    if MainForm.TimeOfDayRadioGroup.ItemIndex=0
     then
      f.dn:='����'
     else
      f.dn:='����';
    setlength(wtable,length(wtable)+1); //����������� ���-�� ������� � �������
    wtable[length(wtable)-1]:=f;     //���������� ������ � �������
    UpdateTable;//����������� �������
  end;

end;



{��������� �������� ������}
procedure DeleteRow;
var
 i,j:integer; //��������
begin
try    //������ �� ������. ������
  //���������� ������
  j:=MainForm.MainTable.Row-1;

  //�������� ���������� ������ �� �������
if length(wtable)>1
  then
   begin
    for i := j to (length(wtable)-1) do
     begin
      wtable[i]:= wtable[i+1];
      end;
     setlength(wtable, length(wtable)-1);
    end
   else
    if length(wtable)=1
     then
      begin
       MainForm.MainTable.Cells[0,1]:= '';
       MainForm.MainTable.Cells[1,1]:= '';
       MainForm.MainTable.Cells[2,1]:= '';
       MainForm.MainTable.Cells[3,1]:= '';
       MainForm.MainTable.Cells[4,1]:= '';
       setlength(wtable, length(wtable)-1);
      end;
  UpdateTable;  //����������� �������

except
  //��������� �� ������
  MessageDlg('������!',mtError, mbOKCancel, 0);
end;       //������ �� ������. ���������
end;


{��������� �������������� ������}
procedure EditRow;
var
 i,j:integer; //��������
begin

 //�������� ���������� ������ �� ����� ��������������
 id:=MainForm.MainTable.Row-1;
 EditForm.EditEditDate.Text:= wtable[id].date;
 EditForm.EditEditT.Text:= wtable[id].t;
 EditForm.EditEditD.Text:= wtable[id].d;
 EditForm.EditEditV.Text:= wtable[id].v;
 if wtable[id].dn='����' then
    EditForm.EditTimeOfDayRadioGroup.ItemIndex:=0
   else
    EditForm.EditTimeOfDayRadioGroup.ItemIndex:=1;


end;




{��������� ���������� �������}
procedure SaveData;
var
 i:integer; //��������
begin
AssignFile(wdatafile,'data.dat'); //����������� ��� ����� ����������
Rewrite(wdatafile); //������� � ��������� ����� ����
Seek(wdatafile,0); //���������� ������ � ������ �����

for i := 0 to length(wtable)-1 do
  Write(wdatafile,wtable[i]);

CloseFile(wdatafile);    //����������� ����
ShowMessage('������ ���������');

end;



{��������� �������� �������}
procedure LoadData;
var
 i,j:integer; //��������
begin
try
AssignFile(wdatafile,'data.dat'); //����������� ��� ����� ����������
Reset(wdatafile); //��������� ������������ ����


i:=0; //��������� �������� ��������
SetLength(wtable,0);
while not EOF(wdatafile) do
begin
  Seek(wdatafile,i);
  SetLength(wtable,Length(wtable)+1); //����������� ������ �������
  Read(wdatafile, f);
  wtable[i]:=f;
  i:=i+1;
end;
CloseFile(wdatafile);    //����������� ����
MainForm.MainTable.RowCount:=length(wtable); //���������� ����� ������� ��� ������� � �������
UpdateTable;  //����������� �������

except
   //��������� �� ������
  MessageDlg('���� �� ������',mtError, mbOKCancel, 0);
end;
end;



{��������� ���������� �������}
procedure UpdateTable;
var
 i,j:integer; //��������
begin
MainForm.MainTable.Rowcount:=length(wtable)+1;

//����� ����� ���� ���� ������������� ������ (����� �������)
if MainForm.MainTable.RowCount=1
  then
   begin
      MainForm.MainTable.Rowcount:=MainForm.MainTable.Rowcount+1;
      MainForm.MainTable.FixedRows:=1;
   end;

//����� ������ � �������
for i := 0 to length(wtable)-1 do
 begin
 MainForm.MainTable.Cells[0,i+1]:= wtable[i].date;
 MainForm.MainTable.Cells[1,i+1]:= wtable[i].t;
 MainForm.MainTable.Cells[2,i+1]:= wtable[i].d;
 MainForm.MainTable.Cells[3,i+1]:= wtable[i].v;
 MainForm.MainTable.Cells[4,i+1]:= wtable[i].dn;
 end;

//�������� ��������� ������ ������
  if (MainForm.MainTable.RowCount<>2) and (MainForm.MainTable.Cells[1,1]='') then
    begin
      for i := 0 to MainForm.MainTable.Rowcount - 1 do
        begin
         MainForm.MainTable.Cells[0,i]:= MainForm.MainTable.Cells[0,i+1];
         MainForm.MainTable.Cells[1,i]:= MainForm.MainTable.Cells[1,i+1];
         MainForm.MainTable.Cells[2,i]:= MainForm.MainTable.Cells[2,i+1];
         MainForm.MainTable.Cells[3,i]:= MainForm.MainTable.Cells[3,i+1];
         MainForm.MainTable.Cells[4,i]:= MainForm.MainTable.Cells[4,i+1];
        end;
      MainForm.MainTable.RowCount:=MainForm.MainTable.RowCount-1;
    end;

end;


{��������� ������� �������������� ������ �� ��������� �� StatForm ������}
procedure FilterData;
var
 i,j:integer; //��������
 dateA, dateB: TDate; //���� ��� ����������
begin
 j:=0; //��������� ������  �� ������������� �������
 SetLength(filtredwtable,Length(wtable));
try
 err:=false; //��� ������
 if StatForm.RadioGroupWeatherType.ItemIndex=0
  then  //����� ������� "�� ����"
    begin
      dateA:= StrToDate(StatForm.OnDayEdit.Text);  //��������� ��������� ���� �� ���� ����� � ���������
      for i := 0 to (length(wtable)-1) do  //��������� ���� ������
       begin
        if StrToDate(wtable[i].date)=dateA           //�� ������������ � ��������� �����
         then                  //���� ��, ��
           begin
            filtredwtable[j]:=wtable[i];   //��������� ������ ������� � �������������� ������
            j:=j+1; //� �������� ������� ������ ������ ���������������� �������
           end;
       end;
    end
  else //����� ������� "�� ������"
   begin
    dateA:= StrToDate(StatForm.OnPeriodStartEdit.Text); //��������� ����
    dateB:= StrToDate(StatForm.OnPeriodEndEdit.Text);  //�������� ����
      for i := 0 to (length(wtable)-1) do   //��������� ���� ������
        if (StrToDate(wtable[i].date)>=dateA) and (StrToDate(wtable[i].date)<=dateB)  //�� ������������ ��������� � �������� ��������
         then
           begin
            filtredwtable[j]:=wtable[i];   //��������� ������ ������� � �������������� ������
            j:=j+1; //� �������� ������� ������ ������ ���������������� �������
           end;
   end;
   SetLength(filtredwtable,j);
except
 //��������� �� ������
  err:=true;  //���� ������
  MessageDlg('������!',mtError, mbOKCancel, 0);
end;
end;

{��������� ���������� �������}
procedure UpdateFiltredTable;
var
 i,j:integer; //��������
begin
StatForm.StatTable.Rowcount:=length(filtredwtable)+1;

//����� ����� ���� ���� ������������� ������ (����� �������)
if StatForm.StatTable.RowCount=1
  then
   begin
      StatForm.StatTable.Rowcount:=StatForm.StatTable.Rowcount+1;
      StatForm.StatTable.FixedRows:=1;
   end;

//����� ������ � �������
for i := 0 to length(filtredwtable)-1 do
 begin
 StatForm.StatTable.Cells[0,i+1]:= filtredwtable[i].date;
 StatForm.StatTable.Cells[1,i+1]:= filtredwtable[i].t;
 StatForm.StatTable.Cells[2,i+1]:= filtredwtable[i].d;
 StatForm.StatTable.Cells[3,i+1]:= filtredwtable[i].v;
 StatForm.StatTable.Cells[4,i+1]:= filtredwtable[i].dn;
 end;

end;

{������� ��� ������ �� ��������� ������� � ������� stat}
procedure AllDataToStatTable;
var
 i,j:integer; //��������
begin
StatForm.StatTable.Rowcount:=length(wtable)+1;

//����� ����� ���� ���� ������������� ������ (����� �������)
if StatForm.StatTable.RowCount=1
  then
   begin
      StatForm.StatTable.Rowcount:=StatForm.StatTable.Rowcount+1;
      StatForm.StatTable.FixedRows:=1;
   end;

//����� ������ � �������
for i := 0 to length(wtable)-1 do
 begin
 StatForm.StatTable.Cells[0,i+1]:= wtable[i].date;
 StatForm.StatTable.Cells[1,i+1]:= wtable[i].t;
 StatForm.StatTable.Cells[2,i+1]:= wtable[i].d;
 StatForm.StatTable.Cells[3,i+1]:= wtable[i].v;
 StatForm.StatTable.Cells[4,i+1]:= wtable[i].dn;
 end;

end;

{������������ avg, min, max ����������� � ������ �������}
procedure Stat;
var
 i,j:integer; //��������
 x,y:integer; //���������� ��� ��������� �������
 avgT, avgD, avgV:real; //������� �������� �����������, ��������, ���������
 minT, maxT:real; //������������ � ����������� ������������
 minY1,minY2,maxY1,maxY2: integer; //���������� ��� ��������� ���������
 minTi,maxTi:integer; //������ ������� � ������� � ���. ���� �������������
begin

 //������� �������� �����������, ��������, ���������
 avgT:=0;
 avgD:=0;
 avgV:=0;
 for i := 0 to length(filtredwtable)-1 do
  begin
    avgT:=avgT+StrToFloat(filtredwtable[i].t);//���������
    avgD:=avgD+StrToFloat(filtredwtable[i].d);//���������
    avgV:=avgV+StrToFloat(filtredwtable[i].v);//���������
  end;
 avgT:=avgT/length(filtredwtable); //����� �� ���-�� �������
 avgD:=avgD/length(filtredwtable); //����� �� ���-�� �������
 avgV:=avgV/length(filtredwtable); //����� �� ���-�� �������
 StatForm.AvgTResultLabel.Caption:=FloatToStr(SimpleRoundTo(avgT,-3))+' �C'; //������� ���������
 StatForm.AvgDResultLabel.Caption:=FloatToStr(SimpleRoundTo(avgD,-3))+' �� ��. ��.'; //������� ���������
 StatForm.AvgVResultLabel.Caption:=FloatToStr(SimpleRoundTo(avgV,-3))+' %'; //������� ���������

 //������������ � ����������� ������������
 minT:=StrToFloat(filtredwtable[0].t);
 maxT:=StrToFloat(filtredwtable[0].t);
 for i := 0 to length(filtredwtable)-1 do
  begin
    if maxT<StrToFloat(filtredwtable[i].t)
      then
        begin
          maxT:=StrToFloat(filtredwtable[i].t);  //������������ ��������
          maxTi:=i;  //��������� ����� ������
        end;

    if minT>StrToFloat(filtredwtable[i].t)
      then
        begin
          minT:=StrToFloat(filtredwtable[i].t);   //����������� ��������
          minTi:=i;  //��������� ����� ������
        end;
    StatForm.MaxTResultLabel.Caption:=FloatToStr(maxT)+' �C'; //������� �������� max
    StatForm.MinTResultLabel.Caption:=FloatToStr(minT)+' �C'; //������� �������� min
    StatForm.TMinYearLabel.Caption:= filtredwtable[minTi].date; //���� min �����������
    StatForm.TMaxYearLabel.Caption:= filtredwtable[maxTi].date; //���� max �����������
  end;

  //���������� ��������� min max ����������
  StatForm.TMinMaxDiagram.Canvas.Brush.Style:=bsSolid;
  StatForm.TMinMaxDiagram.Canvas.Brush.Color:=clWhite;
  StatForm.TMinMaxDiagram.Canvas.fillrect(StatForm.TMinMaxDiagram.Canvas.cliprect); //������� ������

  StatForm.TMinMaxDiagram.Canvas.Pen.Width:=1;
  StatForm.TMinMaxDiagram.Canvas.Brush.Style:=bsCross; //����� ��������
  minY1:=Round(StatForm.TMinMaxDiagram.Height/2)-Round(minT);
  minY2:=Round(StatForm.TMinMaxDiagram.Height/2);
  maxY1:=Round(StatForm.TMinMaxDiagram.Height/2)-Round(maxT);
  maxY2:=Round(StatForm.TMinMaxDiagram.Height/2);
  with StatForm.TMinMaxDiagram do
    begin
      StatForm.TMinMaxDiagram.Canvas.Brush.Color:=clPurple; //���� ����������
      StatForm.TMinMaxDiagram.Canvas.Rectangle(20,minY1,120,minY2); //������ min
      StatForm.TMinMaxDiagram.Canvas.Brush.Color:=clLime; //���� ���������
      StatForm.TMinMaxDiagram.Canvas.Rectangle(125,maxY1,225,maxY2); //������ max
      StatForm.TMinMaxDiagram.Canvas.TextOut(1,minY1,FloatToStr(minT)); //������� min
      StatForm.TMinMaxDiagram.Canvas.TextOut(1,maxY1,FloatToStr(maxT));  //������� max
    end;

 //���������� ���� ��������� min max ����������
 StatForm.TMinMaxDiagram.Canvas.Pen.Width:=3;
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


 //���������� ������� ����������
 StatForm.TPeriodDiagram.Canvas.fillrect(StatForm.TPeriodDiagram.Canvas.cliprect); //������� ������
 if StatForm.RadioGroupWeatherType.ItemIndex=1 then
  begin
   StatForm.TPeriodDiagram.Canvas.MoveTo(15, StatForm.TPeriodDiagram.Height-15);
   with StatForm.TPeriodDiagram do
   begin
      StatForm.TPeriodDiagram.Canvas.Pen.Width:=1;
      for i := 0 to (length(filtredwtable)-1) do
        begin
          if i=0 //������ ����� ��� ������
            then
              x:=15
            else
              x:=x+Round((StatForm.TPeriodDiagram.Width-30)/(length(filtredwtable)-1)); //����������� ������������� ������ �� �

          y:=-(StrToInt(filtredwtable[i].t)-Round(StatForm.TPeriodDiagram.Height/2));  //�������� ���������� �� Y
          if i=0 then            //�������� �������� � ������ �����, � �� � ������ ���������
            StatForm.TPeriodDiagram.Canvas.MoveTo(x,y);

          StatForm.TPeriodDiagram.Canvas.LineTo(x,y);
        end;

        //���� ��� ���������� �������� ������
        {for i := 0 to (length(filtredwtable)-1) do
        begin
          if i=0 //������ ����� ��� ������
            then
              x:=15
            else
              x:=x+Round((StatForm.TPeriodDiagram.Width-30)/(length(filtredwtable)-1)); //����������� ������������� ������ �� �

          y:=-(StrToInt(filtredwtable[i].t)-Round(StatForm.TPeriodDiagram.Height/2));  //�������� ���������� �� Y

          StatForm.TPeriodDiagram.Canvas.TextOut(x,Round(StatForm.TPeriodDiagram.Height/2)+10,IntToStr(Round(StatForm.TPeriodDiagram.Height/2)-y)); //������� ������ �� Y
        end;   }
    end;


  end;

 //���������� ���� ������� ����������
 with StatForm.TPeriodDiagram do
   begin
    StatForm.TPeriodDiagram.Canvas.Pen.Width:=3;
    StatForm.TPeriodDiagram.Canvas.MoveTo(15,15);
    StatForm.TPeriodDiagram.Canvas.LineTo(15, StatForm.TPeriodDiagram.Height-15); //��� OY
    StatForm.TPeriodDiagram.Canvas.MoveTo(15, Round(StatForm.TPeriodDiagram.Height/2));
    StatForm.TPeriodDiagram.Canvas.LineTo(StatForm.TPeriodDiagram.Width-15, Round(StatForm.TPeriodDiagram.Height/2)); //��� OX
    StatForm.TPeriodDiagram.Canvas.TextOut(5,10,'y');   //������� ��� Y
    StatForm.TPeriodDiagram.Canvas.TextOut(StatForm.TPeriodDiagram.Width-19, Round(StatForm.TPeriodDiagram.Height/2)+3,'x');  //������� ��� X
   end;

end;


{��������� ��������������� ������. ����������� ����������}
procedure SortFiltredData;
var
  i,j,n: Integer;  //��������
  Sort: Boolean;  //���� ��������� ����������
  tmp: wdata;    //��������� �������� ������ �������
begin
  //��������� �� ����
  Sort:=True;
  n:=length(filtredwtable)-1;  //����� �������
  for i:=0 to n-1 do
        for j:=i+1 to n do
            if (StrToDate(filtredwtable[i].date)>StrToDate(filtredwtable[j].date))
             then
                begin
                  Sort:=True;
                  tmp := filtredwtable[i];
                  filtredwtable[i] := filtredwtable[j];
                  filtredwtable[j] := tmp;
                end;

  //��������� �� ������� �����
  Sort:=True;
  n:=length(filtredwtable)-1;  //����� �������
  for i:=0 to n-1 do
        for j:=i+1 to n do
  if (StrToDate(filtredwtable[i].date)=StrToDate(filtredwtable[j].date)) and
                   (filtredwtable[i].dn='����') and (filtredwtable[j].dn='����')
              then
                begin
                  Sort:=True;
                  tmp := filtredwtable[i];
                  filtredwtable[i] := filtredwtable[j];
                  filtredwtable[j] := tmp;
                end;
end;


end.


