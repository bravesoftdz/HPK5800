unit UnitWeigherAttribute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ComCtrls, sPageControl, Grids,
  AdvObj, BaseGrid, AdvGrid, sGroupBox, sEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, Mask, sMaskEdit, ExtCtrls, math, sSpinEdit, UnitGlobeVar,
  acProgressBar, sPanel, DB, ADODB;

type
  TFrmWeigherAttribute = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    BtnReadDb: TsBitBtn;
    BtnRestore: TsBitBtn;
    sBitBtn4: TsBitBtn;
    AdvStrGdWeigAttri: TAdvStringGrid;
    Label1: TLabel;
    sEtWeigherName: TsEdit;
    GpDischPreact: TsGroupBox;
    Label2: TLabel;
    sGroupBox2: TsGroupBox;
    Label3: TLabel;
    sEtLoadCell: TsEdit;
    Label4: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    sEtDschPre: TsEdit;
    Memo1: TMemo;
    sBtBtnOK: TsBitBtn;
    sPanel1: TsPanel;
    sProgressBar1: TsProgressBar;
    ADOQuery1: TADOQuery;
    Label6: TLabel;
    sEtWeigherId: TsEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvStrGdWeigAttriGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Timer1Timer(Sender: TObject);
    procedure AdvStrGdWeigAttriGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure AdvStrGdWeigAttriCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure AdvStrGdWeigAttriComboObjectChange(Sender: TObject; ACol,
      ARow, AItemIndex: Integer; ASelection: String; AObject: TObject);
    procedure AdvStrGdWeigAttriComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String);
    procedure AdvStrGdWeigAttriCellsChanged(Sender: TObject; R: TRect);
    procedure sEtDschPreKeyPress(Sender: TObject; var Key: Char);
    procedure sBtBtnOKClick(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    CanEditWgrAttr : Boolean;

    WeigParaInUtWeigAttr : array[1..CntWeigherParaCount] of WeigherParaRd ;
    WeigDschPreChanged ,
    WeigParaChanged : Boolean;

    procedure DspMscommReceiveData();

    procedure IniWeigParaInfoToUtWeigAttr();    //��ʼ���Ʋ�����Ϣ������

    procedure WtWeigherParaToInstruction();     //���ͳƲ�����������
    procedure UpdateWeigherParaInBuf();         //�����ڴ��еĳƲ���
    procedure SaveNewWeigherParaToDb();         //�����µĳƲ��������ݿ���

    procedure DspWeigParaToUtWeigAttr(ParaInfoId : Integer; GrdRow, GrdCol : Integer);    //��ʾ�Ʋ���������

    procedure InitPermissonInWgrAttr();

  public
    { Public declarations }


  end;

var
  FrmWeigherAttribute: TFrmWeigherAttribute;

  MscommWaitPtInUtWeigAttr : Integer;    //�����Ե�Ԫ�е�ͨѶ�ȴ�ָ��

  MsCommStateInUtWeigAttr : Integer;     //�����Ե�Ԫ�е�ͨѶ״̬
Const
  CntMsCommStateInUtWeigAttrIsIdle      = 0;    //ͨѶ����
  CntMsCommStateInUtWeigAttrIsWaitReply = 1;    //ͨѶ�ȴ�Ӧ��

var
  SendDataToInstuctmentInUtWeigAttr : Boolean;

var
  MsCommTmrUtWeigAttr : Integer;               //ͨѶ��ʱ��

var
  MsCommCommandNameInUtWeigAttr : Integer;        //ͨѶ��������
Const
  CntMscCmdNmInUtWeigAttrIsRdDschPre  = 1;        //����ж�����
  CntMscCmdNmInUtWeigAttrIsRdLoad     = 2;        //���ƴ������ź�
  CntMscCmdNmInUtWeigAttrIsWtDschPre  = 3;        //дж�����
  CntMscCmdNmInUtWeigAttrIsWtWeigPara = 4;        //д�Ʋ���
var
  WeigDecimalInUtWeigAttr : Integer;              //�������е�С��λ������ʱ��

var
    WtWeighParaSteps : Integer;                    //д�Ʋ���


implementation

{$R *.dfm}

uses  UnitGlobeSub, UnitRWInstrument1MscommBuf, UnitMain,UnitPersonnelMangement ;

procedure TFrmWeigherAttribute.FormShow(Sender: TObject);
var
   i : Integer;
    //RowCount : Integer;
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;

    Self.Caption := WeigherInfo[PmWeigherId].Name + ' ' + '��������';

    //����ͨѶ����
    MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsRdDschPre;      //����ж�����
    Instruction1ReadWeigherDischPreAct(PmWeigherId, MscommWaitPtInUtWeigAttr);    //��ȡ�ó�ж�����ֵ
    if (MscommWaitPtInUtWeigAttr <0) or (MscommWaitPtInUtWeigAttr >= CntCommunicateBufLen) then Showmessage('��Ч�ķ�������');
    MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
    MsCommTmrUtWeigAttr := 0;
    Timer1.Enabled := True;

    sEtWeigherName.Text := WeigherInfo[PmWeigherId].Name ;
    sEtWeigherId.Text := inttostr( PmWeigherId ) ;

    WeigDecimalInUtWeigAttr := WeigherPara[PmWeigherId][CntWeigherDecimalIndex].Value ;

    AdvStrGdWeigAttri.Cells[1 ,0] := '���';
    AdvStrGdWeigAttri.Cells[2 ,0] := '��������';
    AdvStrGdWeigAttri.Cells[3 ,0] := '����ֵ';
    AdvStrGdWeigAttri.Cells[4 ,0] := '��λ' ;

    for i:= 1 to CntWeigherParaCount do
    begin
        WeigParaInUtWeigAttr[i] := WeigherPara[PmWeigherId][i];
    end;

    IniWeigParaInfoToUtWeigAttr();    //��ʼ���Ʋ�����Ϣ������

    WeigDschPreChanged := False;
    WeigParaChanged := False;
    SendDataToInstuctmentInUtWeigAttr := False;
end;

procedure TFrmWeigherAttribute.IniWeigParaInfoToUtWeigAttr();    //��ʼ���Ʋ�����Ϣ������
var
    i, k          : Integer;
    BeginRow,
    RowPt         : Integer;
    ParaFlags     : String;
    ParaInfoIndex : Integer;
begin
    AdvStrGdWeigAttri.Clear;

    {���ܿ��Ʋ���}
    AdvStrGdWeigAttri.Cells[1, 1] := 'ж�Ͽ��Ʋ���';
    BeginRow := 1;
    RowPt := 1;
    for i:= 1 to CntWeigherParaCount do
    begin
        ParaFlags := WeigherPara[PmWeigherId][i].Flags;
        if pos('b', ParaFlags) > 0 then
        begin
            if pos('v',ParaFlags ) > 0 then    //��������
            begin
                if WeigherInfo[PmWeigherId].DischVibrator then
                begin
                    if pos('t', ParaFlags) > 0 then
                    begin
                        if (WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value = 0) then    //��ʱ����
                        begin
                            GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                            AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                            AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                            DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                            AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                            AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                            RowPt := RowPt +1;
                        end;
                    end
                    else if pos('f', ParaFlags) >0 then
                    begin
                        if (WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value <> 0) then    //��������
                        begin
                            GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                            AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                            AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                            DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                            AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                            AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                            RowPt := RowPt +1;
                        end;
                    end
                    else
                    begin
                        GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                        AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                        AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                        DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                        AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                        AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                        RowPt := RowPt +1;
                    end;
                end;
            end
            else
            begin
                GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                RowPt := RowPt +1;
            end;
        end;
    end;
    AdvStrGdWeigAttri.AddNode(BeginRow, RowPt);

    {���ܳƲ���}
    BeginRow := RowPt +1;
    AdvStrGdWeigAttri.Cells[1, BeginRow] := '�����ò���';
    RowPt := 1;
    for i:= 1 to CntWeigherParaCount do
    begin
        ParaFlags := WeigParaInUtWeigAttr[i].Flags;
        if pos('a', ParaFlags) > 0 then
        begin
            if pos('d', ParaFlags) > 0 then
            begin
                if (WeigherInfo[PmWeigherId].LdDsIsPumpAndValve = True) then    //���ϡ�ж�ϱ÷�����
                begin
                    GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                    AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                    AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                    DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                    AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                    AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                    RowPt := RowPt +1;
                end;
            end
            else if pos('f', ParaFlags) > 0 then
            begin
                if (WeigherInfo[PmWeigherId].LoadIsFine = True) then            //˫������
                begin
                    GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                    AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                    AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                    DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                    AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                    AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                    RowPt := RowPt +1;
                end;
            end
            else
            begin
                GetWeigParaInfoSubForSunInMemory(i, ParaInfoIndex) ;
                AdvStrGdWeigAttri.Cells[1, BeginRow +RowPt] := IntToStr(RowPt);
                AdvStrGdWeigAttri.Cells[2, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].ParaName ;   //WeigherPara[PmWeigherId][i];
                DspWeigParaToUtWeigAttr(ParaInfoIndex, BeginRow +RowPt, 3);
                AdvStrGdWeigAttri.Cells[4, BeginRow +RowPt] := CntWeigherParaInfo[ParaInfoIndex].Units ;
                AdvStrGdWeigAttri.Cells[5, BeginRow +RowPt] := IntToStr(ParaInfoIndex);
                RowPt := RowPt +1;
            end;
        end;
    end;
    AdvStrGdWeigAttri.AddNode(BeginRow, RowPt);

    AdvStrGdWeigAttri.RowCount := BeginRow + RowPt +1;
end;

procedure TFrmWeigherAttribute.DspWeigParaToUtWeigAttr(ParaInfoId : Integer; GrdRow, GrdCol : Integer);    //��ʾ�Ʋ���������
var
    ParaDecimal : Integer;
    paraValue   : Integer;
begin
    case CntWeigherParaInfo[ParaInfoId].ParaCode of
        CntWeigParaIsCap :          // ������
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(WeigDecimalInUtWeigAttr) + 'f', [paraValue / power(10, WeigDecimalInUtWeigAttr)]);
        end;

        CntWeigParaIsDivision :     // �Ʒֶ�ֵ
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d', [paraValue]);
        end;

        CntWeigParaIsTrack    :     // �����ٷ�Χ
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [paraValue ]);
        end;

        CntWeigParaIsDvSep    :     // ж�ϱ÷����ʱ�䣨1λ����С����
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsIDT      :     // �ӳ��ж����ʱ�䣨��С����
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsZeroBand    :     // ��λ��Χ
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(WeigDecimalInUtWeigAttr) + 'f', [paraValue / power(10, WeigDecimalInUtWeigAttr)]);
        end;

        CntWeigParaIsFilter      :     // �����˲�ϵ��
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsDecimal     :     // ��С��λ��
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsTRG         :     // �ʲΧ
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsTDC         :     // �ӳ�ж�Ͽ���ʱ�䣨��С����
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsDlyUld      :     // �ӳ�Ͷ��ʱ��
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsSXXLZL      :     // ˳��ж��ʣ������
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsUDC         :     // �۳� 0����   1������
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '��'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '��';
        end;

        //CntWeigParaIsRemain      = $0E;     // ��������
        CntWeigParaIsPvSep       :     // ���ϱ÷����ʱ�䣨1λ����С����
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        //CntWeigParaIs         = $10
        //CntWeigParaIs          = $11

        CntWeigParaIsUFC         :     // ���������ʽ 0���̶� 1���Զ�
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '�̶����'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '�Զ�����';
        end;

        //CntWeigParaIs          = $13

        CntWeigParaIsSrtDly      :     // �ӳ�����ʱ��
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        CntWeigParaIsNVL         :     // ����  0����  1�� ��
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '��'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '��';
        end;

        //CntWeigParaIs          = $16;
        //CntWeigParaIs          = $17;
        //CntWeigParaIs          = $18;
        //CntWeigParaIs          = $19;

        CntWeigParaIsZFM         :   //19 �����������ʽ 1��   0��
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := 'ͬʱ���'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '�ȸ�����';
        end;

        //CntWeigParaIs           = $1B

        CntWeigParaIsPLBJX       :   //1B ����������
        begin
            ParaDecimal := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Decimal;
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.' + inttostr(ParaDecimal) + 'f', [paraValue / power(10, ParaDecimal)]);
        end;

        //CntWeigParaIs           = $1D;
        //CntWeigParaIs           = $1E;
        //CntWeigParaIs           = $1F;
        //CntWeigParaIs           = $20;

        CntWeigParaIsPLBJ        :   // ����������
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '������'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '����';
        end;

        CntWeigParaIsINS_QIV_MDL :   // ��ģʽ
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            if paraValue = 0 then
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '��ʱ����'
            else
                AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := '��������';
        end;

        CntWeigParaIsINS_QIV_DLY :   // �ӳ���ʱ��
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsINS_QIV_LST :   // ��ʱ��
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        CntWeigParaIsINS_QIV_STP :   // �񶯼��ʱ��
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        //CntWeigParaIs            = $26;

        CntWeigParaIsINS_QIV_FLW :   //�񶯱߼�����
        begin
            paraValue   := WeigParaInUtWeigAttr[CntWeigherParaInfo[ParaInfoId].BufIndex].Value;
            AdvStrGdWeigAttri.Cells[GrdCol, GrdRow] := format('%.d' , [ paraValue ]);
        end;

        else
            ;
    end;
