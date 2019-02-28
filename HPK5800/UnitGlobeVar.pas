unit UnitGlobeVar;

interface
var
    SoftRunState : Integer;    //�������״̬
Const
     CntSoftIniInstrumentState = 0;    //��ʼ��������״̬
     CntSoftRuningState        = 1 ;   //����״̬
var
    IsMscommCrt : Boolean;             //ͨѶ�˿ڴ����Ƿ�ɹ�
var
    FrmLoginCrt : Boolean;

    SystemRunDelayTmr : Integer;    //ϵͳ������ʱ

    SoftAuthorCheckIntervai : Longint;    //��Ȩ�������

Const
    CntSystemTmrInterval = 200;    //ϵͳ��ʱ��

var
    LoginNm         : String;
    PersonnelPermit : String[100];
    UserCompany     : String[50];

    TaskDspTmr      : integer;

var
    AppPath          : String;    //���·��
    AppFlashTmrInval : Integer;    //������ʱ���趨ֵ
//--------------------------------����------------------------------------------
var
    AutoRing : Boolean;
//------------------------------------------------------------------------------
var
    ProdMode : Integer;
Const
    CtProdIsSingle   = 0;    //����������
    CtProdIsContinue = 1;    //��������

var
    DeliveryPrtMode : Integer;    //��������ӡ��ʽ
Const
    CtDeliveryPtrtMdIsNonAuto = 0;    //���Զ���ӡ
    CtDeliveryPrtMdIsFst      = 1;    //���̴�ӡ
    XtDeliveryPrtMdIsLat      = 2;    //ĩ�̴�ӡ
    
//Const
//    DigitalStateIsInvalid = 0;     //������״̬ �� ��Ч
//    DigitalStateIsClose   = 1;     //������״̬ �� ��
//    DigitalStateIsOpen    = 2;     //������״̬ �� ��
//    DigitalStateIsFlash   = 3;     //������״̬ �� ��˸
//------------------------------------------------------------------------------
    
{�Ǳ�ͨѶ}
var
    Instruction1MscommOpen : Boolean;

    Instruction1MscommState : Integer;
Const
    CntInstruction1MscommIdle        = 0;    //����
    CntInstruction1MscommWaitPly     = 1;    //�ȴ��ظ�
    CntInstruction1MscommReceiving   = 2;    //������
    CntInstruction1MscommReceiveIdle = 3;    //���ν���Ϊ��
    CntInstruction1MscommReceiveOk   = 4;    //�������

var
    Instru1MscommFails     : Integer;       //ͨѶʧ�ܴ���
    Instru1MscommDspState  : Integer;       //ͨѶ��ʾ״̬

Const
    Instru1MscomDspIsPortNo = 0;           //�˿ڲ�����
    Instru1MscomDspIsNomarl = 1;            //ͨѶ��ʾ״̬Ϊ����
    Instru1MscomDspIsFault  = 2;            //ͨѶ��ʾ״̬Ϊ����

Const
    CntCommunicateBufLen = 10;
Const
    CntInstruction1MscommBufLen = 250;
type
    InstructionSendRd = Record
      Active : Boolean;
      SendByteCounter : integer;
      SendByte : array[0..CntInstruction1MscommBufLen] of Byte;
    end;
var
    Instruction1SendBuf : array[0..CntCommunicateBufLen -1] of InstructionSendRd;    //�Ǳ�1���ͻ�����

type
    InstructionReceiveRd = Record
      Active : Boolean ;
      ReceiveByteCount : Integer ;
      ReceiveCmd : Byte;
      ReceiveByte : array[0..CntInstruction1MscommBufLen] of Byte ;
    end;
var
    Instruction1ReceiveBuf : array[0..CntCommunicateBufLen -1] of InstructionReceiveRd;    //�Ǳ�1���ջ�����

var
    Instruction1SendBufWtPt ,    //���ͻ�����дָ��
    Instruction1SendBufRdPt ,    //���ͻ�������ָ��
    Instruction1ReceivePt        //���ջ�����ָ��
      : Integer;
const
    CntInstruction1ReceiveByteLen = 300;
var
    Instruction1ReceiveByte : array[0..CntInstruction1ReceiveByteLen] of Byte;    //�Ǳ�1ͨѶ���ռĴ���
    Instruction1ReceiveBytePt : Integer;    //ͨѶ�����ڴ�ָ��

var
    Instruction1MscommLong : Integer;    //ͨѶ�����ʱ��ʱ��

var
    Instruction1MscommCommandType : Integer;    //ͨѶ��������
Const
    CntInstruction1MscommLoopCmd = 1;    //ѭ������
    CntInstruction1MscommRandCmd = 2;    //�������

var
    LoopMscomCommandPt : Integer;        //ѭ��ͨѶ����ָ��
Const
    CntLoopMscomCommandCount = 3;        //ѭ��ͨѶ��������
var
    LoopMscommCommand : array[0..CntLoopMscomCommandCount-1] of array[0..7] of Byte;

//---------------------------ͨѶ����-------------------------------------------

//-------------------------�������Ʋ���-----------------------------------------
{�Ʋ���}

var
    PMWeigherId : Integer;                //�Ҽ��˵��༭�ƺ�
Const
    WeigherCount = 16;

var
    WeigherValueI             : array[1..WeigherCount] of Integer;    //��ֵ����
    WeigherStateInInstru      : array[1..WeigherCount] of Integer;    //�Ǳ��еĳ�״̬
    WeigherLoadCounterInInstu : array[1..WeigherCount] of Integer;    //�Ǳ��еĳƵ����ϴ���������
type
    WeigherInfoRd = Record
        Enable             : Boolean ;
        Name               : String[20] ;   //������
        Tpe                : Integer;       //������
        InstrumentId       : Integer;       //�����ƶ�Ӧ���Ǳ��
        CloseLmt           : Boolean ;      //���ƹ�����λ
        DischVibrator      : Boolean;       //ж������
        LdDsIsPumpAndValve : Boolean;       //����ж�ϱ÷�
        LoadIsFine         : Boolean;       //��������
        StorageNumber      : Integer ;     //�ϲ�����
        StorageId          : Array[1..4] of Integer;
    end;
//Const
//    CtWghrTpIsAggr    = 1;    //���ϳ�
//    CtWghrTpIsPowder  = 2;    //���ϳ�
//    CtWghrTpIsWater   = 3;    //ˮ��
//    CtWghrTpIsAddtive = 4;    //Һ����
var
    WeigherInfo : array[1..WeigherCount] of WeigherInfoRd;

    AdditiveDischIntoWater : Boolean;    //���ж��ˮ

type
    WeigherParaRd = Record
      Value : Integer ;
      Decimal : Integer ;
      Flags   : String ;                   //��������
    end;

const
    CntWeigherParaCount = 39;
var
    WeigherPara : array[1..WeigherCount] of array[1..CntWeigherParaCount] of WeigherParaRd ;


type
    WeigherParaInfoRd = Record
      CodeInDb               : String[20] ;               //���������ݿ��еĴ���
      ParaName               : String[20] ;               //��������
      AddrOffsetInInstrument : Integer ;        //�������Ǳ��еĵ�ַOffset
      BufIndex               : Integer ;                  //�������ڴ��������±�λ��
      ParaCode               : Integer;              //����ֵ����
      Units                  : String[10] ;          //������λ
    end;

Const    //�Ʋ�������
    CntWeigParaIsCap         = $01;     // ������
    CntWeigParaIsDivision    = $02;     // �Ʒֶ�ֵ
    CntWeigParaIsTrack       = $03;     // �����ٷ�Χ
    CntWeigParaIsDvSep       = $04;     // ж�ϱ÷����ʱ�䣨1λ����С����
    CntWeigParaIsIDT         = $05;     // �ӳ��ж����ʱ�䣨��С����
    CntWeigParaIsZeroBand    = $06;     // ��λ��Χ
    CntWeigParaIsFilter      = $07;     // �����˲�ϵ��
    CntWeigParaIsDecimal     = $08;     // ��С��λ��
    CntWeigParaIsTRG         = $09;     // �ʲΧ
    CntWeigParaIsTDC         = $0A;     // �ӳ�ж�Ͽ���ʱ�䣨��С����
    CntWeigParaIsDlyUld      = $0B;     // �ӳ�Ͷ��ʱ��
    CntWeigParaIsSXXLZL      = $0C;     // ˳��ж��ʣ������
    CntWeigParaIsUDC         = $0D;     // �۳� 0����   1������
    CntWeigParaIsRemain      = $0E;     // ��������
    CntWeigParaIsPvSep       = $0F;     // ���ϱ÷����ʱ�䣨1λ����С����
    //CntWeigParaIs         = $10
    //CntWeigParaIs          = $11
    CntWeigParaIsUFC         = $12;     // ���������ʽ 0���̶� 1���Զ�
    //CntWeigParaIs          = $13
    CntWeigParaIsSrtDly      = $14;     // �ӳ�����ʱ��
    CntWeigParaIsNVL         = $15;     // ����  0����  1�� ��
    //CntWeigParaIs          = $16;
    //CntWeigParaIs          = $17;
    //CntWeigParaIs          = $18;
    //CntWeigParaIs          = $19;
    CntWeigParaIsZFM         = $1A;   //19 �����������ʽ 1��   0��
    //CntWeigParaIs           = $1B
    CntWeigParaIsPLBJX       = $1C;   //1B ����������
    //CntWeigParaIs           = $1D;
    //CntWeigParaIs           = $1E;
    //CntWeigParaIs           = $1F;
    //CntWeigParaIs           = $20;
    CntWeigParaIsPLBJ        = $21;   // ����������
    CntWeigParaIsINS_QIV_MDL = $22;   // ��ģʽ
    CntWeigParaIsINS_QIV_DLY = $23;   // �ӳ���ʱ��
    CntWeigParaIsINS_QIV_LST = $24;   // ��ʱ��
    CntWeigParaIsINS_QIV_STP = $25;   // �񶯼��ʱ��
    //CntWeigParaIs            = $26;
    CntWeigParaIsINS_QIV_FLW = $27;   //�񶯱߼�����

