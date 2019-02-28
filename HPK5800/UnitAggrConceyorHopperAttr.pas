unit UnitAggrConceyorHopperAttr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, Grids, AdvObj, BaseGrid, AdvGrid,
  sGroupBox, sEdit, ComCtrls, sPageControl, acProgressBar, UnitGlobeVar,
  ExtCtrls, ADODB;

type
  TFrmAggrConceyorHopperAttr = class(TForm)
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
    BtnReadDb: TsBitBtn;
    BtnRestore: TsBitBtn;
    sBtBtnOK: TsBitBtn;
    sBitBtn4: TsBitBtn;
    sProgressBar1: TsProgressBar;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvStrGdAggrBinAttriGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStrGdAggrBinAttriCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure AdvStrGdAggrBinAttriGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure AdvStrGdAggrBinAttriCellsChanged(Sender: TObject; R: TRect);
    procedure sBtBtnOKClick(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    CanEditConceyorParaPeimisson : boolean;

    procedure IniAggrConcParaInfo();
    Function GetAggrConvParaInfoId(var ParaIndex : Integer; ParaIdInParaValueArray : Integer) : Boolean;
    procedure paraValueDspInAggrConvAttr();    //����ֵ��ʾ
    procedure SaveParaModifyOfAggrConc(var WtInstrValid : Boolean);    //��������޸�
    procedure GetNewAggrConcParaValue();
    procedure MsCmRecProgInUtAggConcAttr();
    procedure MscmRecProgForSaveNewPara();    //�����²���ʱ��ͨѶ���մ���
    procedure SaveNewAggrConcParaToDb(var ExDbRslt : boolean);    //�����²��������ݿ�
    procedure SaveNewAggrConcParaToMemory();                      //������ϲ�����ֵ���ڴ�

    procedure InitPermissonInFrmConyorAttr();
  public
    { Public declarations }
  end;

var
  FrmAggrConceyorHopperAttr: TFrmAggrConceyorHopperAttr;

var
  AggConcPrarChanged : Boolean;

  AggregateConvParaInUntAggrConcAttr : array[1..CntAggregateConvParaCount] of AggregateConvParaRd ;    //����������ַ����

  StepsOfAggrConcParaModify : Integer;    //�������Ͳ����޸Ĳ���
const
  CntStepsOfAggrConcParaMfyIsIdle                    = 0;     //����
  CntStepsOfAggrConcParaMfyIsGetNewParaVaue          = 1;     //��ȡ�µĲ���ֵ
  CntStepsOfAggrConcParaMfyIsWtAggrModeToIns         = 2;    //д��������ģʽ����
  CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns       = 3;    //д���ϲ�����1���Ǳ�
  CntStepsOfAggrConcParaMfyIsWtParaArray2ToIns       = 4;    //д���ϲ�����1���Ǳ�
  CntStepsOfAggrConcParaMfyIsWtAggrDschIntervalToIns = 5;    //д���ϳ�ж�Ϸ����ʱ�䵽�Ǳ�
  CntStepsOfAggrConcParaMfyIsEnd                     = 6;    //д�������Ͳ�������

var
  MsCommStateInUntAggrConcAttr : Integer;
Const
  CntMsCmStaInUntAggConcAttrIsIdle = 1;         //����
  CntMsCmStaInUntAggConcAttrIsWaitReply = 2;    //�ȴ���λ��Ӧ��

var
  MscmTmrInUntAggConcAttr         : Integer;   //ͨѶ��ʱ��
  MscmTmrInterValInUntAggConcAttr : Integer;   //ͨѶ��ʱ����ʱ���
var
  MscmWaitRecBufPtInUntAggrConcAttr : Integer;     //ͨѶ���ջ�����ָ��

var
  MscmSendCmdInUntAggrConcAttr : Integer;    //������������
Const
  CntMscmSndCmdInUtAggConAttrIsSaveNewPara =2 ;    //���͵��Ǳ�������Ǳ����µĲ���ֵ

implementation

{$R *.dfm}

uses  UnitRWInstrument1MscommBuf, UnitMain, UnitPersonnelMangement;

procedure TFrmAggrConceyorHopperAttr.FormCreate(Sender: TObject);
var
    i : Integer;
begin
    AggConcPrarChanged := False;
    MsCommStateInUntAggrConcAttr    := CntMsCmStaInUntAggConcAttrIsIdle ;      //ͨѶ״̬Ϊ����
    StepsOfAggrConcParaModify       := CntStepsOfAggrConcParaMfyIsIdle;        //�������Ͳ����޸Ĳ��� = ����
    MscmTmrInterValInUntAggConcAttr := Timer1.Interval;

    for i:=1 to CntAggregateConvParaCount do
    begin
        AggregateConvParaInUntAggrConcAttr[i] := AggregateConvPara[PMAggrHopperId][i]  ;    //����������ַ����
    end;

    {�����ǩ}
    if AggregateConveyorMode = CntAggregateConveyorBelt then            //�������ͷ�ʽ = бƤ��
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

        {�����б�}
        IniAggrConcParaInfo();

    end
    else if AggregateConveyorMode = CntAggregateConveyorElevator then   //�������ͷ�ʽ = ������
    begin
        Self.Caption := LiftBucketAttr[PMAggrHopperId].Name + ' ����';
        sEtEquipName.Text := LiftBucketAttr[PMAggrHopperId].Name;
        sGroupBox2.Visible := False;

        {�����б�}
        IniAggrConcParaInfo();
    end;

    AdvStrGdAggrBinAttri.Cells[1, 0] := '���';
    AdvStrGdAggrBinAttri.Cells[2, 0] := '��������';
    AdvStrGdAggrBinAttri.Cells[3, 0] := '����ֵ';
    AdvStrGdAggrBinAttri.Cells[4, 0] := '��λ';
    AdvStrGdAggrBinAttri.Cells[5, 0] := 'CntAggreConvParaInfoID';
    AdvStrGdAggrBinAttri.ColWidths[5] := 0;

    InitPermissonInFrmConyorAttr();
end;

procedure TFrmAggrConceyorHopperAttr.InitPermissonInFrmConyorAttr();
begin
    if pos('[' + CntPermissonCode[CntPermIsPara] + 'e]', PersonnelPermit) >= 1 then
    begin
        CanEditConceyorParaPeimisson := True;

        BtnReadDb.Enabled  := True;
        BtnRestore.Enabled := True;
        sBtBtnOK.Enabled   := True;
    end
    else
    begin
        CanEditConceyorParaPeimisson := False;

        BtnReadDb.Enabled  := False;
        BtnRestore.Enabled := False;
        sBtBtnOK.Enabled   := False;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.IniAggrConcParaInfo();
var
    i : Integer;
    BeginRw,
    WtOffsetRw : Integer;
    ParaIdInInfoArray : Integer;
begin
    {��ȡ���Ʋ���}
    BeginRw := 1;
    WtOffsetRw := 1;
    for i:= 1 to CntAggregateConvParaCount do
    begin
        if Pos('D', AggregateConvPara[PMAggrHopperId][i].Flags) <= 0 then Continue;

        if pos('X', AggregateConvPara[PMAggrHopperId][i].Flags) > 0 then    //�����м�ֲ���
        begin
            if AggregateConveyorMode <> CntAggregateConveyorBelt then Continue;   //�������ͷ�ʽ != бƤ��
        end
        else if Pos('T',  AggregateConvPara[PMAggrHopperId][i].Flags) > 0 then    //��������������
        begin
            if AggregateConveyorMode <> CntAggregateConveyorElevator then Continue;   //�������ͷ�ʽ != ������
        end
        else    //��������
        begin

        end;

        AdvStrGdAggrBinAttri.Cells[1, BeginRw + WtOffsetRw] := IntToStr(WtOffsetRw);
        AdvStrGdAggrBinAttri.Cells[2, BeginRw + WtOffsetRw] := AggregateConvPara[PMAggrHopperId][i].Name;

        AdvStrGdAggrBinAttri.Cells[4, BeginRw + WtOffsetRw] := AggregateConvPara[PMAggrHopperId][i].ParaUnit;

        if GetAggrConvParaInfoId(ParaIdInInfoArray, i) then   //��ȡ�ò�������Ϣ�����е��±�
        begin
            AdvStrGdAggrBinAttri.Cells[5, BeginRw + WtOffsetRw] := IntToStr(ParaIdInInfoArray);
        end
        else
        begin
            Showmessage('��ȡ������Ϣ�����ʧ��');
        end;

        WtOffsetRw := WtOffsetRw +1;
    end;

    AdvStrGdAggrBinAttri.RowCount := BeginRw + WtOffsetRw;
    AdvStrGdAggrBinAttri.AddNode(BeginRw, WtOffsetRw);
    AdvStrGdAggrBinAttri.Cells[1, BeginRw] := '���Ʋ���';
    
end;

Function TFrmAggrConceyorHopperAttr.GetAggrConvParaInfoId(var ParaIndex : Integer;
  ParaIdInParaValueArray : Integer) : Boolean;
var
    i : Integer;
begin
    for i:=1 to CntAggregateConvParaCount do
    begin
        if ParaIdInParaValueArray = CntAggreConvParaInfo[i].BufIndex then Break;
    end;
    if i<= CntAggregateConvParaCount then
    begin
        ParaIndex := i;
        Result := True;
    end
    else
    begin
        Result := False;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.paraValueDspInAggrConvAttr();    //����ֵ��ʾ
var
    i : Integer;
    TempParaCode : Integer;
begin
    for i:=1 to AdvStrGdAggrBinAttri.RowCount -1 do
    begin
        if Trim(AdvStrGdAggrBinAttri.cells[5, i]) = '' then Continue;

        try
            TempParaCode := StrToInt(AdvStrGdAggrBinAttri.cells[5, i]);
            TempParaCode := CntAggreConvParaInfo[TempParaCode].ParaCode;
        except
            TempParaCode := 0;
        end;

        case TempParaCode of
            {�����Ͳ���}
            CntAggrConvParaIsMidBinDschDelay    ,     //$7041 �������Ͳ������д����ӳ�Ͷ��ʱ��
            CntAggrConvParaIsMidBinDschLong     ,     //$7043 �������Ͳ������д���Ͷ��ʱ��
            CntAggrConvParaIsMidBinLoadContinue ,     //$7045 �������Ͳ������д���װ�ϳ���ʱ��(��������/�����ӳ�ʱ��)
            CntAggrConvParaIsLevelBeltStopDelay ,     //$7046 �������Ͳ�����ƽƤ���ӳ�ֹͣʱ��
            CntAggrConvParaIsMidBinVibraDelay   ,    //$704A �������Ͳ������ӳ���ʱ��
            CntAggrConvParaIsMidBinVibraRunTm   ,    //$704B �������Ͳ�������ʱ��
            CntAggrConvParaIsMidBinVibraSTP     ,    //$704C �������Ͳ������񶯼��ʱ��
            CntAggrConvParaIsHopprRunMaxTm      :    //$704D �������Ͳ����ǹ�����ʱ��
            begin
                AdvStrGdAggrBinAttri.cells[3, i] := IntToStr(AggregateConvPara[PMAggrHopperId][CntAggreConvParaInfo[TempParaCode].BufIndex].Value);
            end;
            //CntAggrConvParaIsMidBinSndDschDelay = 2;     //$7042 �������Ͳ������д��ֶ����ӳ�Ͷ��ʱ��
            //
            //CntAggrConvParaIsMidBinSndDschLong  = 4;     //$7044 �������Ͳ������д��ֶ���Ͷ��ʱ��
            
            //
                                                 //$7047
            //CntAggrConvParaIsMidBinDschPauseTm  = 8;     //$7048 �������Ͳ��������ο��ż��
            //CntAggrConvParaIsSAND_WT            = 9;     //$7049 �������Ͳ�����ɰ��ʯ����ֵ

            //CntAggrConvParaIs                          //704E  �ڴ������±�
            //CntAggrConvParaIs                          //704F  �ڴ������±�
            //CntAggrConvParaIsAggreMode          = 16;    //7050 ����������ʽ �ڴ������±�
        end;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.FormShow(Sender: TObject);
begin
    {����ֵ��ʾ}
    paraValueDspInAggrConvAttr();
end;

procedure TFrmAggrConceyorHopperAttr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmAggrConceyorHopperAttrCrt := False;
    Action := caFree;
end;

procedure TFrmAggrConceyorHopperAttr.AdvStrGdAggrBinAttriGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
    VAlign := vtaCenter;
    
    if (Arow = 0) and (Acol = 1) then
    begin
        HAlign := taCenter;
    end;

end;

procedure TFrmAggrConceyorHopperAttr.AdvStrGdAggrBinAttriCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
    if CanEditConceyorParaPeimisson then
    begin
        if ACol = 3 then
        begin
            if Trim(AdvStrGdAggrBinAttri.Cells[5, ARow]) <> '' then
                CanEdit := True
            else
                CanEdit := False;
        end
        else
        begin
            CanEdit := False;
        end;
    end
    else
    begin
        CanEdit := False;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.AdvStrGdAggrBinAttriGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
var
    ParaCodeS : String;
    ParaCodeI : Integer;
begin
    ParaCodeS := Trim(AdvStrGdAggrBinAttri.Cells[5, ARow]);
    if ParaCodeS <> '' then
    begin
        try
            ParaCodeI := StrToInt(ParaCodeS);
            ParaCodeI := CntAggreConvParaInfo[ParaCodeI].ParaCode;
        except
            ParaCodeI := 0;
        end;
        case ParaCodeI of
            CntAggrConvParaIsMidBinDschDelay    :     //$7041 �������Ͳ������д����ӳ�Ͷ��ʱ��
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinSndDschDelay :     //$7042 �������Ͳ������д��ֶ����ӳ�Ͷ��ʱ��
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinDschLong     :     //$7043 �������Ͳ������д���Ͷ��ʱ��
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinSndDschLong  :     //$7044 �������Ͳ������д��ֶ���Ͷ��ʱ��
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinLoadContinue :     //$7045 �������Ͳ������д���װ�ϳ���ʱ��(��������/�����ӳ�ʱ��)
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsLevelBeltStopDelay :     //$7046 �������Ͳ�����ƽƤ���ӳ�ֹͣʱ��
            begin
                AEditor := edSpinEdit ;
            end;
                                                 //$7047
            CntAggrConvParaIsMidBinDschPauseTm  :     //$7048 �������Ͳ��������ο��ż��
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsSAND_WT            :     //$7049 �������Ͳ�����ɰ��ʯ����ֵ
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinVibraDelay   :    //$704A �������Ͳ������ӳ���ʱ��
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinVibraRunTm   :    //$704B �������Ͳ�������ʱ��
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsMidBinVibraSTP     :    //$704C �������Ͳ������񶯼��ʱ��
            begin
                AEditor := edSpinEdit ;
            end;

            CntAggrConvParaIsHopprRunMaxTm      :    //$704D �������Ͳ����ǹ�����ʱ��
            begin
                AEditor := edSpinEdit ;
            end;
            //CntAggrConvParaIs                          //704E  �ڴ������±�
            //CntAggrConvParaIs                          //704F  �ڴ������±�
            CntAggrConvParaIsAggreMode          :    //7050 ����������ʽ �ڴ������±�}
            begin
                AEditor := edSpinEdit ;
            end;
        end;
    end
    else
    begin
        AEditor := edNone ;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.AdvStrGdAggrBinAttriCellsChanged(
  Sender: TObject; R: TRect);
begin
    AggConcPrarChanged := True;
end;

procedure TFrmAggrConceyorHopperAttr.sBtBtnOKClick(Sender: TObject);
var
    WtInstrValid : Boolean;
begin
    if AggConcPrarChanged then
    begin
        if messagebox(getfocus, Pchar('�Ƿ񱣴�Բ������޸�'), 'ϵͳѯ��', MB_YESNO) = idYES then
        begin
            sProgressBar1.Visible := True;
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsGetNewParaVaue;    //�������Ͳ����޸Ĳ��� = ��ȡ�µĲ���ֵ
            SaveParaModifyOfAggrConc(WtInstrValid);    //��������޸�
            //Showmessage('��ȡ�µĲ���ֵ');
            //sProgressBar1.Position := 20;
            //Showmessage('�·��������Ǳ�');
            //sProgressBar1.Position := 40;
            //Showmessage('��������ݿ�');
            //sProgressBar1.Position := 80;
            //Showmessage('�����ڴ�');
            //sProgressBar1.Position := 100;
            //sProgressBar1.Visible := True;
            //Self.Close;
        end;
    end
    else
    begin
        Self.Close;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.SaveParaModifyOfAggrConc(var WtInstrValid : Boolean);    //��������޸�
var
    AddrInInstr : Integer;
    DataCount   : Integer;
    DataValue   : array[1..8] of Integer;
    ExRstSaveDb : Boolean;
begin
    case StepsOfAggrConcParaModify of
        CntStepsOfAggrConcParaMfyIsIdle           :     //����
        begin

        end;

        CntStepsOfAggrConcParaMfyIsGetNewParaVaue :     //��ȡ�µĲ���ֵ
        begin
            GetNewAggrConcParaValue();
            sProgressBar1.Position := 20;
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtAggrModeToIns;    //д��������ģʽ���Ǳ�
            WtInstrValid := False;
        end;

        CntStepsOfAggrConcParaMfyIsWtAggrModeToIns :    //д��������ģʽ���Ǳ�
        begin
            if AggregateConveyorMode = CntAggregateConveyorBelt then    //бƤ������
            begin
                //д$0750��ַ
                WtAWordToInstument1MscommBuf(MscmWaitRecBufPtInUntAggrConcAttr, $0750, $0000);              //дһ���ֵ�ͨѶ������
                WtInstrValid := True;
            end
            else
            begin
                StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns ;    //д���ϲ�����1���Ǳ�
                WtInstrValid := False;
            end;
            sProgressBar1.Position := 40;
        end;

        CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns :
        begin
            //д$0741 ����6������
            DataValue[1] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidDschDelay].Value;       //$7041 �д����ӳ�Ͷ��ʱ�� �ڴ������±�
            DataValue[2] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidSndDschDelay].Value;    //$7042 �ڶ����ӳ�Ͷ��ʱ�� �ڴ������±�
            DataValue[3] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidDschTm].Value;          //$7043 �д���Ͷ��ʱ�� �ڴ������±�
            DataValue[4] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidSndDschTm].Value;       //$7044 �ڶ��ο���ʱ�� �ڴ������±�
            DataValue[5] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidLoadContinue].Value;    //$7045 �д���װ�ϳ���ʱ�� �ڴ������±�
            DataValue[6] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreBeltStopDelay].Value;      //$7046 ƽƤ���ӳ�ֹͣʱ�� �ڴ������±�
            WtWordSToInstucment1MscommBuf(MscmWaitRecBufPtInUntAggrConcAttr, $0741, DataValue, $0006);      //д�������ͨѶ������

            WtInstrValid := True;
            sProgressBar1.Position := 60;
        end;

        CntStepsOfAggrConcParaMfyIsWtParaArray2ToIns :
        begin
            //д0748 ����6������
            DataValue[1] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfAggreMidDschPauseTm].Value;       //7048 ���ο��ż�� �ڴ������±�
            DataValue[2] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfSAND_WT            ].Value;    //7049 ɰ��ʯ����ֵ �ڴ������±�
            DataValue[3] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfVibraDelay         ].Value;          //704A �ӳ���ʱ�� �ڴ������±�
            DataValue[4] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfVibraRunTm         ].Value;       //704B ��ʱ�� �ڴ������±�
            DataValue[5] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfVibraSTP           ].Value;    //  704C  �񶯼��ʱ�� �ڴ������±�
            DataValue[6] := AggregateConvParaInUntAggrConcAttr[CntBufIndexOfRunMaxTm           ].Value;      //704D ������ʱ�� �ڴ������±�
            WtWordSToInstucment1MscommBuf(MscmWaitRecBufPtInUntAggrConcAttr, $0748, DataValue, $0006);      //д�������ͨѶ������

            WtInstrValid := True;
            sProgressBar1.Position := 70;
        end;

        CntStepsOfAggrConcParaMfyIsWtAggrDschIntervalToIns :    //д���ϳ�ж�Ϸ����ʱ�䵽�Ǳ�
        begin
            if AggregateConveyorMode = CntAggregateConveyorElevator then      //������
            begin
                //704F  ���ϳӶ��ж���ż��ʱ��
                WtAWordToInstument1MscommBuf(MscmWaitRecBufPtInUntAggrConcAttr, $074F, $0000);              //дһ���ֵ�ͨѶ������
                WtInstrValid := True;
            end
            else
            begin
                StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsEnd;
                WtInstrValid := False;
            end;
            sProgressBar1.Position := 80;
        end;

        CntStepsOfAggrConcParaMfyIsEnd                     :    //д�������Ͳ�������
        begin
            
            SaveNewAggrConcParaToDb(ExRstSaveDb);
            if ExRstSaveDb then
            begin
                sProgressBar1.Position := 90;
                WtInstrValid := False;
                SaveNewAggrConcParaToMemory();
                sProgressBar1.Position := 100;
                StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsIdle;
                Self.Close;
            end
            else
            begin
                Showmessage('�������ݿ�ʧ�ܣ������±���');
                sProgressBar1.Visible := False;
            end;

        end;

        else
        begin
            WtInstrValid := False;
        end;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.GetNewAggrConcParaValue();