end;

procedure TFrmWeigherAttribute.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmWeigAttrCrt := False;
    Action := caFree;
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
    if ARow = 0 then
    begin
         HAlign := taCenter;
    end;

    if ACol = 1 then
    begin
        HAlign := taCenter;
    end;

    VAlign := vtaCenter ;

end;

procedure TFrmWeigherAttribute.Timer1Timer(Sender: TObject);
var
    DschPreF : Double;
    DschPreI : Integer;
begin
    Timer1.Enabled := False;

    case MsCommStateInUtWeigAttr of
        CntMsCommStateInUtWeigAttrIsIdle :    //ͨѶ����
        begin
            if SendDataToInstuctmentInUtWeigAttr then
            begin
                if WeigDschPreChanged then    //�·��µ�ж�����ֵ
                begin
                    DschPreF := StrToFloat(Trim(sEtDschPre.Text));
                    DschPreI := Trunc(RoundTo(DschPreF * Power(10, WeigherPara[PmWeigherId][CntWeigherDecimalIndex].Value), -0)) ;
                    MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtDschPre ;         //дж�����
                    WtAWordToInstument1MscommBuf(MscommWaitPtInUtWeigAttr, $0790 + (PmWeigherId-1), DschPreI) ;              //дж�����ֵ�����ͻ�����
                    WeigDschPreChanged := False;

                    MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtDschPre ;    //д��ж�����ֵ
                    MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
                    MsCommTmrUtWeigAttr := 0;
                end
                else if WeigParaChanged then
                begin
                    if WtWeighParaSteps <= 5 then
                    begin
                        sProgressBar1.Position :=10 + WtWeighParaSteps * 10;
                        WtWeigherParaToInstruction();    //д�Ʋ�����������
                        WtWeighParaSteps := WtWeighParaSteps +1;
                        MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsWtWeigPara;   //д�Ʋ���
                        MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
                        MsCommTmrUtWeigAttr := 0;
                    end
                    else
                    begin
                        {�����ڴ��еĳƲ���}
                        UpdateWeigherParaInBuf();
                        sProgressBar1.Position := 60 +20;

                        {�����µĳƲ��������ݿ���}
                        SaveNewWeigherParaToDb();
                        sProgressBar1.Position := 100;

                        Self.Close;
                    end;
                end
                else
                begin
                    sProgressBar1.Position := 100; 
                    SendDataToInstuctmentInUtWeigAttr := False;
                    Self.Close;
                end;
            end
            else
            begin
                MsCommCommandNameInUtWeigAttr := CntMscCmdNmInUtWeigAttrIsRdLoad ;    //���ƴ������ź�
                MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsWaitReply;
                MsCommTmrUtWeigAttr := 0;
                Instruction1ReadWeigherLoadCellValue(PmWeigherId, MscommWaitPtInUtWeigAttr) ;    //ͨѶ��ȡ�������ź�;
            end;
        end;

        CntMsCommStateInUtWeigAttrIsWaitReply :    //�ȴ�����
        begin
            if Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].Active then
            begin
                DspMscommReceiveData();
                Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].Active := False;
                MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsIdle ;
            end
            else
            begin
                MsCommTmrUtWeigAttr := MsCommTmrUtWeigAttr + Timer1.Interval;
                if MsCommTmrUtWeigAttr > 5000 then
                begin
                    if SendDataToInstuctmentInUtWeigAttr then
                    begin
                        if messagebox(getfocus, pchar('�����µĲ�����������ʧ��!'), 'ϵͳ��ʾ', MB_OK) = idOK then
                        begin
                            SendDataToInstuctmentInUtWeigAttr := False;
                            MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsIdle ;
                        end;
                    end
                    else
                    begin
                        MsCommStateInUtWeigAttr := CntMsCommStateInUtWeigAttrIsIdle ;
                    end;
                end;
            end;
        end;
    end;

    Timer1.Enabled := True;