Const    //�Ʋ������Ǳ��еĵ�ַOffset ������ʾ�ò�������λ���в��洢
    CntCapOffsetInInstru = $00;              //00 ������
    CntDivisionOffsetInInstru = $01;         //01 �Ʒֶ�ֵ
    CntTrackOffsetInInstru = $02;            //02 �����ٷ�Χ
    CntDvSepOffsetInInstru = $03;            //03 ж�ϱ÷����ʱ�䣨1λ����С����
    CntIDTOffsetInInstru = $04;              //04 �ӳ��ж����ʱ�䣨��С����
    CntZeroBandOffsetInInstru = $05;         //05 ��λ��Χ
    CndFilterOffsetInInstru = $06;           //06 �����˲�ϵ��
    CntDecimalOffsetInInstru = $07;          //07 ��С��λ��
    CntTRGOffsetInInstru = $08;              //08 �ʲΧ
    CntTDCOffsetInInstru = $09;              //09 �ӳ�ж�Ͽ���ʱ�䣨��С����
    CntDlyUldOffsetInInstru = $0A;           //0A �ӳ�Ͷ��ʱ��
    CntSXXLZLOffsetInInstru = $0B;           //0B ˳��ж��ʣ������
    CntUDCOffsetInInstru = $0C;              //0C �۳� 0����   1������
    CntRemainOffsetInInstru = $0D;           //0D ��������
    CntPvSepOffsetInInstru = $0E;            //0E ���ϱ÷����ʱ�䣨1λ����С����
                                             //0F
                                             //10 ???
    CntUFCOffsetInInstru = $11;              //11 ���������ʽ 0���̶� 1���Զ�
                                             //12
    CntSrtDlyOffsetInInstru = $13;           //13 �ӳ�����ʱ��
    CntNVLOffsetInInstru = $14;              //14 ����  0����  1�� ��
                                             //15
                                             //16
                                             //17
                                             //18
    CntZFMOffsetInInstru = $19;              //19 �����������ʽ 1��   0��
                                             //1A
    CntPLBJXOffsetInInstr = $1B;             //1B ����������
                                             //1C
                                             //1D
                                             //1E
                                             //1F

    CntPLBJOffsetInInstru = -1;              //����������

    CntINS_QIV_MDLOffsetInInstru = -1;       //��ģʽ
    CntINS_QIV_DLYOffsetInInstru = $640;     //A40 �ӳ���ʱ��
    CntINS_QIV_LSTOffsetInInstru = $641;     //A41 ��ʱ��
    CntINS_QIV_STPOffsetInInstru = $642;     //A42 �񶯼��ʱ��
                                             //A43
    CntINS_QIV_FLOffsetInInstru = $644;      //A44�񶯱߼�����

Const    //�Ʋ������ڴ������е����
    CntWeigherCapIndex = 1;          //00 ������
    CntWeigherDivisionIndex = 2;     //01 �Ʒֶ�ֵ
    CntWeigherTrackIndex = 3;        //02 �����ٷ�Χ
    CntWeigherDvSepIndex = 4;        //03 ж�ϱ÷����ʱ�䣨1λ����С����
    CntWeigherIDTIndex = 5;          //04 �ӳ��ж����ʱ�䣨��С����
    CntWeigherZeroBandIndex = 6;     //05 ��λ��Χ
    CndWeigherFilterIndex = 7;       //06 �����˲�ϵ��
    CntWeigherDecimalIndex = 8;      //07 ��С��λ��
    CntWeigherTRGIndex = 9;          //08 �ʲΧ
    CntWeigherTDCIndex = 10;          //09 �ӳ�ж�Ͽ���ʱ�䣨��С����
    CntWeigherDlyUldIndex = 11;       //0A �ӳ�Ͷ��ʱ��
    CntWeigherSXXLZLIndex = 12;       //0B ˳��ж��ʣ������
    CntWeigherUDCIndex = 13;          //0C �۳� 0����   1������
    CntWeigherRemainIndex = 14;       //0D ��������
    CntWeigherPvSepIndex = 15;        //0E ���ϱ÷����ʱ�䣨1λ����С����
                                       //0F
                                       //10 ???
    CntWeigherUFCIndex = 18;          //11 ���������ʽ 0���̶� 1���Զ�
                                       //12
    CntWeigherSrtDlyIndex = 20;       //13 �ӳ�����ʱ��
    CntWeigherNVLIndex = 21;          //14 ����  0����  1�� ��
                                       //15
                                       //16
                                       //17
                                       //18
    CntWeigherZFMIndex = 26;          //19 �����������ʽ 1��   0��
                                       //1A
    CntWeigherPLBJXIndex = 28;        //1B ����������
                                       //1C
                                       //1D
                                       //1E
                                       //1F

    CntWeigherPLBJIndex = 33;         //����������

    CntWeigherINS_QIV_MDLIndex = 34;  //��ģʽ
    CntWeigherINS_QIV_DLYIndex = 35 ; //A40 �ӳ���ʱ��
    CntWeigherINS_QIV_LSTIndex = 36 ; //A41 ��ʱ��
    CntWeigherINS_QIV_STPIndex = 37 ; //A42 �񶯼��ʱ��
                                       //A43
    CntWeigherINS_QIV_FLWIndex = 39 ; //A44 �񶯱߼�����

