unit UnitLftHopper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid, sGroupBox, sEdit,
  ComCtrls, sPageControl, ExtCtrls, Buttons, sBitBtn, acProgressBar;

type
  TFrmLftHopper = class(TForm)
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBtBtnOK: TsBitBtn;
    sBitBtn4: TsBitBtn;
    Timer1: TTimer;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    Label1: TLabel;
    sEtEquipName: TsEdit;
    sGroupBox2: TsGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    sEtLoadCell: TsEdit;
    sTabSheet2: TsTabSheet;
    AdvStrGdAggrBinAttri: TAdvStringGrid;
    Memo2: TMemo;
    sProgressBar1: TsProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLftHopper: TFrmLftHopper;

implementation

{$R *.dfm}

procedure TFrmLftHopper.FormCreate(Sender: TObject);
var
    i : Integer;
begin
{    AggConcPrarChanged := False;
    MsCommStateInUntAggrConcAttr    := CntMsCmStaInUntAggConcAttrIsIdle ;      //ͨѶ״̬Ϊ����
    StepsOfAggrConcParaModify       := CntStepsOfAggrConcParaMfyIsIdle;        //�������Ͳ����޸Ĳ��� = ����
    MscmTmrInterValInUntAggConcAttr := Timer1.Interval;

    for i:=1 to CntAggregateConvParaCount do
    begin
        AggregateConvParaInUntAggrConcAttr[i] := AggregateConvPara[PMAggrHopperId][i]  ;    //����������ַ����
    end;
}
    {�����ǩ}
{    if AggregateConveyorMode = CntAggregateConveyorBelt then            //�������ͷ�ʽ = бƤ��
    begin
        Self.Caption := AggregateMidBinInfo[PMAggrHopperId].Name + ' ����';
        sEtEquipName.Text := AggregateMidBinInfo[PMAggrHopperId].Name;

        if AggregateMidBinInfo[PMAggrHopperId].IsWeigher then
        begin
            sGroupBox2.Visible := True ;
        end
        else
        begin
            sGroupBox2.Visible := False;
        end;
}
        {�����б�}
{        IniAggrConcParaInfo();

    end
    else if AggregateConveyorMode = CntAggregateConveyorElevator then   //�������ͷ�ʽ = ������
    else
    begin

    end;

    AdvStrGdAggrBinAttri.Cells[1, 0] := '���';
    AdvStrGdAggrBinAttri.Cells[2, 0] := '��������';
    AdvStrGdAggrBinAttri.Cells[3, 0] := '����ֵ';
    AdvStrGdAggrBinAttri.Cells[4, 0] := '��λ';
    AdvStrGdAggrBinAttri.Cells[5, 0] := 'CntAggreConvParaInfoID';
    AdvStrGdAggrBinAttri.ColWidths[5] := 0;}

end;

end.