end;

procedure TFrmWeigherAttribute.WtWeigherParaToInstruction();
var
    SendData : Array[0..$0E] of Integer;
    //SendDataCount : Integer;
    i : Integer;
    ParaBuId : Integer;
begin
    case WtWeighParaSteps of
        0:    //д�ƻ�������
        begin
            for i:=1 to $0D do
            begin
                ParaBuId := CntWeigherParaInfo[i].BufIndex;
                SendData[i-1] := WeigParaInUtWeigAttr[ParaBuId].Value;
            end;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0400 + (PmWeigherId-1) *$0020, SendData, $0D);
        end;

        1:    //д���ϱ÷����ʱ�䣨1λ����С����
        begin
            ParaBuId := CntWeigherPvSepIndex;
            SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $040E + (PmWeigherId-1) *$0020, SendData, 1);
        end;

        2:    //д���������ʽ 0���̶� 1���Զ�
        begin
            ParaBuId := CntWeigherUFCIndex;
            SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0411 + (PmWeigherId-1) *$0020, SendData, 1);
        end;

        3:    //д[�ӳ�����ʱ��]��[����  0����  1�� ��]
        begin
            ParaBuId := CntWeigherSrtDlyIndex;
            SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;
            ParaBuId := CntWeigherNVLIndex;
            SendData[1] := WeigParaInUtWeigAttr[ParaBuId].Value;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0413 + (PmWeigherId-1) *$0020, SendData, 2);
        end;

        4:    //д�������������ʽ 1��   0�����������������������ޡ�
        begin
            ParaBuId := CntWeigherZFMIndex;
            SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;

            //ParaBuId := ;
            SendData[1] := 0;

            ParaBuId := CntWeigherPLBJXIndex;
            SendData[2] := WeigParaInUtWeigAttr[ParaBuId].Value;

            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0419 + (PmWeigherId-1) *$0020, SendData, 3);
        end;

        5:    //д��ж���񶯲���
        begin
            if WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value = 0 then    //��ʱ����
            begin
                ParaBuId := CntWeigherINS_QIV_DLYIndex;            //�ӳ���ʱ��
                SendData[0] := WeigParaInUtWeigAttr[ParaBuId].Value;
                ParaBuId := CntWeigherINS_QIV_LSTIndex;            //��ʱ��
                SendData[1] := WeigParaInUtWeigAttr[ParaBuId].Value;
                ParaBuId := CntWeigherINS_QIV_STPIndex;            //�񶯼��ʱ��
                SendData[2] := WeigParaInUtWeigAttr[ParaBuId].Value;
                //ParaBuId := ;
                SendData[3] := 0;
                //ParaBuId := CntWeigherINS_QIV_FLWIndex;
                SendData[4] := 0;
            end
            else
            begin
                //ParaBuId := CntWeigherINS_QIV_DLYIndex;            //�ӳ���ʱ��
                SendData[0] := 0;
                //ParaBuId := CntWeigherINS_QIV_LSTIndex;            //��ʱ��
                SendData[1] := 0;
                //ParaBuId := CntWeigherINS_QIV_STPIndex;            //�񶯼��ʱ��
                SendData[2] := 0;
                //ParaBuId := ;
                SendData[3] := 0;
                ParaBuId := CntWeigherINS_QIV_FLWIndex;            //�񶯱߼�����
                SendData[4] := WeigParaInUtWeigAttr[ParaBuId].Value;;
            end;
            WtWordSToInstucment1MscommBuf(MscommWaitPtInUtWeigAttr, $0A40 + (PmWeigherId-1) *6, SendData, 5)
        end;
    end;