var
    i : Integer;

    ParaIdInParaInfoArray : Integer;     //������Ϣ���� ID ֵ
    ParaIdInParaValueArray : Integer;    //����ֵ���� ID ֵ

    NewParaValueI : Integer;
begin
    for i:=1 to AdvStrGdAggrBinAttri.RowCount -1 do
    begin
        if trim(AdvStrGdAggrBinAttri.Cells[5, i]) = '' then Continue;

        try
            ParaIdInParaInfoArray := StrToInt(Trim(AdvStrGdAggrBinAttri.Cells[5, i]));
        except
            ParaIdInParaInfoArray := 0;
        end;

        if (ParaIdInParaInfoArray <=0) or (ParaIdInParaInfoArray > CntAggregateConvParaCount ) then
        begin
            Showmessage('��Ч�Ĳ���');
            Continue;
        end;

        case CntAggreConvParaInfo[ParaIdInParaInfoArray].ParaCode of
            {�����Ͳ���}
            CntAggrConvParaIsMidBinDschDelay    ,     //$7041 �������Ͳ����� �д����ӳ�Ͷ��ʱ��
            CntAggrConvParaIsMidBinSndDschDelay ,     //$7042 �������Ͳ����� �д��ֶ����ӳ�Ͷ��ʱ��
            CntAggrConvParaIsMidBinDschLong     ,     //$7043 �������Ͳ����� �д���Ͷ��ʱ��
            CntAggrConvParaIsMidBinSndDschLong  ,     //$7044 �������Ͳ����� �д��ֶ���Ͷ��ʱ��
            CntAggrConvParaIsMidBinLoadContinue ,     //$7045 �������Ͳ����� �д���װ�ϳ���ʱ��(��������/�����ӳ�ʱ��)
            CntAggrConvParaIsLevelBeltStopDelay ,     //$7046 �������Ͳ����� ƽƤ���ӳ�ֹͣʱ��
                                                 //$7047
            CntAggrConvParaIsMidBinDschPauseTm  ,     //$7048 �������Ͳ����� ���ο��ż��
            CntAggrConvParaIsSAND_WT            ,     //$7049 �������Ͳ����� ɰ��ʯ����ֵ
            CntAggrConvParaIsMidBinVibraDelay   ,    //$704A �������Ͳ����� �ӳ���ʱ��
            CntAggrConvParaIsMidBinVibraRunTm   ,    //$704B �������Ͳ����� ��ʱ��
            CntAggrConvParaIsMidBinVibraSTP     ,    //$704C �������Ͳ����� �񶯼��ʱ��
            CntAggrConvParaIsHopprRunMaxTm      ,    //$704D �������Ͳ����� ������ʱ��
            //CntAggrConvParaIs                          //704E  �������Ͳ�����
            //CntAggrConvParaIs                          //704F  �������Ͳ�����
            CntAggrConvParaIsAggreMode          :    //7050 �������Ͳ����� ����������ʽ
            begin
                ParaIdInParaValueArray := CntAggreConvParaInfo[ParaIdInParaInfoArray].BufIndex;
                try
                    NewParaValueI := StrToInt( Trim(AdvStrGdAggrBinAttri.Cells[3, i]) );
                except
                    NewParaValueI := 0;
                end;
                AggregateConvParaInUntAggrConcAttr[ParaIdInParaValueArray].Value := NewParaValueI;
            end;

        end;
    end;
    //