const
    CntWeigherParaInfo : array[1..CntWeigherParaCount] of WeigherParaInfoRd    //���ڿ������е�ͨѶ��ַΪ���������
      =(
          ( CodeInDb               : 'CAP';
            ParaName               : '�������';
            AddrOffsetInInstrument : CntCapOffsetInInstru;
            BufIndex               : CntWeigherCapIndex;
            ParaCode               : CntWeigParaIsCap;
            Units                  : 'kg') ,                       //00 ������

          ( CodeInDb               : 'd';
            ParaName               : '�ֶ�ֵ';
            AddrOffsetInInstrument : CntDivisionOffsetInInstru;
            BufIndex               : CntWeigherDivisionIndex;
            ParaCode               : CntWeigParaIsDivision;
            Units                  : ''),        //01 �Ʒֶ�ֵ

          ( CodeInDb               : 'Track';
            ParaName               : '�����ٷ�Χ';
            AddrOffsetInInstrument : CntTrackOffsetInInstru;
            BufIndex               : CntWeigherTrackIndex;
            ParaCode               : CntWeigParaIsTrack;
            Units                  : 'd'),     //02 �����ٷ�Χ

          ( CodeInDb               : 'DvSep';
            ParaName               : 'ж�ϱ÷����ʱ��';
            AddrOffsetInInstrument : CntDvSepOffsetInInstru ;
            BufIndex               : CntWeigherDvSepIndex;
            ParaCode               : CntWeigParaIsDvSep;
            Units                  : 's'),     //03 ж�ϱ÷����ʱ�䣨1λ����С����

          ( CodeInDb               : 'IDT';
            ParaName               : '�ӳ��ж����ʱ��';
            AddrOffsetInInstrument : CntIDTOffsetInInstru ;
            BufIndex               : CntWeigherIDTIndex;
            ParaCode               : CntWeigParaIsIDT;
            Units                  : 's'),     //04 �ӳ��ж����ʱ�䣨��С����

          ( CodeInDb               : 'ZeroBand';
            ParaName               : '��λ��Χ';
            AddrOffsetInInstrument : CntZeroBandOffsetInInstru;
            BufIndex               : CntWeigherZeroBandIndex;
            ParaCode               : CntWeigParaIsZeroBand;
            Units                  : ''),     //05 ��λ��Χ

          ( CodeInDb               : 'Filter';
            ParaName               : '�˲�ϵ��';
            AddrOffsetInInstrument : CndFilterOffsetInInstru;
            BufIndex               : CndWeigherFilterIndex;
            ParaCode               : CntWeigParaIsFilter;
            Units                  : ''),     //06 �����˲�ϵ��

          ( CodeInDb               : 'Decimal';
            ParaName               : 'С��λ��';
            AddrOffsetInInstrument : CntDecimalOffsetInInstru;
            BufIndex               : CntWeigherDecimalIndex;
            ParaCode               : CntWeigParaIsDecimal;
            Units                  : ''),     //07 ��С��λ��

          ( CodeInDb               : 'TRG';
            ParaName               : '�ʲΧ';
            AddrOffsetInInstrument : CntTRGOffsetInInstru ;
            BufIndex               : CntWeigherTRGIndex ;
            ParaCode               : CntWeigParaIsTRG;
            Units                  : '%'),     //08 �ʲΧ

          ( CodeInDb               : 'TDC';
            ParaName               : '�ӳ�ж�Ͽ���ʱ��';
            AddrOffsetInInstrument : CntTDCOffsetInInstru ;
            BufIndex               : CntWeigherTDCIndex ;
            ParaCode               : CntWeigParaIsTDC;
            Units                  : 's'),     //09 �ӳ�ж�Ͽ���ʱ�䣨��С����

          ( CodeInDb               : 'DlyUld';
            ParaName               : '�ӳ�Ͷ��ʱ��';
            AddrOffsetInInstrument : CntDlyUldOffsetInInstru ;
            BufIndex               : CntWeigherDlyUldIndex ;
            ParaCode               : CntWeigParaIsDlyUld;
            Units                  : 's'),     //0A �ӳ�Ͷ��ʱ��

          ( CodeInDb               : 'SXXLZL';
            ParaName               : '˳��ж��ʣ������';
            AddrOffsetInInstrument : CntSXXLZLOffsetInInstru ;
            BufIndex               : CntWeigherSXXLZLIndex ;
            ParaCode               : CntWeigParaIsSXXLZL;
            Units                  : 'kg'),     //0B ˳��ж��ʣ������

          ( CodeInDb               : 'UDC';
            ParaName               : '����۳�';
            AddrOffsetInInstrument : CntUDCOffsetInInstru ;
            BufIndex               : CntWeigherUDCIndex ;
            ParaCode               : CntWeigParaIsUDC;
            Units                  : ''),     //0C �۳� 0����   1������

          ( CodeInDb               : '';
            ParaName               : 'ж��ʱ��������';
            AddrOffsetInInstrument : CntRemainOffsetInInstru ;
            BufIndex               : CntWeigherRemainIndex ;
            ParaCode               : CntWeigParaIsRemain;
            Units                  : 'kg'),     //0D ��������

          ( CodeInDb               : 'PvSep';
            ParaName               : '���ϱ÷����ʱ��';
            AddrOffsetInInstrument : CntPvSepOffsetInInstru ;
            BufIndex               : CntWeigherPvSepIndex ;
            ParaCode               : CntWeigParaIsPvSep;
            Units                  : 's'),     //0E ���ϱ÷����ʱ�䣨1λ����С����

          ( CodeInDb               : '    ';
            ParaName               : 'δ����0F';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //0F

          ( CodeInDb               : '    ';
            ParaName               : 'δ����10';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //10 ???

          ( CodeInDb               : 'UFC';
            ParaName               : '���������ʽ';
            AddrOffsetInInstrument : CntUFCOffsetInInstru ;
            BufIndex               : CntWeigherUFCIndex ;
            ParaCode               : CntWeigParaIsUFC;
            Units                  : ''),     //11 ���������ʽ 0���̶� 1���Զ�
     
          ( CodeInDb               : '    ';
            ParaName               : 'δ����12';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //12

          ( CodeInDb               : 'SrtDly';
            ParaName               : '������ʱ��';
            AddrOffsetInInstrument : CntSrtDlyOffsetInInstru ;
            BufIndex               : CntWeigherSrtDlyIndex ;
            ParaCode               : CntWeigParaIsSrtDly;
            Units                  : 's'),     //13 �ӳ�����ʱ��

          ( CodeInDb               : 'NVL';
            ParaName               : '������';
            AddrOffsetInInstrument : CntNVLOffsetInInstru ;
            BufIndex               : CntWeigherNVLIndex ;
            ParaCode               : CntWeigParaIsNVL;
            Units                  : ''),     //14 ����  0����  1�� ��

          ( CodeInDb               : '    ';
            ParaName               : 'δ����15';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //15

          ( CodeInDb               : '    ';
            ParaName               : 'δ����16';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //16

          ( CodeInDb               : '    ';
            ParaName               : 'δ����17';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //17

          ( CodeInDb               : '    ';
            ParaName               : 'δ����18';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //18

          ( CodeInDb               : 'ZFM';
            ParaName               : '�����������ʽ';
            AddrOffsetInInstrument : CntZFMOffsetInInstru ;
            BufIndex               : CntWeigherZFMIndex ;
            ParaCode               : CntWeigParaIsZFM;
            Units                  : ''),     //19 �����������ʽ 1��   0

          ( CodeInDb               : '    ';
            ParaName               : 'δ����1A';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1A

          ( CodeInDb               : 'PLBJX';
            ParaName               : '����������';
            AddrOffsetInInstrument : CntPLBJXOffsetInInstr ;
            BufIndex               : CntWeigherPLBJXIndex ;
            ParaCode               : CntWeigParaIsPLBJX;
            Units                  : '%'),     //1B ����������

          ( CodeInDb               : '    ';
            ParaName               : 'δ����1C';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1C

          ( CodeInDb               : '    ';
            ParaName               : 'δ����1D';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1D

          ( CodeInDb               : '    ';
            ParaName               : 'δ����1E';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1E

          ( CodeInDb               : '    ';
            ParaName               : 'δ����1F';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),                       //1F

          ( CodeInDb               : 'PLBJ';
            ParaName               : '��������';
            AddrOffsetInInstrument : CntPLBJOffsetInInstru ;
            BufIndex               : CntWeigherPLBJIndex ;
            ParaCode               : CntWeigParaIsPLBJ;
            Units                  : ''),     //����������

          ( CodeInDb               : 'INS_QIV_MDL';
            ParaName               : '��ģʽ';
            AddrOffsetInInstrument : CntINS_QIV_MDLOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_MDLIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_MDL;
            Units                  : ''),     //��ģʽ

          ( CodeInDb               : 'INS_QIV_DLY';
            ParaName               : '�ӳ���ʱ��';
            AddrOffsetInInstrument : CntINS_QIV_DLYOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_DLYIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_DLY;
            Units                  : 's'),      //A40 �ӳ���ʱ��

          ( CodeInDb               : 'INS_QIV_LST';
            ParaName               : '��ʱ��';
            AddrOffsetInInstrument : CntINS_QIV_LSTOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_LSTIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_LST;
            Units                  : 's'),     //A41 ��ʱ��

          ( CodeInDb               : 'INS_QIV_STP';
            ParaName               : '�񶯼��ʱ��';
            AddrOffsetInInstrument : CntINS_QIV_STPOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_STPIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_STP;
            Units                  : 's'),    //�񶯼��ʱ��

          ( CodeInDb               : '    ';
            ParaName               : 'δ����A43';
            AddrOffsetInInstrument : -1 ;
            BufIndex               : -1 ;
            ParaCode               : 0;
            Units                  : ''),

          ( CodeInDb               : 'INS_QIV_FLW';
            ParaName               : '�񶯱߼�����';
            AddrOffsetInInstrument : CntINS_QIV_FLOffsetInInstru ;
            BufIndex               : CntWeigherINS_QIV_FLWIndex ;
            ParaCode               : CntWeigParaIsINS_QIV_FLW;
            Units                  : 'kg/s')
        );
//----------------------�������Ʋ�������----------------------------------------

//------------------------------�ϲֲ���----------------------------------------
Const
    CntStorageCount = 16;    //���֧��16���ϲ�

//var
//    SiloLoadVaveState : array[1..CntStorageCount] of Integer;    //�ϲּ�����     ��ʾ ״̬
//    SiloFnLdVaveState : array[1..CntStorageCount] of Integer;    //�ϲ־�������   ��ʾ ״̬
//    SiloLdVibraState  : array[1..CntStorageCount] of Integer;    //�ϲּ������� ��ʾ ״̬

type
    StorageInfoRd = record
        Enable : Boolean;
        Name : String[20] ;
        InstrumentId : Integer;
        LoadNo : Integer;
        Model : Integer;
        MaterId : Integer;
        MaterName : String[20];    //��������
        MaterSpec : String[20];    //�ͺŹ��
        DschMode : Integer;
        Vibrator : Boolean;
        StockDsp : Boolean;
        Moisture : Double;       //��ˮ��
    end;
Const
    CntAggregateStorage = 0;    //���ϲ�
    CntPowderStorage = 1;       //���ϲ�
    //CntLiquidStorage = 2;       //Һ���
    CntWaterStorage = 2;        //ˮ��
    CntAddtiveStorage = 3;      //�����
Const
    CntStorageSignalDsch = 0;   //�ϲֵ���ж��
    CntStorageDoubleDsch = 1;   //�ϲ�˫��ж��
var
    StorageInfo : array[1..CntStorageCount] of StorageInfoRd;

type
    StorageParaRd = Record
       Value   : Integer ;
       Decimal : Integer ;
       Flags   : String[20];
    end;
Const
    CntStorageParaCount = 6;
var
    StoragePara : array[1..CntStorageCount] of array[1..CntStorageParaCount] of StorageParaRd;

Const    //��������
    CntStorParaIsVibraMode       = $01;       //��ģʽ
    CntStorParaIsVibraStartDelay = $02;       //���ӳ�ʱ��
    CntStorParaIsVibraRunLong    = $03;       //��ʱ��
    CntStorParaIsVibraOffLong    = $04;       //�񶯼��ʱ��
    CntStorParaIsVibraRunFlow    = $05;       //�񶯱߼�����

Const    //�ڴ������±��
    CntVibraModeIndexInBuf = 1;                //��ģʽ�����±�
    CntVibraStartDelayIndexInBuf = 2;          //���ӳ�ʱ��
    CntVibraRunLongIndexInBuf = 3;             //��ʱ��
    CntVibraOffLongIndexInBuf = 4;             //�񶯼��ʱ��
    CntVibraRunFlowIndexInBuf = 5;             //�񶯱߼�����

Const    //������ƫ�Ƶ�ַ
    CntVibraRunFlowOffsetInInstru = $02;       //�񶯱߼�����
    CntVibraStartDelayOffsetInInstru = $00;    //���ӳ�ʱ��
    CntVibraRunLongOffsetInInstru = $01;       //��ʱ��
    CntVibraOffLongOffsetInInstru = $02;       //�񶯼��ʱ��
    CntVibraModeOffsetInInstru = -1;           //��ģʽ�ڿ�����ƫ�Ƶ�ַ
type
    StorageParaInfoRd = Record
      CodeInDb : String[20] ;               //���������ݿ��еĴ���
      ParaName : String[20] ;               //��������
      OffsetInInstrument : Integer ;        //�������Ǳ��еĵ�ַOffset
      BufIndex : Integer ;                  //�������ڴ��������±�λ��
      Units : String[10] ;                  //��λ
      ParaCode : Integer;                   //��������
    end;
Const
    CntStorageParaInfo : array[1..CntStorageParaCount] of StorageParaInfoRd
      = (
          ( CodeInDb            : 'STR_QIV_MDL';
            ParaName            : '��ģʽ';
            OffsetInInstrument  : CntVibraModeOffsetInInstru ;
            BufIndex            : CntVibraModeIndexInBuf;
            Units               : '';
            ParaCode            : CntStorParaIsVibraMode),

          ( CodeInDb            : 'STR_QIV_DLY';
            ParaName            : '���ӳ�ʱ��';
            OffsetInInstrument  :  CntVibraStartDelayOffsetInInstru;
            BufIndex            : CntVibraStartDelayIndexInBuf;
            Units               : 's';
            ParaCode            : CntStorParaIsVibraStartDelay),

          ( CodeInDb            : 'STR_QIV_LST';
            ParaName            : '��ʱ��';
            OffsetInInstrument  : CntVibraRunLongOffsetInInstru;
            BufIndex            : CntVibraRunLongIndexInBuf;
            Units               : 's';
            ParaCode            : CntStorParaIsVibraRunLong),

          ( CodeInDb            : 'STR_QIV_STP';
            ParaName            : '�񶯼��ʱ��';
            OffsetInInstrument  : CntVibraOffLongOffsetInInstru;
            BufIndex            : CntVibraOffLongIndexInBuf;
            Units               : 's';
            ParaCode            : CntStorParaIsVibraOffLong) ,

          ( CodeInDb            : 'STR_QIV_FLW';
            ParaName            : '�񶯱߼�����';
            OffsetInInstrument  : CntVibraRunFlowOffsetInInstru ;
            BufIndex            : CntVibraRunFlowIndexInBuf;
            Units               : 'kg/s';
            ParaCode            : CntVibraRunFlowIndexInBuf),    //�񶯱߼�����

          ( CodeInDb            : '';
            ParaName            : '';
            OffsetInInstrument  : -1;
            BufIndex            : -1;
            ParaCode            : 0)
        );
//---------------------------�ϲֲ�������---------------------------------------

{��������}
var
    AggregateConveyorMode : Integer;    //�������ͷ�ʽ
Const
    CntAggregateConveyorBelt     = 1;      //Ƥ��
    CntAggregateConveyorElevator = 2;      //������
//---------------------------��������-------------------------------------------
type
    AggConveyorEquipRd = Record
      Use         : Boolean;
      EquipType   : Integer;
      RunLmtCheck : Boolean;
      ContinueRun : Boolean;    //����ģʽ =True,��ת��=False,�㶯���� 
    end;
Const
    CntAggConveyEquipIsLtLevelBelt    = 1;    //��ƽƤ��
    CntAggConveyEquipIsRtLevelBelt    = 2;    //��ƽƤ��
    CntAggConveyEquipIsLtInclinedBelt = 3;    //��бƤ��
    CntAggConveyEquipIsRtInclinedBelt = 4;    //��бƤ��
    CntAggConveyEquipIsLtLiftBucket   = 5;    //��������
    //CntAggConveyEquipIs//= 6;//��������
    CntAggConveyEquipIsLtShtLevelBelt = 7;    //����ƽƤ��
    //CntAggConveyEquipIsRtShtLevelBelt = 6;    //��ƽƤ��
//var
//    AggregateConveyorEquipUse : array[1..4] of Boolean;     //���������豸�Ƿ�ʹ��
var
    AggregateConveyorEquipInfo : array[1..6] of AggConveyorEquipRd ;    //���������豸��Ϣ
    AggrConvEquipFlashSta      : array[1..6] of Integer;                //���������豸����״̬

Const
    CntBeltFlashStaIsError     = 0 ;    //Ƥ������״̬ ����
    CntBeltFlashStaIsEmptyStop = 1;     //Ƥ������״̬ ��ֹͣ
    CntBeltFlashStaIsEmptyRun  = 2;     //Ƥ������״̬ ����ת
    CntBeltFlashStaIsFullRun   = 3;     //Ƥ������״̬ ������ת

var
    AggrConvEquipFlashFrame : array[1..4] of Integer;    //���������豸���� ֡���
    AggrConvEquipFlashTmr   : array[1..4] of Integer;    //���������豸���� ��ʱ��

var
    AggrConvEquipBtnState : array[1..4] of Integer;    //���������豸��ť״̬
Const
    CtAggrConvEquipBtnIsNone    = 0;    //���������豸��ť״̬ Ϊ ������
    CtAggrConvEquipBtnIsInvalid = 1;    //���������豸��ť״̬ Ϊ ��Ч
    CtAggrConvEquipBtnIsValid   = 2;    //���������豸��ť״̬ Ϊ ��Ч
    
//-------------------------�������ͽ���-----------------------------------------

//--------------------------����������------------------------------------------
var
    ImgLiftBuktBtmLmtDspSta : array[1..2] of Integer;    //����������λ��ʾ
    ImgLiftBuktTopLmtDspSta : array[1..2] of Integer;    //����������λ��ʾ
Const
    CntImgLiftBuktLmtDspStaIsNone  = 0;    //����λ������
    CntImgLiftBuktLmtDspStaIsValid = 1;    //��Ч״̬
    CntImgLiftBuktLmtDspStaIsInvad = 2;    //��Ч״̬

var   //�±��=1��������������  �±��=2��������������
    ImgLiftBuktGoUpBtnDspSta : array[1..2] of Integer;    //������������ť
    ImgLiftBuktGoDnBtnDspSta : array[1..2] of Integer;    //�������½���ť
Const
    CntImgLiftBuktBtnDspStaIsNone  = 0;    //����λ������
    CntImgLiftBuktBtnDspStaIsValid = 1;    //��Ч״̬
    CntImgLiftBuktBtnDspStaIsInvad = 2;    //��Ч״̬

//��������������
type
  LiftBucketAttrRd = Record
    Name     : String;     //����������
    XMoveMax : Integer;    //�����ƶ�������
    YMoveMax : Integer;    //�����ƶ�������
    XBottom  : Integer;    //�������ڵ� ����λ��
    YBottom  : Integer;    //�������ڵ� ����λ��
    XTop     : Integer;    //�������ڶ� ����λ��
    YTop     : Integer;    //�������ڶ� ����λ��
    GoUpLong : Integer;    //�������������ʱ��
    GoDnLong : Integer;    //�������½����ʱ��
    GoUpTmr  : Integer;    //������ʱ��
    GodnTmr  : Integer;    //�½���ʱ��
    MovTmr   : Integer;    //�ƶ���ʱ��
  end;
Var
    LiftBucketAttr : array[1..2] of LiftBucketAttrRd;    //�±�=1�������������±�=2����������
//------------------------��������������----------------------------------------

//-------------------------�����м�ֲ���---------------------------------------
var
    PMAggrHopperId : Integer;            //�����м䶷/�������Ҽ��˵���
var
    AggrMidHopperDschValveImgState : array[1..2] of Integer;
Const
    CntMdHopDshValImgIsNone    = 1;    //�м䶷ж�Ϸ�״̬ Ϊ ������
    CntMdHopDshValImgIsInvalie = 2;    //�м䶷ж�Ϸ�״̬ Ϊ ��Ч
    CntMdHopDshValImgIsValid   = 3;    //�м䶷ж�Ϸ�״̬ �� ��Ч

Var
    AggrMidHopperDschVibraImgState : array[1..2] of Integer;
Const
    CntMdHopDshVibraImgIsNone    = 1;    //�м䶷ж�� ����ͼƬ ������
    CntMdHopDshVibraImgIsInvalie = 2;    //�м䶷ж�� ����ͼƬ ��Ч״̬
    CntMdHopDshVibraImgIsValid   = 3;    //�м䶷ж�� ����ͼƬ ��Ч״̬
var
    AggrMdHopperDschValClLmtImgState,   //�м䶷ж���� ���� ͼƬ״̬
    AggrMdHopperDschValOpLmtImgState    //�м䶷ж���� ���� ͼƬ״̬
      : array[1..2] of Integer;
Const
    CtMdHopDschValLmtImgIsNone    = 0;  //�м䶷ж���� ��λͼƬ ������
    CtMdHopDschValLmtImgIsInvalid = 1;  //�м䶷ж���� ��λͼƬ ��Ч
    CtMdHopDschValLmtImgIsValid   = 2;  //�м䶷ж���� ��λͼƬ ��Ч
    CtMdHopDschValLmtImgIsInvSpl  = 3;  //�м䶷ж���� ��λͼƬ ��Ч��˸
    CtMdHopDschValLmtImgIsValSpl  = 4;  //�м䶷ж���� ��λͼƬ ��Ч��˸
Const
    CtMdHopDschValLmtIsClose = 1;       //�м䶷ж���� ��λ�� ����
    CtMdHopDschValLmtIsOpen  = 2;       //�м䶷ж���� ��λ�� ����
var
    MidBinIsFull : array[1..2] of Boolean;  //�����м���Ƿ���/����

var
    ImgBellState : Integer;     //����ͼƬ
const
    ImgBeltStateIsUnRing = 0;     //����ͼƬ����״̬
    IMgBeltStateIsRing   = 1;     //����ͼƬ��״̬

{������ؼ���ʶ}
var
    mouseEnterBellImg : Boolean;    //���������ͼƬ

Type
    AggregateMidBinInfoRd = Record
        Use              : Boolean;
        Name             : String[20];
        LoadInstrumentId : Integer;
        OpenLmtValid     : Boolean;
        CloseLmtValid    : Boolean;
        VibraValid       : Boolean;
        IsWeigher        : Boolean;
        Falgs            : String[50];
    end;

var
    AggregateMidBinInfo : array[1..2] of AggregateMidBinInfoRd;

type
    AggregateConvParaRd = Record
      Name : String[20] ;
      Value : Integer ;
      ParaUnit : String[6];
      Decimal : Integer;
      Flags : String[20];
    end;
Const
    CntAggregateConvParaCount = 16;
var
    AggregateConvPara : array[1..2] of array[1..CntAggregateConvParaCount] of AggregateConvParaRd ;    //����������ַ����
Type
    AggregateConvParaInfoRd = Record
      CodeInDb           : String[20];
      OffsetInInstrument : Integer;
      BufIndex           : Integer;
      ParaCode           : Integer;
    end;
Const
    CntAggreConvParaFstAddr = $0741;    //�������Ͳ����׵�ַ
Const
    CntBufIndexOfAggreMidDschDelay = 1;        //$7041 �д����ӳ�Ͷ��ʱ�� �ڴ������±�
    CntBufIndexOfAggreMidSndDschDelay = 2;     //$7042 �ڶ����ӳ�Ͷ��ʱ�� �ڴ������±�
    CntBufIndexOfAggreMidDschTm = 3;           //$7043 �д���Ͷ��ʱ�� �ڴ������±�
    CntBufIndexOfAggreMidSndDschTm = 4;        //$7044 �ڶ��ο���ʱ�� �ڴ������±�
    CntBufIndexOfAggreMidLoadContinue = 5;     //$7045 �д���װ�ϳ���ʱ�� �ڴ������±�
    CntBufIndexOfAggreBeltStopDelay = 6;       //$7046 ƽƤ���ӳ�ֹͣʱ�� �ڴ������±�
                                               //$7047
    CntBufIndexOfAggreMidDschPauseTm = 8;      //7048 ���ο��ż�� �ڴ������±�
    CntBufIndexOfSAND_WT = 9;                  //7049 ɰ��ʯ����ֵ �ڴ������±�
    CntBufIndexOfVibraDelay = 10;              //704A �ӳ���ʱ�� �ڴ������±�
    CntBufIndexOfVibraRunTm = 11;              //704B ��ʱ�� �ڴ������±�
    CntBufIndexOfVibraSTP = 12;                //704C  �񶯼��ʱ�� �ڴ������±�
    CntBufIndexOfRunMaxTm = 13;                //704D ������ʱ�� �ڴ������±�
                                               //704E  �ڴ������±�
                                               //704F  �ڴ������±�
    CntBufIndexOfAggreMode = 16;               //7050 ����������ʽ �ڴ������±�
Const
    CntOffsetOfAggreMidDschDelay = $0000;        //$7041 �д����ӳ�Ͷ��ʱ�� ��������ַƫ��
    CntOffsetOfAggreMidSndDschDelay = $0001;     //$7042 �ڶ����ӳ�Ͷ��ʱ�� ��������ַƫ��
    CntOffsetOfAggreMidDschTm = $0002;           //$7043 �д���Ͷ��ʱ�� ��������ַƫ��
    CntOffsetOfAggreMidSndDschTm = $0003;        //$7044 �ڶ��ο���ʱ�� ��������ַƫ��
    CntOffsetOfAggreMidLoadContinue = $0004 ;    //$7045 �д���װ�ϳ���ʱ�� ��������ַƫ��
    CntOffsetOfAggreBeltStopDelay = $0005;       //$7046 ƽƤ���ӳ�ֹͣʱ�� ��������ַƫ��
                                                 //$7047
    CntOffsetOfAggreMidDschPauseTm = $0007;      //7048 ���ο��ż�� ��������ַƫ��
    CntOffsetOfSAND_WT = $0008;                  //7049 ɰ��ʯ����ֵ ��������ַƫ��
    CntOffsetOfVibraDelay = $0009;               //704A �ӳ���ʱ�� ��������ַƫ��
    CntOffsetOfVibraRunTm = $000A;               //704B ��ʱ�� ��������ַƫ��
    CntOffsetOfVibraSTP = $000B;                 //704C �񶯼��ʱ�� ��������ַƫ��
    CntOffsetOfRunMaxTm = $000C;                 //704D ������ʱ�� ��������ַƫ��
                                                 //704E ��������ַƫ��
                                                 //704F ��������ַƫ��
    CntOffsetOfAggreMode = $000F;                //7050 ����������ʽ ��������ַƫ��
const    //��������
    CntAggrConvParaIsMidBinDschDelay    = 1;     //$7041 �������Ͳ����� �д����ӳ�Ͷ��ʱ��
    CntAggrConvParaIsMidBinSndDschDelay = 2;     //$7042 �������Ͳ����� �д��ֶ����ӳ�Ͷ��ʱ��
    CntAggrConvParaIsMidBinDschLong     = 3;     //$7043 �������Ͳ����� �д���Ͷ��ʱ��
    CntAggrConvParaIsMidBinSndDschLong  = 4;     //$7044 �������Ͳ����� �д��ֶ���Ͷ��ʱ��
    CntAggrConvParaIsMidBinLoadContinue = 5;     //$7045 �������Ͳ����� �д���װ�ϳ���ʱ��(��������/�����ӳ�ʱ��)
    CntAggrConvParaIsLevelBeltStopDelay = 6;     //$7046 �������Ͳ����� ƽƤ���ӳ�ֹͣʱ��
                                                 //$7047
    CntAggrConvParaIsMidBinDschPauseTm  = 8;     //$7048 �������Ͳ����� ���ο��ż��
    CntAggrConvParaIsSAND_WT            = 9;     //$7049 �������Ͳ����� ɰ��ʯ����ֵ
    CntAggrConvParaIsMidBinVibraDelay   = 10;    //$704A �������Ͳ����� �ӳ���ʱ��
    CntAggrConvParaIsMidBinVibraRunTm   = 11;    //$704B �������Ͳ����� ��ʱ��
    CntAggrConvParaIsMidBinVibraSTP     = 12;    //$704C �������Ͳ����� �񶯼��ʱ��
    CntAggrConvParaIsHopprRunMaxTm      = 13;    //$704D �������Ͳ����� ������ʱ��
    //CntAggrConvParaIs                          //704E  �������Ͳ�����
    //CntAggrConvParaIs                          //704F  �������Ͳ�����
    CntAggrConvParaIsAggreMode          = 16;    //7050 �������Ͳ����� ����������ʽ

Const
    CntAggreConvParaInfo : array[1..CntAggregateConvParaCount] of AggregateConvParaInfoRd
      = (
          ( CodeInDb           : 'TDC_F';
            OffsetInInstrument : CntOffsetOfAggreMidDschDelay;
            BufIndex           : CntBufIndexOfAggreMidDschDelay;
            ParaCode           : CntAggrConvParaIsMidBinDschDelay ),    //$7041 �д����ӳ�Ͷ��ʱ��

          ( CodeInDb           : 'TDC_S';
            OffsetInInstrument : CntOffsetOfAggreMidSndDschDelay;
            BufIndex           : CntBufIndexOfAggreMidSndDschDelay;
            ParaCode           : CntAggrConvParaIsMidBinSndDschDelay ),    //$7042 �ڶ����ӳ�Ͷ��ʱ��

          ( CodeInDb           : 'PRE_ULD_FST';
            OffsetInInstrument : CntOffsetOfAggreMidDschTm;
            BufIndex           : CntBufIndexOfAggreMidDschTm;
            ParaCode           : CntAggrConvParaIsMidBinDschLong ),    //$7043 �д���Ͷ��ʱ��

          ( CodeInDb           : 'PRE_ULD_SND';
            OffsetInInstrument : CntOffsetOfAggreMidSndDschTm;
            BufIndex           : CntBufIndexOfAggreMidSndDschTm;
            ParaCode           : CntAggrConvParaIsMidBinSndDschLong ),    //$7044 �ڶ��ο���ʱ��

          ( CodeInDb           : 'UP_TM';
            OffsetInInstrument : CntOffsetOfAggreMidLoadContinue;
            BufIndex           : CntBufIndexOfaggreMidLoadContinue;
            ParaCode           : CntAggrConvParaIsMidBinLoadContinue ),    //$7045 �д���װ�ϳ���ʱ��

          ( CodeInDb           : 'HSTAP_INTER';
            OffsetInInstrument : CntOffsetOfAggreBeltStopDelay;
            BufIndex           : CntBufIndexOfAggreBeltStopDelay;
            ParaCode           : CntAggrConvParaIsLevelBeltStopDelay ),    //$7046 ƽƤ���ӳ�ֹͣʱ�� �ڴ������±�

          ( CodeInDb           : '';
            OffsetInInstrument : 0;
            BufIndex           : -1;
            ParaCode           : 0),    //7047H

          ( CodeInDb           : 'INS_DRS';
            OffsetInInstrument : CntOffsetOfAggreMidDschPauseTm;
            BufIndex           : CntBufIndexOfAggreMidDschPauseTm;
            ParaCode           : CntAggrConvParaIsMidBinDschPauseTm ),    //7048 ���ο��ż��

          ( CodeInDb           : 'SAND_WT';
            OffsetInInstrument : CntOffsetOfSAND_WT;
            BufIndex           : CntBufIndexOfSAND_WT;
            ParaCode           : CntAggrConvParaIsSAND_WT ),    //7049 ɰ��ʯ����ֵ

          ( CodeInDb           : 'PRE_QIV_DLY';
            OffsetInInstrument : CntOffsetOfVibraDelay;
            BufIndex           : CntBufIndexOfVibraDelay;
            ParaCode           : CntAggrConvParaIsMidBinVibraDelay ),    //704A �ӳ���ʱ��

          ( CodeInDb           : 'PRE_QIV_TIM';
            OffsetInInstrument : CntOffsetOfVibraRunTm;
            BufIndex           : CntBufIndexOfVibraRunTm;
            ParaCode           : CntAggrConvParaIsMidBinVibraRunTm ),    // 704B ��ʱ��

          ( CodeInDb           : 'PRE_QIV_STP';
            OffsetInInstrument : CntOffsetOfVibraSTP;
            BufIndex           : CntBufIndexOfVibraSTP;
            ParaCode           : CntAggrConvParaIsMidBinVibraSTP ),    //704C �񶯼��ʱ��

          ( CodeInDb           : 'TUP_DOWN_WRN';
            OffsetInInstrument : CntOffsetOfRunMaxTm;
            BufIndex           : CntBufIndexOfRunMaxTm;
            ParaCode           : CntAggrConvParaIsHopprRunMaxTm ),    //704D ������ʱ��

          ( CodeInDb           : '';
            OffsetInInstrument : 0;
            BufIndex           : -1;
            ParaCode           : 0),    //704E

          ( CodeInDb           : '';
            OffsetInInstrument : 0;
            BufIndex           : -1;
            ParaCode           : 0),    //704F

          ( CodeInDb           : 'PRE_BON_MDL';
            OffsetInInstrument : CntOffsetOfAggreMode;
            BufIndex           : CntBufIndexOfAggreMode;
            ParaCode           : CntAggrConvParaIsAggreMode )     //7050H ����������ʽ
        );
//-----------------------�����м�ֲ�������-------------------------------------

//------------------------���������--------------------------------------------
var
    MixerStateInInstru : Integer;     //�����Ǳ��ڽ����״̬ (0020H)
    MixerFlash         : Integer;     //���������
    MixerFlashTmr      : Integer;     //�����������ʱ��
var
    ConveryBeltStateInInstru   : Integer;    //�����Ǳ���бƤ��״̬     (002DH)
    AggrMidHopperStateInInstru : Integer;    //�����Ǳ��ڹ����м��״̬ (0021H)

var
    MixerFalshState : array[1..2] of Integer;    //���������״̬
Const
    CtMxrFlashStIsNone      = 0;    //��������� ��
    CtMxrFlashStIsEmptyStop = 1;    //��������� ��ͣ
    CtMxrFlashStIsFullStop  = 2;    //��������� ��ͣ
    CtMxrFlashStIsEmptyRun  = 3;    //��������� ������
    CtMxrFlashStIsFullRun   = 4;    //��������� ������
var
    BtnMxrDschValveOpState : array[1..2] of Integer;    //�����ж���� ���Ű�ť״̬
Const
    CtBtnMxrDschValveOpStIsNone    = 0;    //�����ж���� ���Ű�ť״̬ Ϊ ������
    CtBtnMxrDschValveOpStIsValid   = 1;    //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
    CtBtnMxrDschValveOpStIsInvalid = 2;    //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
var
    BtnMxrDschValveClState : array[1..2] of Integer;    //�����ж���� ���Ű�ť״̬
Const
    CtBtnMxrDschValveClStIsNone    = 0;    //�����ж���� ���Ű�ť״̬ Ϊ ������
    CtBtnMxrDschValveClStIsValid   = 1;    //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
    CtBtnMxrDschValveClStIsInvalid = 2;    //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
var
    MixerDschValveImgState : array[1..2] of Integer;    //�����ж���� ״̬
Const
    CtMxrDschValStIsNone     = 0;    //�����ж���� ״̬ ������
    CtMxrDschValStIsOpen     = 1;    //�����ж���� ״̬  ��
    CtMxrDschValStIsClose    = 2;    //�����ж���� ״̬  ��
    CtMxrDschValStIsHalfOpen = 3;    //�����ж���� ״̬  �뿪
    CtMxrDschValStIsAlarm    = 4;    //�����ж���� ״̬   ����

var
    PmSltMixerId : Integer;    //�Ҽ�ѡ��Ľ������

type
    MixerInfoRd = Record
      FstDschEn                 : Boolean ;    //����ж��ʹ��
      DschMode                  : Integer;     //ж��ģʽ
      AggreDschEn               : Boolean;     //�������ж��
      LoadIntoEn                : Boolean;     //�����װ��ʹ��
      DschEn                    : Boolean;     //�����ж��ʹ��
      MaxCap                    : double;      //�������
      MixerDschLinkToPowderLoad : Boolean;     //����δ���꣬�Ƿ���������ж��
      Flags                     : String[50];  //���������
    end;

Const    //�����ж��ģʽ
    CntMixerDischOne = 1;    //������ж��
    CntMixerDischTwo = 2;    //˫�źſ��ơ�����λ��ͨ��Һѹ

var
    MixerInfo :  MixerInfoRd;

Const
    CntMixerParaCount = 12;

type
    MixerParaInfoRd = Record
        CedeInDb            : String ;    //���ݿ��еĴ���
        IndexInParaArray    : Integer ;   //�������������
        AddressInInstrument : Integer;    //�������еĲ�����ַ
        ParaCode            : Integer;    //��������
    end;
Const    //�����ڿ������е�ͨѶ��ַ
    CntAddrOfMixingSetLngInInstru = $0702;    //0702���� �ڿ������е�ͨѶ��ַ ����ʱ��
    CntAddrOfSndMixingSetLngInInstru = $0703;   //0703���� �ڿ������е�ͨѶ��ַ ���ν���ʱ��
    CntAddrOf3rdMixingSetLngInInstru = $0704;   //0704���� �ڿ������е�ͨѶ��ַ ���ν���ʱ��
    CntAddrOf4thMixingSetLngInInstru = $0705;   //0705���� �������е�ͨѶ��ַ �Ĵν���ʱ��
    CntAddrOf5thMixingSetLngInInstru = $0706;   //0706���� �������е�ͨѶ��ַ ��ν���ʱ��
    CntAddrOfDschSetLngInInstru = $0707;        //0707���� �������е�ͨѶ��ַ ȫ����ж��ʱ��
    CntAddrOfInchDschCountInInstru = $0708;     //0708���� �������е�ͨѶ��ַ �㶯���Ŵ���
    CntAddrOfInchOpenLngInInstru =$0709;        //0709���� �������е�ͨѶ��ַ �㶯����ʱ��
    CntAddrOfInchCloseLngInInstru =$070A;       //070A���� �������е�ͨѶ��ַ �㶯����ʱ��
    CntAddrOfHalfDschLngInInstru =$070B;        //070B���� �������е�ͨѶ��ַ �뿪�ų���ʱ��
    CntAddrOfHalfDschCkeckDelayInInstru =$070C; //070C���� �������е�ͨѶ��ַ �ӳټ��뿪��ʱ��
    CntAddrOfMixingTmrStartInInstru =$070D;     //070D���� �������е�ͨѶ��ַ �����ʱ��ʼʱ��
Const    //�������ڴ������е����
    CntIndexOfMixingTmrStartInArray = 1;        //070D���� �ڴ������е���� �����ʱ��ʼʱ��
    CntIndexOfMixingSetLngInArray = 2;          //0702H�ڴ������е���� ����ʱ��
    CntIndexOfSndMixingSetLngInArray = 3;       //0703���� ���ڴ������е���� ���ν���ʱ��
    CntIndexOf3rdMixingSetLngInArray = 4;       //0704���� �ڴ������е���� ���ν���ʱ��
    CntIndexOf4thMixingSetLngInArray = 5;       //0705���� �ڴ������е���� �Ĵν���ʱ��
    CntIndexOf5thMixingSetLngInArray = 6;       //0706���� �ڴ������е���� ��ν���ʱ��
    CntIndexOfDschSetLngInArray = 7;            //0707���� �ڴ������е���� ȫ����ж��ʱ��
    CntIndexOfInchDschCountInArray = 8;         //0708���� �ڴ������е���� �㶯���Ŵ���
    CntIndexOfInchOpenLngInArray = 9;           //0709���� �ڴ������е���� �㶯����ʱ��
    CntIndexOfInchCloseLngInArray =10;          //070A���� �ڴ������е���� �㶯����ʱ��
    CntIndexOfHalfDschLngInArray = 11;          //070B���� �ڴ������е���� �뿪�ų���ʱ��
    CntIndexOfHalfDschCkeckDelayInArray = 12;   //070C���� �ڴ������е����  �ӳټ��뿪��ʱ��
    
Const
    CntMixerParaCodeIsMixingSetLng       = 1 ;          //0702H ����ʱ��
    CntMixerParaCodeIsSndMixingSetLng    = 2 ;          //0703���� ���ν���ʱ��
    CntMixerParaCodeIs3rdMixingSetLng    = 3 ;          //0704���� ���ν���ʱ��
    CntMixerParaCodeIs4thMixingSetLng    = 4 ;          //0705���� �Ĵν���ʱ��
    CntMixerParaCodeIs5thMixingSetLng    = 5 ;          //0706���� ��ν���ʱ��
    CntMixerParaCodeIsDschSetLng         = 6 ;          //0707���� ȫ����ж��ʱ��
    CntMixerParaCodeIsInchDschCount      = 7 ;          //0708���� �㶯���Ŵ���
    CntMixerParaCodeIsInchOpenLng        = 8 ;          //0709���� �㶯����ʱ��
    CntMixerParaCodeIsInchCloseLng       = 9 ;          //070A���� �㶯����ʱ��
    CntMixerParaCodeIsHalfDschLng        = 10;          //070B���� �뿪�ų���ʱ��
    CntMixerParaCodeIsHalfDschCkeckDelay = 11;          //070C���� �ӳټ��뿪��ʱ��
    CntMixerParaCodeIsMixingTmrStart     = 12;          //070D���� �����ʱ��ʼʱ��

    //������Ϣ
Const
    CntMixerParaInfo : array[1..CntMixerParaCount] of MixerParaInfoRd    //����ʾ˳������
      = (
          ( CedeInDb            : 'BLD_BLD_MDL' ;
            IndexInParaArray    : CntIndexOfMixingTmrStartInArray  ;
            AddressInInstrument : CntAddrOfMixingTmrStartInInstru;
            ParaCode            : CntMixerParaCodeIsMixingTmrStart),  // 1��070DH �����ʱ��ʼʱ��

          ( CedeInDb            : 'BLD_FST' ;
            IndexInParaArray    : CntIndexOfMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOfMixingSetLngInInstru;
            ParaCode            : CntMixerParaCodeIsMixingSetLng),    // 2��0702H ����ʱ��

          ( CedeInDb            : 'BLD_SND' ;
            IndexInParaArray    : CntIndexOfSndMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOfSndMixingSetLngInInstru;
            ParaCode            : CntMixerParaCodeIsSndMixingSetLng),   // 3��0703H ���ν���ʱ��

          ( CedeInDb            : 'BLD_THD' ;
            IndexInParaArray    : CntIndexOf3rdMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOf3rdMixingSetLngInInstru;
            ParaCode            : CntMixerParaCodeIs3rdMixingSetLng),  // 4��0704H ���ν���ʱ��

          ( CedeInDb            : 'BLD_FOR' ;
            IndexInParaArray    : CntIndexOf4thMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOf4thMixingSetLngInInstru ;
            ParaCode            : CntMixerParaCodeIs4thMixingSetLng),  // 5��0705H �Ĵν���ʱ��

          ( CedeInDb            : 'BLD_FIV' ;
            IndexInParaArray    : CntIndexOf5thMixingSetLngInArray  ;
            AddressInInstrument : CntAddrOf5thMixingSetLngInInstru;
            ParaCode            : CntMixerParaCodeIs5thMixingSetLng),  // 6��0706H ��ν���ʱ��

          ( CedeInDb            : 'BLD_ULD_LST' ;
            IndexInParaArray    : CntIndexOfDschSetLngInArray  ;
            AddressInInstrument : CntAddrOfDschSetLngInInstru ;
            ParaCode            : CntMixerParaCodeIsDschSetLng),      //7��0707H ȫ����ж��ʱ��

          ( CedeInDb            : 'BLD_DOT_CNT' ;
            IndexInParaArray    : CntIndexOfInchDschCountInArray  ;
            AddressInInstrument : CntAddrOfInchDschCountInInstru;
            ParaCode            : CntMixerParaCodeIsInchDschCount),   // 8��0708H �㶯���Ŵ���

          ( CedeInDb            : 'BLD_DOT_ON' ;
            IndexInParaArray    : CntIndexOfInchOpenLngInArray  ;
            AddressInInstrument : CntAddrOfInchOpenLngInInstru;
            ParaCode            : CntMixerParaCodeIsInchOpenLng),    // 9��0709H �㶯����ʱ��

          ( CedeInDb            : 'BLD_DOT_OFF' ;
            IndexInParaArray    : CntIndexOfInchCloseLngInArray  ;
            AddressInInstrument : CntAddrOfInchCloseLngInInstru ;
            ParaCode            : CntMixerParaCodeIsInchCloseLng),   // 10��070AH �㶯����ʱ��

          ( CedeInDb            : 'BLD_HLF_LST' ;
            IndexInParaArray    : CntIndexOfHalfDschLngInArray  ;
            AddressInInstrument : CntAddrOfHalfDschLngInInstru;
            ParaCode            : CntMixerParaCodeIsHalfDschLng),   // 11��070BH �뿪�ų���ʱ��

          ( CedeInDb            : 'BLD_CHK_HLF' ;
            IndexInParaArray    : CntIndexOfHalfDschCkeckDelayInArray  ;
            AddressInInstrument : CntAddrOfHalfDschCkeckDelayInInstru ;
            ParaCode            : CntMixerParaCodeIsHalfDschCkeckDelay)// 12��070CH �ӳټ��뿪��ʱ��
        );

type
    MixerParaRd = Record
        Name    : String[30];
        Value   : Integer ;
        Decimal : Integer ;
        Unt     : String[6];
        Flags   : String[10];
    end;
var
    MixerPara : array[1..CntMixerParaCount] of MixerParaRd;

//------------------------�������������----------------------------------------

//------------------------���������豸------------------------------------------
//var
//    ConveryBeltFlash           : Integer;    //бƤ������
//    ConveryBeltTmr             : Integer;    //бƤ��������ʱ��



//------------------------���崴������------------------------------------------
var
    FrmBasicSettingCrt           : Boolean ;    //�������ô���
    FrmRecipeCrt                 : Boolean;     //�䷽����
    FrmTaskCrt                   : Boolean;     //����������
    FrmWeigAttrCrt               : Boolean;     //�����Դ���
    FrmWeigDschRemainCrt         : Boolean;     //��ж�Ͽ��ϴ���
    FrmWeigherCalValueCrt        : Boolean;     //У��ֵ����
    FrmPersonnelMangementCrt     : Boolean;     //��Ա������
    FrmSetPassWordCrt            : Boolean;     //�������봰��
    FrmStorageAttributeCrt       : Boolean;     //�ϲ����Դ���
    FrmAggrConceyorHopperAttrCrt : Boolean;     //���������豸���Դ���
    FrmMixParaCrt                : Boolean;     //���������
    FrmCommunicationSetCrt       : Boolean;     //ͨѶ���ô���
    FrmSignalDefineCrt           : Boolean;     //�źŶ��崰��
    FrmSysUnlockCrt              : Boolean;     //��������
    FrmLftHopperCrt              : Boolean;     //���������Դ���
    FrmSysAboutCrt               : Boolean;     //����ϵͳ����
    FrmConfigCrt                 : Boolean;     //�豸���ô���
    FrmMaterialStorageCrt        : Boolean;     //ԭ����ⴰ��
    FrmMaterialLstCrt            : Boolean;     //ԭ���б�
    FrmModifyStocksCrt           : Boolean;     //����������
    FrmStocksCrt                 : Boolean;     //�����ʾ����
var
    FrmMaLstUseMode : Integer;                  //ԭ���б���ʹ��Ŀ��
Const
    CntFrmMaLstIsMaSelForHouse = 1;             //ԭ���б���ʹ��Ŀ�� �� �������ѡ��
    
//----------------------���崴����������----------------------------------------

var
    InstrumentState : Integer;                //0024H ��λ��״̬
    WgherLoadEnableInInstrument : Integer;    //��λ���� �Ǳ�����ʹ��״̬
    AutoRingState   : Integer;                //0710H �Զ�����״̬
    MixerProdCounterInInstru  : Integer;      //0040H �������������������
    MixerMixingTmrInInstu     : Integer;      //0041H ����������ʱ��
    MixerDschTmrInInstru      : Integer;      //0042H �����ж�ϼ�ʱ��
    AggrLoadCounterInInstru   : Integer;      //0043H �м����������������
    AggrConveyTmrInInstrument : Integer;      //0044H ��λ���еĹ������ͼ�ʱ�� ��������бƤ�����ͳ���ʱ�� / �����������ӳ�ʱ��
    AggrMidBinDschTmrInInstru : integer;      //0045H ��λ���й����м��Ͷ��ʱ���ʱ��
//----------------                                        ----------------------
//-------------------------------������-----------------------------------------

{�����ͼƬ}
Const    //ж�Ϸ�ͼƬ״̬
    CntWeigDischValveIsInvalid = 0;    //ж�Ϸ���Ч״̬
    CntWeigDischValveIsClose   = 1;    //ж�Ϸ��ر�״̬
    CntWeigDischValveIsOPen    = 2;    //ж�Ϸ���״̬
var
    WeigherDischValveImgState : Array[1..WeigherCount] of Integer;              //��ж�Ϸ�ͼƬ״̬
    
var
    WeigherDischVibraImgState : Array[1..WeigherCount] of Integer;              //��ж������ͼƬ״̬

Const    //��ж�Ϸ�������λͼƬ
    CntWghrDschValveClsLmtImgIsInvalid      = 1;    //��ж�Ϸ�����ͼƬ ��Ч     ״̬
    CntWghrDschValveClsLmtImgIsValid        = 2;    //��ж�Ϸ�����ͼƬ ��Ч     ״̬
    CntWghrDschValveClsLmtImgIsValidFlash   = 3;    //��ж�Ϸ�����ͼƬ ��Ч��˸ ״̬
    CntWghrDschValveClsLmtImgIsInvalidFlash = 4;    //��ж�Ϸ�����ͼƬ ��Ч��˸ ״̬
var
    WeigherDischValveCloseLmtImgState : Array[1..WeigherCount] of Integer;      //��ж�Ϸ��ر���λͼƬ״̬


{�ϲּ�����ͼƬ����}
Const
    CntSiloLdValveImgIsLd   = 1;   //�ϲּ�����ͼƬ���� �� ������   ͼƬ
    CntSiloLdValveImgIsFnLd = 2;   //�ϲּ�����ͼƬ���� �� �������� ͼƬ

    {������ͼƬ���ͳ���}
Const
    CntAggregateLoadImg   = 1;    //���ϼ�����ͼƬ
    CntAggregateFineImg   = 2;    //���Ͼ�������ͼƬ
    CntPowderLoadImg      = 3;    //���ϲּ�����ͼƬ
    CntPowderFineImg      = 4;    //���ϲ־�������ͼƬ
    CntLiqLoadImg         = 5;    //Һ�ּ�����ͼƬ
    CntLiqFineImg         = 6;    //Һ�־�������ͼƬ
    CntAggregateCoLoadImg = 7;    //���ϴּ�����ͼƬ
    CntPowderCoLoadImg    = 8;    //���ϴּ�������ͼƬ
    CntLiqCoLoadImg       = 9;    //Һ��ִּ�����ͼƬ

{������ͼƬ״̬}
    CntLoadImgStateIsInvalid = 0;    //������ͼƬ Ϊ ��Ч״̬
    CntLoadImgStateIsClose   = 1;    //�����Źر�״̬
    CntLoadImgStateIsOpen    = 2;    //�����Ŵ�״̬
var
    StorageLoadImgState     : array[1..CntStorageCount] of integer;             //�ϲּ�����ͼƬ״̬
    StorageFineLoadImgState : array[1..CntStorageCount] of integer;             //�ϲ־�������ͼƬ״̬
    StorageVibratorImgState : array[1..CntStorageCount] of integer;             //�ϲ�����ͼƬ״̬
Const
    CntVibraImgStaIsInvalid = 0;    //���� ͼƬ ��Ч ״̬
    CntVibraImgStaIsClose   = 1;    //���� ͼƬ ��   ״̬
    CntVibraImgStaIsOpen    = 2;    //���� ͼƬ ��   ״̬

//var
//    StorageLoadValueLabVisible : array[1..CntStorageCount] of Boolean;

var
    BtnIncProdSetCountState ,    //���� �������� ��ť״̬
    BtnDecProdSetCountState :    //���� �������� ��ť״̬
                              Integer;
Const
    BtnProdSetCountStIsEnbale  = 1;    //����������ť ��Ч
    BtnProdSetCountStIsDisable = 2;    //����������ť ��Ч

var
    BtnAggrDisaDschState ,    //��ֹ��ж ��ť״̬
    BtnMixerDisaLoadInState,  //��ֹͶ�� ��ť״̬
    BtnMixerDisaDschState ,   //��ֹж�� ��ť״̬
    BtnRingState              //�Զ����� ��ť״̬
      : Integer;
Const
    CntBtnCheckStateIsTrue  = 1;   //��ť״̬ Ϊ ��ѡ
    CntBtnCheckStateIsFalse = 2;   //��ť״̬ Ϊ �޹�ѡ
var
    BtnProdPauseEnableState : Integer;    //������ͣ Enable ״̬
Const
    CtBtnProdPauseEnStIsTrue  = 1;    //������ͣ��ť Enable True
    CtBtnProdPauseEnStIsFalse = 2;    //������ͣ��ť Enable False
var
    BtnProdPauseCaptionState : Integer;    //������ͣ��ť Caption ״̬
Const
    CtBtnProdPauseCpIsPause   = 1;    //������ͣ��ť Caption ��ͣ���� ״̬
    CtBtnProdPauseCaIsRestart = 2;    //������ͣ��ť Caption �ָ����� ״̬
var
    BtnProdStartCaptionState : Integer;    //����������ť Caption ״̬
Const
    CtBtnProdStatCpIsStart = 1;    //����������ť Caption Ϊ ��������
    CtBtnProdStatCpIsEnd   = 2;    //����������ť Caption Ϊ ��������
var
    LbWgrLdCounterVisibleState : array[1..WeigherCount] of Integer;    //�����ϼ�������ǩ�� Visible ����
Const
    CtLbWgrLdCounterVisibleIsTrue  = 1;    //�����ϼ�������ǩ�� Visible Ϊ True
    CtLbWgrLdCounterVisibleIsFalse = 2;    //�����ϼ�������ǩ�� Visible Ϊ False
//-------------------------------������-----------------------------------------
//----------------                                        ----------------------

//--------------------------�������̲���----------------------------------------
//----------------------------------------------
//var
//    ProdRecipeCode : String;
//    StorageLoadRecipe : array[1..CntStorageCount] of Double;    //�ϲ��䷽ֵ
//    StorageLoadTarget : array[1..CntStorageCount] of Double;    //�ϲ�����Ŀ��ֵ
//    ProdAmount      : Double ;    //��������
//    ProdBatchsCount : Integer;    //��������
//    ProdBatchAmount : Double ;    //���̷���
//    WeigherLoadTarget : array[1..WeigherCount] of array[1..4] of Integer;
//----------------------------------------------

//    ProdStartRow : Integer;    //����������

//type
//    ProdNoticeInfoRd = Record     //�����ɳ�����Ϣ
//      TaskGrdRow        : Integer;       //������к�
//      ProdTask_Code     : String[30];    //�����������
//      ProdRecipe_Code   : String[20];    //������ȱ��
//      ProdStoraLdRecipe : array[1..CntStorageCount] of Double;    //�����ϲ��䷽ֵ
//      ProdStoraLdTarget : array[1..CntStorageCount] of Double;    //�����ϲ�����Ŀ��ֵ
//      ProdAmount        : Double ;    //��������
//      ProdBatchsCount   : Integer;    //��������
//      ProdBatchAmount   : Double ;    //���̷���
//      InstruLoadRdPt    : Integer;     //�Ǳ��¼��ָ��
//      //WeigherLoadTarget : array[1..WeigherCount] of array[1..4] of Integer;
//    end;
//Const
//    CntProdNoticeInfoQueueLen = 3;    //�ɳ�����Ϣ���г���
//var
//    ProdNoticeInfo : array[1..CntProdNoticeInfoQueueLen] of ProdNoticeInfoRd;   //�����ɳ�����Ϣ
//var
//    ProdNoticeInfoWtPt ,             //�����ɳ�����Ϣдָ��
//    ProdNoticeInfoRdPt : Integer;    //�����ɳ�����Ϣ��ָ��

//type
//    InstruLoadRecordRd = Record
//      WeigherLoadTarget : array[1..WeigherCount] of array[1..4] of double;    //�Ǳ�����Ŀ��ֵ
//      WeigherLoadAmont  : array[1..WeigherCount] of array[1..4] of double;    //�Ǳ�����ֵ
//    end;
//var
//    InstruLoadRecord : array[1..CntProdNoticeInfoQueueLen] of InstruLoadRecordRd;    //�Ǳ����ϼ�¼
//var
//    InstruLoadRdWtPt : array[1..WeigherCount] of Integer;    //�Ǳ��¼дָ��
//------------------------------------------------------------------------------
var
    ProdStartRow : Integer;

var
    ProdNoticeInfoRdPt ,             //�����ɳ�����Ϣ��ָ��
    ProdNoticeInfoWtPt : Integer;    //�����ɳ�����Ϣдָ��

    ProdWtPieceInDbEn  : Boolean;    //����д�����ݵ����ݿ�

type
    ProdStorateLdRecipeRd = Record
        EndBatchNumber   : Integer;
        LoadRecipe       : Double;
    end;
Const
    CntProdStoraLdRceQueueLen = 4;    //�ϲ��䷽���г���

type
    ProdStoraLdTargetRd = Record
      EndBatchNumber : Integer;
      LoadTarget       : Double;
    end;
Const
    CntProdStorageTargetQueueLen = 4;    //�ϲ�����Ŀ��ֵ���г���

type
    StorageMateriaWatFulRd = Record    //�ϲ�ԭ�Ϻ�ˮ��
      BeginBatchNumber : Integer;
      WatFul           : Double;
    end;
Const
    CntStorMatWatFulQueueLen = 4;

type
    ProdNoticeInfoRd = Record     //�����ɳ�����Ϣ
      ProdNotice_ID      : Longint;       //�����ɳ�����
      ProdTask_Code      : String[30];    //�����������
      ProdRecipe_Code    : String[20];    //������ȱ��
      ProdAmount         : Double ;       //��������
      ProdBatchsCount    : Integer;       //��������
      ProdBatchAmount    : Double ;       //���̷���
      ProdTask_IdInDb    : LongInt ;      //������ ���ݿ��е�ID��
      LdStorageCounter   : Integer;       //���ϲ�����

      SiloLoadEn         : array[1..CntStorageCount] of Boolean;
      SiloLdNumInNotice  : array[1..CntStorageCount] of Integer;    //���������У����ϲֵ������������

      ProdStoraLdRecipe  : array[1..CntStorageCount] of array[1..CntProdStoraLdRceQueueLen] of ProdStorateLdRecipeRd;    //�����ϲ��䷽ֵ
      ProdStoraLdRecWtPt : array[1..CntStorageCount] of Integer;    //�ϲ�������ȶ���дָ��
      ProdStoraLdRecRdPt : array[1..CntStorageCount] of Integer;    //�ϲ�������ȶ��ж�ָ��

      ProdStorageLdTarget   : array[1..CntStorageCount] of array[1..CntProdStorageTargetQueueLen] of ProdStoraLdTargetRd;   //�����ϲ�����Ŀ��ֵ
      ProdStorageLdTargWtPt : array[1..CntStorageCount] of Integer;    //�����ϲ�����Ŀ��ֵ����дָ��
      ProdStorageLdTargRdPt : array[1..CntStorageCount] of Integer;    //�����ϲ�����Ŀ��ֵ���ж�ָ��

      StorageMaterialWatFul : array[1..CntStorageCount] of array[1..CntStorMatWatFulQueueLen] of StorageMateriaWatFulRd;    //�ϲ�ԭ�Ϻ�ˮ��ֵ
      StorMatWatFulWtPt     : array[1..CntStorageCount] of Integer;    //�ϲֺ�ˮ��ֵдָ��
      StorMatWatFulRdPt     : array[1..CntStorageCount] of Integer;    //�ϲֺ�ˮ��ֵ��ָ��

      WtDbPieceId           : Integer;     //������д�̺� 
    end;

Const
    CntProdNoticeInfoLen = 4;
var
    ProdNoticeInfo : array[1..CntProdNoticeInfoLen] of ProdNoticeInfoRd;    //�����ɳ�����Ϣ

Const
    CntLoadValueQueueLen = 4;    //����ֵ������Ŀ��ֵ��ʵ������ֵ�����г���

type
    WghrLoadInfoRd = Record
        RecordBatchCount    : Integer;    //��¼�����̴�

        LoadFactDsp   : Boolean;    //����ֵ��ʾ
        RdFactLoadEna : Boolean;    //��ʵ������ֵʹ��λ
        Rd2ndLoadEna  : Boolean;    //���۳�����ֵʹ��λ
        RdFactWaitPt  : Integer;    //������ֵ�ȴ�ָ��

        Rd2ndSiloId   : Integer;    //�۳��ϲֺ� 

        WtLoadValuePt : Integer;    //д����ֵָ��
        RdLoadValuePt : Integer;    //������ֵָ��
        //LoadTarget    : array[1..CntLoadValueQueueLen] of array[1..4] of double;    //����Ŀ��ֵ
        LoadTarget    : array[1..4] of Integer;
        //LoadFact      : array[1..CntLoadValueQueueLen] of array[1..4] of Double;   //ʵ������ֵ
    end;

var
    WeigherLoadInfo : array[1..WeigherCount] of WghrLoadInfoRd;

//���ϼ�¼ֵ
type
    SiloLdInfoRd = Record
      WtPt        : Integer;
      Wt2ndPt     : Integer;     //�۳Ƽ�¼дָ��
      RdPt        : Integer;
      LoadFact    : array[1..CntLoadValueQueueLen] of Double;    //���ϼ���ֵ
      LoadTarget  : array[1..CntLoadValueQueueLen] of Double;    //����Ŀ��ֵ
      ErrorIsOver : array[1..CntLoadValueQueueLen] of Integer;   //���ϳ�������
    end;
const
    CntLdErrIsNegative = -1;    //������
    CntLdErrIsNone     = 0 ;    //�޳���
    CntLdErrIsPositive = 1 ;    //������

var
    SiloLoadInfo : array[1..CntStorageCount] of SiloLdInfoRd ;

type
    ReadPieceNumberInfoRd = Record
      RdWaitEn       : Boolean;    //��ȡ�ȴ�
      RdBufPt        : Integer;    //���ջ�����ָ��
      SetPieceNumber : Integer;
    end;
var
    ReadPieceNumberInfo : ReadPieceNumberInfoRd;
//------------------------------------------------------------------------------

var
    GrdLdInfoEditing : Boolean;
    GrdLdInfoEdtRow  : Integer;
    GrdLdInfoEdtCol  : Integer;

type
    StoraLdTgtModiInfoRd = Record
        Ena        : Boolean;
        Tmr        : Integer;
        RevBufPt   : Integer;
        ModiStorId : Integer;
        NewTarget  : Double;
    end;
var
    StoraLdTgtModiInfo : StoraLdTgtModiInfoRd;

type
    ProdBatchsModiInfoRd = Record
        Ena : Boolean;
        ModiTp : Integer;    //>0Ϊ�ӣ�<0Ϊ��
        Tmr : Integer;
        RevBufPt : Integer;
    end;
Const
    CtProdBatchsModiIsInc = 1;
    CtProdBatchsModiIsDec = -1;
var
    ProdBatchsModiInfo : ProdBatchsModiInfoRd;
    
implementation

end.