end;

procedure TFrmWeigherAttribute.UpdateWeigherParaInBuf();    //�����ڴ��еĳƲ���
var
   i : Integer ;
begin
    for i:=1 to CntWeigherParaCount do
    begin
        WeigherPara[PmWeigherId][i] := WeigParaInUtWeigAttr[i];
    end;
end;

procedure TFrmWeigherAttribute.SaveNewWeigherParaToDb();    //�����µĳƲ��������ݿ���
var
    i : Integer;
begin
    ADOQuery1.Close;
    try
        FrmMain.ADOConnection.BeginTrans;
        for i:=1 to CntWeigherParaCount do
        begin
            if Trim(CntWeigherParaInfo[i].CodeInDb) = '' then Continue;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'update InstrumentPara set ParaValue=' +inttostr(WeigherPara[PmWeigherId][i].Value) + ' where InstrumentId=' + inttostr(PmWeigherId) + ' and Code=' + '''' + CntWeigherParaInfo[i].CodeInDb + '''';
            ADOquery1.ExecSQL;
        end;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans
    end;
end;

procedure TFrmWeigherAttribute.DspMscommReceiveData();
var
    PreAct : Integer;
    WeightPoint : Integer;
    LoadCellValue : Integer;
begin
    case MsCommCommandNameInUtWeigAttr of
        CntMscCmdNmInUtWeigAttrIsRdDschPre :
        begin
            PreAct := Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].ReceiveByte[0] *$100
                    + Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].ReceiveByte[1] ;
            WeightPoint := WeigherPara[PmWeigherId][CntWeigherDecimalIndex].Value;
            sEtDschPre.Text := Format('%.' + inttostr(WeightPoint) + 'f',[PreAct / power(10,WeightPoint)]);
        end;

        CntMscCmdNmInUtWeigAttrIsRdLoad :
        begin
            LoadCellValue := Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].ReceiveByte[0] *$100
                           + Instruction1ReceiveBuf[MscommWaitPtInUtWeigAttr].ReceiveByte[1] ;
            sEtLoadCell.Text := Format('%.2f', [LoadCellValue /100]);
        end;
    end;
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
var
    ParaInfoId : Integer;
    i : Integer ;