end;

procedure TFrmAggrConceyorHopperAttr.SaveNewAggrConcParaToDb(var ExDbRslt : boolean);
var
    Qry : TADOquery;
    ParaIdInValueArray : Integer;
    ParaValue          : Integer;
    ParaCodeInDb       : String[20];
    i : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;

    try
        FrmMain.ADOConnection.BeginTrans;
        for i:=1 to CntAggregateConvParaCount do
        begin
            if CntAggreConvParaInfo[i].CodeInDb = '' then Continue ;

            ParaIdInValueArray := CntAggreConvParaInfo[i].BufIndex ;
            ParaValue          := AggregateConvParaInUntAggrConcAttr[ParaIdInValueArray].Value;
            ParaCodeInDb       := CntAggreConvParaInfo[i].CodeInDb;
            Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Text := 'update AggreConvdPara set AggreConvdPara.Value =' + inttostr(ParaValue) + ' ' + 'where AggreConvdPara.Code=' + '''' + ParaCodeInDb + '''';
            Qry.ExecSQL;

        end;
        FrmMain.ADOConnection.CommitTrans;
        ExDbRslt := True;
    except
        FrmMain.ADOConnection.RollbackTrans;
        ExDbRslt := False;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.SaveNewAggrConcParaToMemory();
var
    i : integer;