Const
    WeighCapItems : Array[1..14] of Integer =
    ( 500  , 1000 , 1200 , 1500 , 2000 , 2500 , 3000 , 4000 ,
      5000 , 60000, 8000 , 10000, 20000, 30000 );
begin
    if ACol = 3 then
    begin
        if Trim(AdvStrGdWeigAttri.Cells[5, ARow]) <> '' then
        begin
            ParaInfoId := StrToInt(Trim(AdvStrGdWeigAttri.Cells[5, ARow]));

            case CntWeigherParaInfo[ParaInfoId].ParaCode of
                CntWeigParaIsCap       :         // ������
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    for i:=1 to 14 do
                        AdvStrGdWeigAttri.AddComboString( format('%.' + inttostr(WeigDecimalInUtWeigAttr) + 'f', [WeighCapItems[i] / power(10, WeigDecimalInUtWeigAttr)]) );
                end;

                CntWeigParaIsDivision  :     // �Ʒֶ�ֵ
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('1');
                    AdvStrGdWeigAttri.AddComboString('2');
                    AdvStrGdWeigAttri.AddComboString('5');
                end;

                CntWeigParaIsTrack     :     // �����ٷ�Χ
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 8;
                end;

                CntWeigParaIsDvSep     :     // ж�ϱ÷����ʱ�䣨1λ����С����
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.0;
                end;

                CntWeigParaIsIDT       :     // �ӳ��ж����ʱ�䣨��С����
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.1;
                end;

                CntWeigParaIsZeroBand  :     // ��λ��Χ
                begin
                    if WeigDecimalInUtWeigAttr = 0 then
                    begin
                        AEditor := edSpinEdit;
                        AdvStrGdWeigAttri.SpinEdit.MaxValue := 500;
                        AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                    end
                    else
                    begin
                        AEditor := edFloatSpinEdit;
                        AdvStrGdWeigAttri.SpinEdit.Precision := WeigDecimalInUtWeigAttr;
                        AdvStrGdWeigAttri.SpinEdit.MaxValue := 500;
                        AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                        AdvStrGdWeigAttri.SpinEdit.IncrementFloat := 1 / power(10, WeigDecimalInUtWeigAttr);
                    end;
                end;

                CntWeigParaIsFilter      :     // �����˲�ϵ��
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 8;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsDecimal     :     // ��С��λ��
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('0');
                    AdvStrGdWeigAttri.AddComboString('1');
                    AdvStrGdWeigAttri.AddComboString('2');
                    AdvStrGdWeigAttri.AddComboString('3');
                end;

                CntWeigParaIsTRG         :     // �ʲΧ
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.1;
                end;
    
                CntWeigParaIsTDC         :     // �ӳ�ж�Ͽ���ʱ�䣨��С����
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.1;
                end;

                CntWeigParaIsDlyUld      :     // �ӳ�Ͷ��ʱ��
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 99;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsSXXLZL      :     // ˳��ж��ʣ������
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 2000;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsUDC         :     // �۳� 0����   1������
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('��');
                    AdvStrGdWeigAttri.AddComboString('��');
                end;

                //CntWeigParaIsRemain      = $0E;     // ��������

                CntWeigParaIsPvSep       :     // ���ϱ÷����ʱ�䣨1λ����С����
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 9.9;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.0;
                end;

                //CntWeigParaIs         = $10
                //CntWeigParaIs          = $11

                CntWeigParaIsUFC         :     // ���������ʽ 0���̶� 1���Զ�
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('�̶����');
                    AdvStrGdWeigAttri.AddComboString('�Զ�����');
                end;

                //CntWeigParaIs          = $13
                CntWeigParaIsSrtDly      :     // �ӳ�����ʱ��
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 20.0;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 3.0;
                end;

                CntWeigParaIsNVL         :     // ����  0����  1�� ��
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('��');
                    AdvStrGdWeigAttri.AddComboString('��');
                end;

                //CntWeigParaIs          = $16;
                //CntWeigParaIs          = $17;
                //CntWeigParaIs          = $18;
                //CntWeigParaIs          = $19;

                CntWeigParaIsZFM         :   //19 �����������ʽ 1��   0��
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('ͬʱ���');
                    AdvStrGdWeigAttri.AddComboString('�ȸ�����');
                end;

                //CntWeigParaIs           = $1B

                CntWeigParaIsPLBJX       :   //1B ����������
                begin
                    AEditor := edFloatSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.Precision := 1;
                    AdvStrGdWeigAttri.SpinEdit.MaxFloatValue := 100.0;
                    AdvStrGdWeigAttri.SpinEdit.MinFloatValue := 0.1;
                end;

                //CntWeigParaIs           = $1D;
                //CntWeigParaIs           = $1E;
                //CntWeigParaIs           = $1F;
                //CntWeigParaIs           = $20;

                CntWeigParaIsPLBJ        :   // ��������
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('������');
                    AdvStrGdWeigAttri.AddComboString('����');
                end;

                CntWeigParaIsINS_QIV_MDL  :   // ��ģʽ
                begin
                    AEditor := edComboList;
                    AdvStrGdWeigAttri.ClearComboString;
                    AdvStrGdWeigAttri.AddComboString('��ʱ����');
                    AdvStrGdWeigAttri.AddComboString('��������');
                end;

                CntWeigParaIsINS_QIV_DLY :   // �ӳ���ʱ��
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 99;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsINS_QIV_LST :   // ��ʱ��
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 99;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                CntWeigParaIsINS_QIV_STP :   // �񶯼��ʱ��
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 99;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                //:CntWeigParaIs            = $26;

                CntWeigParaIsINS_QIV_FLW :   //�񶯱߼�����
                begin
                    AEditor := edSpinEdit;
                    AdvStrGdWeigAttri.SpinEdit.MaxValue := 999;
                    AdvStrGdWeigAttri.SpinEdit.MinValue := 0;
                end;

                else
                    AEditor := edNormal ;
            end;
        end;
    end;
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
    if CanEditWgrAttr then
    begin
        if ACol <> 3 then
            CanEdit := False
        else
            CanEdit := True;
    end
    else
    begin
        CanEdit := False;
    end;

end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriComboObjectChange(
  Sender: TObject; ACol, ARow, AItemIndex: Integer; ASelection: String;
  AObject: TObject);
//var
//    Row : Integer ;
//    WeigParaId : Integer;
begin
    {WeigParaId := 0;

    Row := ARow;

    if AdvStrGdWeigAttri.Cells[5, Row] <> '' then
    begin
        try
            WeigParaId := StrToInt(Trim(AdvStrGdWeigAttri.Cells[5, Row]));
        except
            WeigParaId := 0;
        end;
    end;

    if WeigParaId > 0 then
    begin
        case CntWeigherParaInfo[WeigParaId].ParaCode of
            CntWeigParaIsINS_QIV_MDL :    //$22 ��ģʽ
            begin
                AdvStrGdWeigAttri.Clear;
                sBitBtn3.SetFocus;

                WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value := AItemIndex;    //��ģʽ

                IniWeigParaInfoToUtWeigAttr();    //��ʼ���Ʋ�����Ϣ������
            end;

            CntWeigParaIsDecimal :        // ��С��λ��
            begin
            //    AdvStrGdWeigAttri.Clear;
            //    sBitBtn3.SetFocus;
            //
                WeigDecimalInUtWeigAttr :=  AItemIndex;
                //WeigParaInUtWeigAttr[CntWeigherDecimalIndex].Value := AItemIndex;
            //
                IniWeigParaInfoToUtWeigAttr();    //��ʼ���Ʋ�����Ϣ������
            end;
        end; 

    end; }
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriComboChange(
  Sender: TObject; ACol, ARow, AItemIndex: Integer; ASelection: String);