begin
    for i:=1 to CntAggregateConvParaCount do
    begin
        AggregateConvPara[PMAggrHopperId][i].Value := AggregateConvParaInUntAggrConcAttr[i].Value;
    end;
end;

procedure TFrmAggrConceyorHopperAttr.sBitBtn4Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmAggrConceyorHopperAttr.Timer1Timer(Sender: TObject);
var
    WtInstrValid : Boolean;
begin
    Timer1.Enabled := False;

    case MsCommStateInUntAggrConcAttr of
        CntMsCmStaInUntAggConcAttrIsIdle      :         //����
        begin
            if StepsOfAggrConcParaModify <> CntStepsOfAggrConcParaMfyIsIdle then    //�������Ͳ����޸Ĳ���
            begin
                SaveParaModifyOfAggrConc(WtInstrValid);    //��������޸�
                if WtInstrValid then
                begin
                    MscmTmrInUntAggConcAttr      := 0;
                    MscmSendCmdInUntAggrConcAttr := CntMscmSndCmdInUtAggConAttrIsSaveNewPara;    //���͵��Ǳ�������Ǳ����µĲ���ֵ

                    MsCommStateInUntAggrConcAttr := CntMsCmStaInUntAggConcAttrIsWaitReply;
                end;
            end
            else
            begin

            end;
        end;

        CntMsCmStaInUntAggConcAttrIsWaitReply :         //�ȴ���λ��Ӧ��
        begin
            MscmTmrInUntAggConcAttr := MscmTmrInUntAggConcAttr + MscmTmrInterValInUntAggConcAttr;

            if Instruction1ReceiveBuf[MscmWaitRecBufPtInUntAggrConcAttr].Active then
            begin
                if (Instruction1ReceiveBuf[MscmWaitRecBufPtInUntAggrConcAttr].ReceiveCmd and $80 ) = $00 then
                begin
                    MsCmRecProgInUtAggConcAttr();
                    MsCommStateInUntAggrConcAttr := CntMsCmStaInUntAggConcAttrIsIdle
                end
                else
                begin
                    case MscmSendCmdInUntAggrConcAttr of
                        CntMscmSndCmdInUtAggConAttrIsSaveNewPara :
                        begin
                            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsIdle ;       //�������Ͳ����޸Ĳ���
                            showmessage('д��λ������ʧ�ܣ������·���');
                        end;

                        else
                        begin
                            Showmessage('�������ʹ���ͨѶʧ��!');
                        end;
                    end;

                    MsCommStateInUntAggrConcAttr := CntMsCmStaInUntAggConcAttrIsIdle;    //ͨѶ״̬
                end;
                Instruction1ReceiveBuf[MscmWaitRecBufPtInUntAggrConcAttr].Active := False;
            end
            else if MscmTmrInUntAggConcAttr >= 3000 then
            begin
                case MscmSendCmdInUntAggrConcAttr of
                    CntMscmSndCmdInUtAggConAttrIsSaveNewPara :
                    begin
                        StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsIdle ;       //�������Ͳ����޸Ĳ���

                        showmessage('д��λ������ʧ�ܣ������·���');
                    end;

                    else
                    begin
                        Showmessage('�������ʹ���ͨѶʧ��!');
                    end;
                end;

                MsCommStateInUntAggrConcAttr := CntMsCmStaInUntAggConcAttrIsIdle;    //ͨѶ״̬
            end;
        end;
    end;

    Timer1.Enabled := True;