var
    Row : Integer ;
    WeigParaId : Integer;
begin
    WeigParaId := 0;

    Row := ARow;

    if AdvStrGdWeigAttri.Cells[5, Row] <> '' then
    begin
        try
            WeigParaId := StrToInt(Trim(AdvStrGdWeigAttri.Cells[5, Row]));
        except
            WeigParaId := 0;
        end;
    end;

    if WeigParaId > 0 then
    begin
        case CntWeigherParaInfo[WeigParaId].ParaCode of
            CntWeigParaIsINS_QIV_MDL :    //$22 ��ģʽ
            begin
                AdvStrGdWeigAttri.Clear;

                WeigParaInUtWeigAttr[CntWeigherINS_QIV_MDLIndex].Value := AItemIndex;    //��ģʽ

                IniWeigParaInfoToUtWeigAttr();    //��ʼ���Ʋ�����Ϣ������
            end;

            CntWeigParaIsDecimal :        // ��С��λ��
            begin
                AdvStrGdWeigAttri.Clear;

                WeigDecimalInUtWeigAttr :=  AItemIndex;
                WeigParaInUtWeigAttr[CntWeigherDecimalIndex].Value := AItemIndex;

                IniWeigParaInfoToUtWeigAttr();    //��ʼ���Ʋ�����Ϣ������
            end;
        end;

    end;
end;

procedure TFrmWeigherAttribute.AdvStrGdWeigAttriCellsChanged(
  Sender: TObject; R: TRect);
begin
    WeigParaChanged := True;
end;

procedure TFrmWeigherAttribute.sEtDschPreKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Not (Key in ['0'..'9','.']) then Key := #0;

    if Key <> #0 then
    begin
        WeigDschPreChanged := True;
    end;

end;

procedure TFrmWeigherAttribute.sBtBtnOKClick(Sender: TObject);
var
    DschPreF : Double;
    DschPreI : Integer;
    i : Integer;
    ParaInfoId : Integer;
    ParaBufId : Integer;
    ParaValueF : double;
    ParaValueI : Integer;
    ParaDecimal : Integer;