end;

procedure TFrmAggrConceyorHopperAttr.MsCmRecProgInUtAggConcAttr();
begin
    case MscmSendCmdInUntAggrConcAttr of    //������������
        CntMscmSndCmdInUtAggConAttrIsSaveNewPara :    //���͵��Ǳ�������Ǳ����µĲ���ֵ
        begin
            MscmRecProgForSaveNewPara();
        end;
    end;

end;

procedure TFrmAggrConceyorHopperAttr.MscmRecProgForSaveNewPara();
begin
    case StepsOfAggrConcParaModify of    //�������Ͳ����޸Ĳ���
        CntStepsOfAggrConcParaMfyIsIdle                    :     //����
        begin

        end;
        CntStepsOfAggrConcParaMfyIsGetNewParaVaue          :     //��ȡ�µĲ���ֵ
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtAggrModeToIns;
        end;
        CntStepsOfAggrConcParaMfyIsWtAggrModeToIns         :    //д��������ģʽ����
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns;
        end;
        CntStepsOfAggrConcParaMfyIsWtParaArray1ToIns       :    //д���ϲ�����1���Ǳ�
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtParaArray2ToIns;
        end;
        CntStepsOfAggrConcParaMfyIsWtParaArray2ToIns       :    //д���ϲ�����2���Ǳ�
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsWtAggrDschIntervalToIns;
        end;
        CntStepsOfAggrConcParaMfyIsWtAggrDschIntervalToIns :    //д���ϳ�ж�Ϸ����ʱ�䵽�Ǳ�
        begin
            StepsOfAggrConcParaModify := CntStepsOfAggrConcParaMfyIsEnd;
        end;
        CntStepsOfAggrConcParaMfyIsEnd                     :    //д�������Ͳ�������
        begin
            //StepsOfAggrConcParaModify :=
        end;
    end;
end;

end.