begin
    if WeigDschPreChanged or WeigParaChanged then
    begin
        if messagebox(getfocus,Pchar('�������˲���ֵ���Ƿ��µĲ���ֵ���͵�������'), 'ϵͳѯ��', MB_YESNO) = idYes then
        begin
            if WeigParaChanged then
            begin
                WtWeighParaSteps := 0;

                //�����µĲ���ֵ
                for i:=1 to AdvStrGdWeigAttri.RowCount do
                begin
                    if Trim(AdvStrGdWeigAttri.Cells[5, i]) <> '' then
                    begin
                        ParaInfoId := StrToInt(AdvStrGdWeigAttri.Cells[5, i]);
                        ParaBufId := CntWeigherParaInfo[ParaInfoId].BufIndex ;

                        case CntWeigherParaInfo[ParaInfoId].ParaCode of
                            {��С��λ������С��λ��}
                            CntWeigParaIsCap         ,      // ������
                            CntWeigParaIsZeroBand    ,      //$06 ��λ��Χ
                            CntWeigParaIsSXXLZL      ,      //$0C ˳��ж��ʣ������
                            CntWeigParaIsINS_QIV_FLW :      //$27 �񶯱߼�����

                            begin
                                ParaValueF := StrToFloat(Trim(AdvStrGdWeigAttri.Cells[3, i]));
                                ParaValueI := Trunc(RoundTo(ParaValueF * Power(10,WeigDecimalInUtWeigAttr), -0) );
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            {�����Ͳ���ֵ}
                            CntWeigParaIsDivision    ,      // �Ʒֶ�ֵ
                            CntWeigParaIsTrack       ,      // �����ٷ�Χ

                            CntWeigParaIsFilter      ,      //$07 �����˲�ϵ��
                            CntWeigParaIsDecimal     ,      //$0; ��С��λ��
                            CntWeigParaIsINS_QIV_DLY ,      //$23 �ӳ���ʱ��
                            CntWeigParaIsINS_QIV_LST ,      //$24 ��ʱ��
                            CntWeigParaIsINS_QIV_STP :      //$25 �񶯼��ʱ��
                            begin
                                ParaValueI := StrToInt(Trim(AdvStrGdWeigAttri.Cells[3, i]));
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            

                            {������}
                            CntWeigParaIsDvSep       ,      // ж�ϱ÷����ʱ�䣨1λ����С����
                            CntWeigParaIsIDT         ,      //$05 �ӳ��ж����ʱ�䣨��С����
                            CntWeigParaIsTRG         ,      //$09 �ʲΧ
                            CntWeigParaIsTDC         ,      //$0A �ӳ�ж�Ͽ���ʱ�䣨��С����
                            CntWeigParaIsDlyUld      ,      //$0B �ӳ�Ͷ��ʱ��
                            CntWeigParaIsPvSep       ,      //$0F ���ϱ÷����ʱ�䣨1λ����С����
                            CntWeigParaIsSrtDly      :      //$14 �ӳ�����ʱ��

                            begin
                                ParaValueF := StrToFloat(Trim(AdvStrGdWeigAttri.Cells[3, i]));
                                ParaDecimal := WeigherPara[PmWeigherId][ParaBufId].Decimal;
                                ParaValueI := Trunc(RoundTo(ParaValueF * Power(10,ParaDecimal), -0) );
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsPLBJX       :      //$1C ����������
                            begin
                                ParaValueF := StrToFloat(Trim(AdvStrGdWeigAttri.Cells[3, i]));
                                ParaDecimal := WeigherPara[PmWeigherId][ParaBufId].Decimal;
                                ParaValueI := Trunc(RoundTo(ParaValueF * Power(10,ParaDecimal), -0) );
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsUDC         ,      //$0D �۳� 0����   1������
                            CntWeigParaIsNVL         :      //$15 ����  0����  1�� ��
                            begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '��' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsUFC         :      //$12 ���������ʽ 0���̶� 1���Զ�
                            begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '�Զ�����' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsZFM         :    //$1A �����������ʽ 1��   0��
                            begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '�ȸ�����' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                           CntWeigParaIsPLBJ        :    //$21 ��������
                           begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '����' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                            CntWeigParaIsINS_QIV_MDL :    //$22 ��ģʽ
                            begin
                                if Trim(AdvStrGdWeigAttri.Cells[3, i]) = '��������' then
                                    ParaValueI := 1
                                else
                                    ParaValueI := 0;
                                WeigParaInUtWeigAttr[ParaBufId].Value := ParaValueI;
                            end;

                        end;
                    end;

                end;
            end;

            SendDataToInstuctmentInUtWeigAttr := True;
            sPanel1.Visible := True;
        end
        else
        begin
            Self.Close;
        end;
    end
    else
    begin
        Self.Close;
    end;
end;

procedure TFrmWeigherAttribute.sBitBtn4Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmWeigherAttribute.FormCreate(Sender: TObject);
begin
    InitPermissonInWgrAttr();
end;

procedure TFrmWeigherAttribute.InitPermissonInWgrAttr();
begin
    if pos('[' + CntPermissonCode[CntPermIsPara] + 'e', PersonnelPermit) >= 1 then
    begin
        CanEditWgrAttr := True;

        BtnReadDb.Enabled := True;
        BtnRestore.Enabled := True;
        sBtBtnOK.Enabled   := True;
        GpDischPreact.Enabled := True;
    end
    else
    begin
        CanEditWgrAttr := False;
        
        BtnReadDb.Enabled := False;
        BtnRestore.Enabled := False;
        sBtBtnOK.Enabled   := False;
        GpDischPreact.Enabled := False;
    end;
end;

end.
