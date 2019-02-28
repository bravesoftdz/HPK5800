unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Inifiles, DB, ADODB, OleCtrls, MSCommLib_TLB, ExtCtrls, StdCtrls,
  ComCtrls,
  UnitGlobeVar, pngimage, Menus,  acPNG, acImage, Buttons,
  sSpeedButton,
  sColorSelect,
  sUpDown,
  sPanel,
  sComboBox,
  sTreeView,
  acShellCtrls,
  sComboBoxes,
  sStatusBar,
  sButton,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxCheckBox,
  ImgList,
  cxImage,
  cxTextEdit,
  cxMaskEdit,
  cxSpinEdit,
  cxDropDownEdit,
  cxButtonEdit,
  Mask,
  Grids,
  AdvObj,
  BaseGrid,
  AdvGrid,
  AdvSpin,
  bsSkinCtrls,
  bsSkinExCtrls,
  bsSkinBoxCtrls,
  W7Classes,
  W7Buttons,
  AdvSmoothListBox,
  AdvSmoothComboBox,
  AdvSmoothLabel,
  AdvSmoothEdit,
  AdvSmoothEditButton,
  AdvSmoothDatePicker,
  AdvSmoothButton,
  CurvyControls,
  AdvFontCombo,
  AdvTreeComboBox,
  AdvDBLookupComboBox,
  AdvEdit,
  AdvEdBtn,
  DBAdvEdBtn,
  AdvQueryDialog,
  clisted,
  EditBtn,
  sSkinManager,
  sRadioButton,
  sLabel,
  GIFImage,
  sEdit,
  sSpinEdit,

  math,
  AdvGlassButton,
  AdvGlowButton,
  RzButton,
  AdvProgr,
  cxGroupBox, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxEdit, cxContainer, cxControls, cxButtons
  ,ShellAPI, jpeg;

type
  TBellImg = class(TImage)
  public
    procedure MSGEnter(var msg:TMessage);message CM_MOUSEENTER;    //��Ӧ�������Ϣ
    procedure MSGLeave(var msg : TMessage);message CM_MOUSELEAVE;    //��Ӧ�뿪����Ϣ
  end;

type
  TFrmMain = class(TForm)
    ADOConnection: TADOConnection;
    Instruction1MSComm: TMSComm;
    Instruction1MscommTmr: TTimer;
    ADOQuery1: TADOQuery;
    PMWeigher: TPopupMenu;
    NWeigheStart: TMenuItem;
    NWeigherStop: TMenuItem;
    N3: TMenuItem;
    NWeigherrDschRemain: TMenuItem;
    N5: TMenuItem;
    NWeigherCalZero: TMenuItem;
    NWeigherCal: TMenuItem;
    N8: TMenuItem;
    NWeigherParaSet: TMenuItem;
    PMStorage123: TPopupMenu;
    N2: TMenuItem;
    RMStorageReplace1: TMenuItem;
    N6: TMenuItem;
    RMStorageSet1: TMenuItem;
    RMAddMater1: TMenuItem;
    MainMenu1: TMainMenu;
    N9: TMenuItem;
    PMAggregateMidBin: TPopupMenu;
    NMidBinPara: TMenuItem;
    PMMixer: TPopupMenu;
    j1: TMenuItem;
    N4: TMenuItem;
    NPerssonMangement: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    NRecipe: TMenuItem;
    NProdTask: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    Shape2: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Label3: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    sStatusBar1: TsStatusBar;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Label9: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    cxBtnAggreDschDsa: TcxButton;
    cxBtnMixerLoadDsa: TcxButton;
    cxBtnMixerDschDsa: TcxButton;
    BtnStartProd: TcxButton;
    cxBtnProdPause: TcxButton;
    cxBtnRing: TcxButton;
    ImageList1: TImageList;
    BtnIncProdSetCount: TcxButton;
    BtnDecProdSetCount: TcxButton;
    Shape19: TShape;
    Label10: TLabel;
    Shape20: TShape;
    Shape21: TShape;
    Label11: TLabel;
    Shape22: TShape;
    Shape23: TShape;
    sSkinManager1: TsSkinManager;
    AdvStrGdProdNotice: TAdvStringGrid;
    sCmbBxTruckCodeInNoticeInfo: TsComboBox;
    sCmbBxDriverInNoticeInfo: TsComboBox;
    ImageList2: TImageList;
    LbClentInNoticeInfo: TLabel;
    LbProdReciInNoticeInfo: TLabel;
    LbProjInfoInNOticeInfo: TLabel;
    LbProdAmountInNoticeInfo: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape24: TShape;
    LbTotalAmountInNoticeInfo: TLabel;
    LbTruckContInNoticeInfo: TLabel;
    LbPlanAmountInNoticeInfo: TLabel;
    StatusDspTmr: TTimer;
    TmrMscomStateDsp: TTimer;
    N26: TMenuItem;
    m1: TMenuItem;
    PMStorage: TPopupMenu;
    RMAddMater: TMenuItem;
    N28: TMenuItem;
    RMStorageReplace: TMenuItem;
    N27: TMenuItem;
    RMStorageSet: TMenuItem;
    SystemTmr: TTimer;
    cxBtnMixerDischOPen: TRzBitBtn;
    cxBtnMixerDischClose: TRzBitBtn;
    PresStartProd: TAdvProgress;
    TmrStartProd: TTimer;
    AdvStrGdProRd: TAdvStringGrid;
    EtNewLdTarg: TEdit;
    cxGroupBox1: TcxGroupBox;
    cBtnManulPrtDel: TcxButton;
    CkFrstBatchPrtDevl: TcxCheckBox;
    BtnProdContinue: TcxButton;
    Label1: TLabel;
    Shape1: TShape;
    Shape3: TShape;
    Shape18: TShape;
    sPanel1: TsPanel;
    sBtnProdNotice: TcxButton;
    cxButton2: TcxButton;
    cxButton5: TcxButton;
    cxButton3: TcxButton;
    cxButton1: TcxButton;
    NCommunicate: TMenuItem;
    N38: TMenuItem;
    NSysConfig: TMenuItem;
    N40: TMenuItem;
    NSingleDefine: TMenuItem;
    CkLastBatchPrtDevl: TcxCheckBox;
    s2: TMenuItem;
    Panel2: TPanel;
    Lb1SoftAuthor: TLabel;
    Lb2SoftAuthor: TLabel;
    Lb3SoftAuthor: TLabel;
    Panel3: TPanel;
    NMaterialStocks: TMenuItem;
    NProdData: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    SMMixerPara: TMenuItem;
    QryErp: TADOQuery;
    ADOSubErp: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Instruction1MscommTmrTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Instruction1MSCommComm(Sender: TObject);
    procedure ImgMixerContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure NWeigheStartClick(Sender: TObject);
    procedure NWeigherStopClick(Sender: TObject);
    procedure NWeigherrDschRemainClick(Sender: TObject);
    procedure NWeigherCalZeroClick(Sender: TObject);
    procedure NWeigherCalClick(Sender: TObject);
    procedure NWeigherParaSetClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure j1Click(Sender: TObject);
    procedure NRecipeClick(Sender: TObject);
    procedure NProdTaskClick(Sender: TObject);
    procedure AdvStrGdProdNoticeGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStrGdProdNoticeClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure AdvStrGdProdNoticeCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure sBtnProdNoticeClick(Sender: TObject);
    procedure StatusDspTmrTimer(Sender: TObject);
    procedure TmrMscomStateDspTimer(Sender: TObject);
    procedure NPerssonMangementClick(Sender: TObject);
    procedure m1Click(Sender: TObject);
    procedure RMAddMaterClick(Sender: TObject);
    procedure RMStorageReplaceClick(Sender: TObject);
    procedure RMStorageSetClick(Sender: TObject);
    procedure NMidBinParaClick(Sender: TObject);
    procedure AggrHopperOnContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure s1Click(Sender: TObject);
    procedure MixerImgContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure CoarseLoadMouseDn(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CoarseLoadMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadImgMouseDn(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadImgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SiloLdVibraClick(Sender: TObject);
    procedure WghrDschValveImgMouseDn(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WghrDschValveImgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WeigherDschVibraImgClick(Sender: TObject);
    procedure SystemTmrTimer(Sender: TObject);
    procedure AggrConvBeltRunBtnImgClick(Sender: TObject);
    procedure AggrMdHopperDschValveImgClick(Sender : TObject);
    procedure AggrMidBinDschVibraImgClick(Sender : TObject);
    procedure cxBtnMixerDischOPenClick(Sender: TObject);
    procedure cxBtnMixerDischCloseClick(Sender: TObject);
    procedure cxBtnAggreDschDsaClick(Sender: TObject);
    procedure cxBtnMixerLoadDsaClick(Sender: TObject);
    procedure cxBtnMixerDschDsaClick(Sender: TObject);
    procedure cxBtnRingClick(Sender: TObject);
    procedure cxBtnProdPauseClick(Sender: TObject);
    procedure BtnStartProdClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure TmrStartProdTimer(Sender: TObject);
    procedure AdvStrGdProRdClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure EtNewLdTargExit(Sender: TObject);
    procedure AdvStrGdProRdMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure AdvStrGdProRdMouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure EtNewLdTargKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIncProdSetCountClick(Sender: TObject);
    procedure BtnDecProdSetCountClick(Sender: TObject);
    procedure BtnProdContinueClick(Sender: TObject);
    procedure CkFrstBatchPrtDevlClick(Sender: TObject);
    procedure CkLastBatchPrtDevlClick(Sender: TObject);
    procedure cBtnManulPrtDelClick(Sender: TObject);
    procedure NCommunicateClick(Sender: TObject);
    procedure NSingleDefineClick(Sender: TObject);
    procedure LiftBucketGoUpBtnClick(Sender: TObject);
    procedure LiftBucketGoDnBtnClick(Sender: TObject);

    procedure LiftBucketGoDnMouseDn(Sender: TObject; Button: TMouseButton;    //������ �½� ��ť ��갴��
      Shift: TShiftState; X, Y: Integer);
    procedure LiftBucketGoDnMouseUp(Sender: TObject; Button: TMouseButton;    //������ �½� ��ť ���̧��
      Shift: TShiftState; X, Y: Integer);
    procedure LiftBucketGoUpMouseDn(Sender: TObject; Button: TMouseButton;    //������ ���� ��ť ��갴��
      Shift: TShiftState; X, Y: Integer);
    procedure LiftBucketGoUpMouseUp(Sender: TObject; Button: TMouseButton;    //������ ���� ��ť ���̧��
      Shift: TShiftState; X, Y: Integer);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure ImgBellMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgBellMouseDn(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure N18Click(Sender: TObject);
    procedure s3Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure NSysConfigClick(Sender: TObject);
    procedure NProdDataClick(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;

    procedure WeigherContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure StorageContexPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);

    procedure IniAdvStrGdProRd();
    procedure IniAdvStrGdProdNotice();
    procedure IniProdNoticeTb();                                    //��ʼ�������ɳ�����Ϣ��
    procedure DspSoftAuthorInfo();    //��ʾ�����Ȩ
    procedure DspProdNoticeFromDb();
    procedure DspNoticeInfo(NoticeTabRow : Integer);    //��ʾ�ɳ�����Ϣ

    procedure DspLiftBucketState(LiftBucketNum : Integer);    //ˢ��������״̬
      procedure LeftLiftBucketFlash();    //��������������ʾ

    procedure StoraLdTargetModifyRec();                 //�޸��ϲ�����Ŀ��ֵ���ճ���
    procedure ProdBatchsModifyRec();                    //�޸������������ճ���
    procedure WritePieceInfoIntoDb();                   //���̼�¼��Ϣд�������
    procedure DspAggrMidHopperState();                  //��ʾ�����м��״̬
    procedure MixerFlashDsp();                          //�����������ʾ
    procedure DspProdControlBtnState();                 //�������ư�ť״̬��ʾ

    procedure DspErpTask();
  public
    { Public declarations }
    {�����ͼƬ}
    WeigherImg : Array[1..WeigherCount] of TImage;
    WeigherDischValveImg : Array[1..WeigherCount] of TImage;                    //��ж�Ϸ�ͼƬ
    WeigherDischVibraImg : Array[1..WeigherCount] of TImage;                    //��ж������ͼƬ
    WeigherDischValveCloseLmtImg : Array[1..WeigherCount] of TImage;            //��ж�Ϸ� ���� ͼƬ
    WeigherValueLab : Array[1..WeigherCount] of TLabel;                         //��ֵ��ǩ
    WeigherLoadConterLab : array[1..WeigherCount] of TLabel;                    //�����ϼ������� ��ǩ

    //�ϲ����ͼƬ
    StorageImg              : array[1..CntStorageCount] of TImage;
    StorageLoadImg          : array[1..CntStorageCount] of TImage;              //�ϲּ�����ͼƬ
    StorageFineLoadImg      : array[1..CntStorageCount] of TImage;              //�ϲ־�������ͼƬ
    StorageVibratorImg      : array[1..CntStorageCount] of TImage;              //�ϲ�����ͼƬ

    
    //�����м��
    ImgAggregateMidBin     : array[1..2] of TImage;     //�����м��ͼƬ
    ImgAggrMidBinDschValve : array[1..2] of TImage;     //�����м��ж�Ϸ�
    ImgAggrMidBinOpenLmt   : array[1..2] of Timage;     //�����м�ֿ�����λ
    ImgAggrMIdBinCloseLmt  : array[1..2] of TImage;     //�����м�ֹ�����λ
    ImgAggrMidBinVibra     : array[1..2] of TImage;     //�����м������
    LabAggrMidBinDschTmr   : array[1..2] of TLabel;     //�����м��ж�ϼ�ʱ����ǩ
    LabAggrMIdBinLdCounter : array[1..2] of TLabel;     //�����м���̴μ�������ǩ
    ImgMidBinFull          : array[1..2] of TImage;     //�м������ʶͼƬ

    //���������豸
    ImgAggregateConveyor   : Array[1..6] of TImage;       //��������ͼƬ
    ImgAggrConvRunBtn      : array[1..6] of TImage;       //���������豸���а�ťͼƬ
    LabAggrConvHoldTmr     : array[1..2] of TLabel;       //�������ͳ�����ʱ����ǩ һ��2����ǩ����Ӧ����бƤ��

    //������������λ  1λ��������  2Ϊ��������
    ImgLiftBucketBottomLmt : array[1..2] of TImage;       //��������������λ
    ImgLiftBucketTopLmt    : array[1..2] of TImage;       //��������������λ

    //��������������
    ImgLiftBucketGoUp      : array[1..2] of TImage;       //�������������� ����
    ImgLiftBucketGoDn      : array[1..2] of TImage;       //�����������½� ����

    ImgLiftBucket          : array[1..2] of TImage;       //���������� ͼƬ

    //����������
    LabLiftBucketDschLab   : array[1..2] of TLabel;     //����������ж�ϼ�ʱ���Ʊ�ǩ
    LabLiftBucketDschTmr   : array[1..2] of TLabel;     //����������ж�ϼ�ʱ����ǩ
    LabLiftBucketPreRisLab : array[1..2] of TLabel;     //����������Ԥ������ʱ�����Ʊ�ǩ
    LabLiftBucketPreRisTmr : array[1..2] of TLabel;     //����������Ԥ������ʱ��
    LabLiftBucketLdCountLab: array[1..2] of TLabel;     //�����������̴μ��������Ʊ�ǩ
    LabLiftBucketLdCounter : array[1..2] of TLabel;     //�����������̴μ�������ǩ

    //�����
    ImgMixer            : array[1..2] of TImage;    //�����ͼƬ
    ImgMixerDschDoor    : array[1..2] of TImage;    //�����ж����
    LabMixerProdCounter : array[1..2] of TLabel;    //����������̴μ�������ǩ
    LabMixerDschTmr     : array[1..2] of TLabel;    //�����ж�ϼ�ʱ����ǩ

    LbMaterialNameInFrmMain,                                          //�������ϵĲ�������
    LbMaterialSpecInFrmMain : array[1..CntStorageCount] of TLabel;    //�������ϵĲ��Ϲ��
    StorageWaterParaLab     : Array[1..6]               of TLabel;    //�ϲֺ�ˮ��ֵ��ǩ�����֧���������ϲ֣����ϲֺ�С�ڵ���6
    StorageLoadTargetLab    : array[1..CntStorageCount] of TLabel;    //�ϲ�����Ŀ��ֵ��ǩ
    StorageLoadValueLab     : array[1..CntStorageCount] of TLabel;    //�ϲ�����Ŀ��ֵ��ǩ

    ImgBell : TBellImg;       //����ͼƬ

    Btn : TButton;

    //LeftLevelBelt ,
    //RightLevelBelt : TImage;      //����ƽƤ��

    //LeftInclinedBelt ,
    //RightInclineBelt : TImage;    //����бƤ������������



    procedure WtInstrument1MscommOutputBuf();    //дͨѶ����Buf
    procedure Instruction1MscommReceiveProg();    //ͨѶ���մ�;

    procedure IniLoadWeigherImg(WeigherId : Integer; X,Y,W,H : Integer);        //װ�س�ͼƬ
    procedure LoadWeigherDischValveImg(WeigherId : Integer; X,Y : Integer);     //װ�س�ж�Ϸ�ͼƬ
    procedure DspWeigherDschValveState(WeigherId : Integer; NewState : Integer);//��ж�Ϸ�ͼƬ����
    
    procedure LoadWeigherDischVibratorImg(WeigherId : Integer; X,Y : Integer);  //װ�س�ж������ͼƬ
    procedure DspWghrDschVibraState(WeigherId : Integer; NewState : Integer );  //��ж������ͼƬ״̬����
    
    procedure LoadWeigherDischValveCloseLmtImg(WeigherId : Integer;
      X,Y : Integer);                                                           //װ�س�ж�Ϸ��ر���λͼƬ
    procedure DspWghrDschValveCloseLmtImg(WeigherId : Integer; NewState : Integer);    //���³ƹ���ͼƬ״̬
    procedure LoadWeigherValueLabel(WeigherId : Integer; X,Y,W,H : Integer);    //װ�س�ֵ��ǩ

    procedure LoadStorageImgFromFile(ImageNo : Integer ; SourseImgDir : String;
      X,Y : Integer; Width, Height : Integer);                                      //���ļ���װ���ϲ�ͼƬ
    procedure LoadStorageDischImg(StorageId : Integer; LoadImgType : Integer;
      SourseImgDir : String; X,Y : Integer; Width, Height : Integer);               //�����ϲ����Ϸ�ͼƬ
    procedure DspSiloLOadVaveState(SiloId : Integer; SiloLoadVaveImgCode : Integer; //�����ϲּ�����ͼƬ��
      DigitalState : Integer ) ;

    procedure LoadStorageVibrator(StorageId : Integer;
      SourseImgDir : String; X,Y : Integer; Width, Height : Integer);               //�����ϲ�����ͼƬ
    procedure DSpSiloVibraImgState(DspSiloId : Integer; VibraNewState : Integer);    //��������ͼƬ״̬

    procedure LoadStorageMaterilInfoLb(StorageId : Integer);
    procedure LoadWeigherLoadCounerLab(WeigherId : Integer; X,Y : integer);      //�����ϼ����� ��ǩ
    procedure StorageMaterialMoistureLab(StorageId : Integer; X,Y : Integer);    //ԭ�Ϻ�ˮ�� ��ǩ
    procedure LoadStorageLoadTargerLab(StorageId : Integer);                     //�����ϲ�����Ŀ��ֵ��ǩ

    procedure LoadAggregateConveyorEquip(EquipNumber : Integer;                 //���ع��������豸
      SourseImgDir : String; X, Y, Width, Height : Integer);
    procedure LoadAggrConvHolpTmrLab(ConvyorBeltId : Integer; X,Y : Integer);    //����бƤ�����͹��ϳ���ʱ��
    procedure LoadAggrDschBeltRunBtn( EquipId : Integer;                         //����ƽƤ���㶯������ť
      SourseImgDir : String; X,Y,Width,Height : Integer);
    procedure DSPAggrConvEquipBtnIMgNewState(EquipId : Integer; NewState : Integer);    //���¹�������Ƥ�� ��ͣ��ťͼƬ ״̬

    procedure LoadLiftBucketLmtImg(LiftbucketNum : Integer; SourseImgDir : String;      //����������������λ
      X,Y : Integer; Width, Height : Integer; LmtType : Integer);
    procedure LoadLiftBucketBtnImg(LiftbucketNum : Integer; SourseImgDir : String;     //����������������ť
      X,Y : Integer; Width, Height : Integer; LmtType : Integer);

    procedure CreatLiftBucketPreRiseLab(LiftbucketNum : Integer; X,Y : Integer;   //����������Ԥ������ǩ
      Width, Height : Integer);
    Procedure CreatLiftBucketPreRiseTmrLab(LiftbucketNum : Integer; X,Y : Integer;   //����������Ԥ������ʱ��
      Width, Height : Integer);
    procedure CreatLiftBucketDschLab(LiftbucketNum : Integer; X,Y : Integer;         //����������ж�ϱ�ǩ
      Width, Height : Integer);
    procedure CreatLiftBucketDschTmrLab(LiftbucketNum : Integer; X,Y : Integer;      //����������ж�ϼ�ʱ��
      Width, Height : Integer);
    procedure CreatLiftBucketProCountNmLab(LiftbucketNum : Integer; X,Y : Integer;   //��������������������ǩ
      Width, Height : Integer);
    procedure CreatLiftBucketProCounterLab(LiftbucketNum : Integer; X,Y : Integer;   //��������������������
      Width, Height : Integer);

    procedure LoadAggregateBinImgFromFile(MidBinId : Integer; SourseImgDir : String;    //���������м��ͼƬ
      X,Y : Integer; Width, Height : Integer);
    procedure LoadAggregateBinFullImgFromFile(MidBinId : Integer; SourseImgDir : String;    //���������м������ʶͼƬ
      X,Y : Integer; Width, Height : Integer);
    procedure LoadAggrMidStorDschValveImg(MidBinId : Integer;                           //װ�ع����м��ж�Ϸ�
      SourseImgDir : String; X,Y : Integer);
    procedure DSpAggrMidHopperDschValveImgNewState(MidBinId : Integer;                  //��ʾ�����м��ж�Ϸ�ͼƬ ��״̬
      NewDschValueState : Integer);
    procedure LoadAggrMidStorOpenLmtImg(MidBinId : Integer; SourseImgDir : String;    //װ���м�ֿ�����λ
      X,Y : Integer );
    procedure LoadAggrMidStorCloseLmtImg(MidBinId : Integer; SourseImgDir : String;    //װ���м�ֹ�����λ
      X,Y : Integer );
    procedure DspAggrMidBinDschValvLmtImgNewState(MidBinId : Integer;      //�����м䶷ж�Ϸ� ��λ ͼƬ״̬
      DschValveLmtNm : Integer; LmtImgNewState : Integer);
    procedure LoadAggrMidStorVibraImg(MidBinId : Integer; SourseImgDir : String;    //װ���м������
      X,Y : Integer );
    procedure DspAggrMidBInDschVibraImgNewState(MidBinId : Integer;                 //���¹����м��ж������ͼƬ״̬
      NewVibraImgState : Integer);
    procedure LoadAggrMidBinDschTmrLab(MidBinId : Integer; X,Y : Integer);    //�����м��ж�ϼ�ʱ����ǩ
    procedure LoadMidBinLoadCounterLab(MidBinId : Integer; X,Y : Integer);    //�����м��װ���̴�

    procedure LoadAggrLiftBucketImg(BucketNum : Integer; SourseImgDir : String;    //����������ͼƬ
      X,Y : Integer );

    procedure CreateMixerImg(MixerID : Integer; SourseImgDir : String;    //���������ͼƬ
      X,Y : Integer; Width, Height : Integer);
    procedure DspMixerFlashNewState(MixerId : Integer; MewState : Integer);    //�������������
    procedure CreateMixerDschDoor(MixerId : Integer; SourseImgDir : String;    //���������ж����ͼƬ
      X,Y : Integer; Width, Height : Integer);
    procedure DspMixerDschValveImgNewState(MixerId : Integer; NewState : Integer);     //�����ж�Ϸ�ͼƬ״̬

    procedure DSpBtnMixerDschValveOPenNewState(MixerId : Integer; NewState : Integer);
    procedure DspBtnMixerDschValveCloseNewState(MixerId : Integer; NewState : Integer);
    procedure LoadMixerDschTmrLab(MixerId : Integer; X,Y : Integer);       //���ؽ����ж�ϼ�ʱ����ǩ
    procedure LoadMixerProdCounterLab(MixerId : Integer; X,Y : Integer);   //���ؽ����������������ǩ
    procedure CreatBellImg( X,Y : Integer; Width, Height : Integer);       //���ص���
    
//    procedure IniCheckerForControlPanel(CheckNm : String; X,Y : Integer;    //��ʼ����ѡ��
//      Width, Height : Integer; Check : Boolean);
    procedure UpdataBitBtnGlyph(BtnName : String; Check : Boolean);

    Function GetProdRecipeToSiloRecipe(TaskGrdRow : Integer) : Integer;    //��ȡ�ϲ��䷽ֵ
    procedure ProdStart(ProdRow : Integer) ;                               //��������
    procedure IniProdNoticeInfo(ProdNoticeInfoNumber : Integer);           //��ʼ�������ɳ�����Ϣ
    procedure IniWeigherLoadInfoForProdStart();                            //��������ʱ���Ǳ�������Ϣ��ʼ��
    procedure IniSiloLoadInfo();                                           //��ʼ��������Ϣ
    Function TaskBatchsProg(TaskGrdRow : Integer) : Integer;               //������̴���
    Function GetStorageLoadTargetForProdStart() : Integer;                 //��������ʱ,��ȡ�ϲֵ�����Ŀ��ֵ
    Function DspProdBatchInfoOnFrmMain(ProdNoticeId : Integer) : Integer;  //����������ʾ����������Ϣ
    Function DspStorageLoadTargetInFrmMainForProdStart() : Integer;        //������������ʾ�ϲ�����Ŀ��ֵ
    function GetWeigherLoadTargetForProdStart() : integer;                 //��ȡ�Ƶ�����Ŀ��ֵ
    function WriteWghrLoadTargetToInstruForProdStart() : Integer;          //д������Ŀ��ֵ���Ǳ�
    procedure WtStorageReplaceInfo();             //д�ϲ��滻��Ϣ���Ǳ�
    function WtProduceTbForProdStart() : Integer;
    function UpdateDbForProdEnd() : Integer;                                  //������ɣ��������ݿ�
    Function DelProdedNoticeFromDspTab( ProdNoticeId : Integer ) : Integer;    //���ɵ��б���ɾ����������ɵ��ɵ�
    procedure InitPermissonInFrmMain();                                        //������Ȩ�޳�ʼ��
  end;



var
  FrmMain: TFrmMain;
var
    MscommReceiveBufPfInFrmMain : Integer;    //������ͨѶ����ָ��

    MscommStateInFrmMain : Integer;    //������ͨѶ��ʱ��
Const
    CntMscommCmdIsInvalid = 0;    //��Ч
    CntMscommCmdIsCalZero = 1;    //ͨѶ������У��
    CntMscommCmdIsCalValue= 2;    //��ֵУ׼
var
    MscommTmrInFrmMain : Integer;    //������ͨѶ��ʱ��

var
    PMStorageId : Integer;        //�Ҽ��˵� �ϲֱ��

var
    StartProdMscomWaitRevPt : Integer;        //���������ȴ�ͨѶ���ջ�����ָ��
    StartProdSteps : Integer;
Const
    CtStartProdStepIsWtLdTarget       = 1;    //������������Ϊд����Ŀ��ֵ
    CtStartProdStepIsWtProdBatchCount = 2;    //������������Ϊд��������
    CtStartProdStepIsWtBatchAmount    = 3;    //������������Ϊд���̷���
    CtStartProdStepIsWtProdAmount     = 4;    //������������Ϊд���������Ǳ�
    CtStartProdStepIsWtStorageReplace = 5;    //д�ϲ��滻��Ϣ
    CtStartProdStepIsWtStartCmdI      = 6;    //д��������I
    CtStartProdStepIsWtStartCmdII     = 7;    //д��������II
    CtStartProdStepIsStartFstWtDb     = 8;    //���������״�д���ݿ�
var
    StartProdCmdLng : Integer;    //��������
    

implementation

uses UnitSplash, UntLogin,  UnitGlobeSub, UnitRWDb, UnitIniInstrument, UnitInicontrolPanel,
  UnitBasicSetting, UnitRecipe, UnitTask, UnitProceNotice,
  UnitWeigherAttribute, UnitRWInstrument1MscommBuf, UnitWeigDschRemain,
  UnitWeighCalValue, UnitPersonnelMangement, UnitSetPassWord,
  UnitStorageAttribute, UnitAggrConceyorHopperAttr, UnitMixerPara,
  UnitDeliveryPreview, UnitFrmCommunicationSet, UnitFrmSignalDefine,
  UnitSoftAuthorization, UnitSysUnlock, UnitLftHopper, UnitAbout,
  UnitConfig, UnitMaterialStorage, UnitModifyStocks, UnitStocks;

{$R *.dfm}

{����ͼƬ}    
procedure TBellImg.MSGEnter(var msg:TMessage);     //���������ͼƬ����Ӧ�������Ϣ
begin
    mouseEnterBellImg := true;    //���������ͼƬ
end;

procedure TBellImg.MSGLeave(var msg : TMessage);    //����뿪����ͼƬ����Ӧ�뿪����Ϣ
begin
    mouseEnterBellImg := false;
end;

{FrmMain}
procedure TFrmMain.CreateParams(var Params: TCreateParams);
begin
    inherited;
    Params.ExStyle := 33554432; //0x 02 00 00 00
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
var
    i : Integer;
begin
    for i:=1 to WeigherCount do
    begin
        if WeigherInfo[i].Enable then WeigherImg[i].Free;
    end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
    SysInfoBuf : Pchar;
    GPrevShortDate,
    GPrevLongDate,
    GPrevTimeFormat : String;
    MessageText : String;
    p : Dword;

    SetFile : TIniFile;
    DbDirtoryStr : String;
    InstructionCommPort : Integer;

    i : integer ;

    SoftAutorizationInfoRlt : Integer;
    SoftAutorizationInfo    : String;
    AuthorRemainDays        : Double;
Const
    CntSysInfoBufSize = 100;

begin

    AppPath := ExtractFilePath(Application.ExeName);
    AppFlashTmrInval := StatusDspTmr.Interval;

    SystemTmr.Interval := CntSystemTmrInterval ;
    SystemTmr.Enabled := True ;

    FrmSplash.LbIniInfo.Caption := '���ϵͳ����ʱ���ʽ';
    getmem(SysInfoBuf, CntSysInfoBufSize);
    GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SSHORTDATE, SysInfoBuf, CntSysInfoBufSize);    //ȡ�û����ã������ڸ�ʽ
    GPrevShortDate := string(SysInfoBuf);

    //GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SLONGDATE, SysInfoBuf, CntSysInfoBufSize);
    //GPRevLongDate := string(SysInfoBuf);

    GetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_STIMEFORMAT, SysInfoBuf, CntSysInfoBufSize);    //ʱ���ʽ
    GPrevTimeFormat := string(SysInfoBuf);

    if ( GPrevShortDate <> 'yyyy-MM-dd') or ( GPrevTimeFormat <> 'HH:mm:ss') then
    begin
        MessageText := '�����ϵͳ����ʱ���ʽ�����Ҫ�󲻷��Ƿ�';
        MessageText := MessageText + #10;
        MessageText := MessageText + '��ǰϵͳ���ڸ�ʽ��' + '''' + GPrevShortDate + '''' + '����Ϊ��' + '''' + 'yyyy-MM-dd' + '''';
        MessageText := MessageText + #10;
        MessageText := MessageText + 'ʱ���ʽ��' + '''' + GPrevTimeFormat + ''''  + '��Ϊ��' + '''' + 'HH:mm:s' + '''' ;
        if messagebox(getfocus, Pchar(MessageText), '��ʾ��Ϣ', MB_YESNOCANCEL ) = IDYES then
        begin
            SetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SSHORTDATE, pchar('yyyy-MM-dd') ) ;   //���ö����ڸ�ʽ
            //SetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_SLONGDATE,pchar('yyyy''��''M''�� ''d''��'''));
            SetLocaleInfo(LOCALE_USER_DEFAULT,LOCALE_STIMEFORMAT,pchar('HH:mm:ss')); //����ʱ��
            SendMessageTimeOut(HWND_BROADCAST,WM_SETTINGCHANGE,0,0,SMTO_ABORTIFHUNG,10,p);
        end;
    end;

    FreeMem(SysInfoBuf);

    FrmSplash.LbIniInfo.Caption := '������������';
    //FrmSplash.Update;
    SetFile := TInifile.Create(ExtractFilePath(Application.ExeName) + 'set.ini');
    {�������ݿ�}
    DbDirtoryStr := SetFile.ReadString('DB', 'Dirtory', '') ;
    if DbDirtoryStr = '' then
    begin
        if messagebox(getfocus,pchar('ϵͳδָ�����ݴ洢Ŀ¼��ϵͳʹ��Ĭ��Ŀ¼'), '��ʾ��Ϣ', MB_OK) = idOK then
        begin
            DbDirtoryStr := ExtractFilePath(Application.ExeName) + '\TSCDB\tscdb.mdb';
        end;
    end;

    if not fileexists (DbDirtoryStr)then
    begin
       ShowMessage('���ݿ��ļ������ڻ����ݿ�������ȷ');
       application.Terminate;
       exit;
    end;

    try
        ADOConnection.Connected := False;
        ADOConnection.ConnectionString :=
                  'Provider=Microsoft.Jet.OLEDB.4.0;'+
                  //'Provider=Microsoft.ACE.OLEDB.12.0;' +
                  'Data Source='+ DbDirtoryStr + ';' +
                  'Persist Security Info=False;' +
                  'Jet OLEDB:Database Password=TSC2016' ;
        ADOConnection.Connected := True;
    except
        Showmessage('�������ݿ�ʧ��!');
    end;

    ADOQuery1.Connection := ADOConnection ;
    QryErp.Connection    := ADOConnection ;
    ADOSubErp.Connection    := ADOConnection ;
    
    FrmSplash.LbIniInfo.Caption := '�������ݿ�ɹ�...' ;
    FrmSplash.RzProgressBar1.Percent := 1;

    GetSoftAuthorizationIOnfo( SoftAutorizationInfoRlt, SoftAutorizationInfo );
    case SoftAutorizationInfoRlt of
        0: begin
            if GetAuthorizedRemainingDays(EndRunDate, AuthorRemainDays, SoftAutorizationInfo) = 0 then
            begin
                if AuthorRemainDays <= 3 then
                    Showmessage('�����Ȩʣ�� ' + Format('%.1f' , [AuthorRemainDays]) + ' ��');
            end
            else
            begin
                Showmessage('��ȡ�����Ȩ��ʽʧ�ܣ� ' + SoftAutorizationInfo );
            end;
        end;
        else
        begin
            Showmessage( '��ȡ�����Ȩʧ�ܣ�����������Ƿ���������ϵ���Ĺ�Ӧ�̣�������Ϣ��'+ SoftAutorizationInfo );
            Application.Terminate;
            exit;
        end;
    end;    //}

    {�˺ŵ�½}
    FrmSplash.LbIniInfo.Caption := '�û���½...' ;

    FrmLogin := TFrmLogin.Create(Nil);
    if (FrmLogin.ShowModal <> mrok)  then
    begin
        Application.Terminate;
        exit;
    end;

    FrmSplash.RzProgressBar1.Percent := 2;

    {��ʼ���ڴ�}
    FrmSplash.LbIniInfo.Caption := '���������Ķ�ȡϵͳ����...' ;



    ReadMixerDischModeFromDb();           //�����ݿ��ж�ȡ�����ж��ģʽ

    ReadEquipmentFlagFromDb();           //�����ݿ��ж�ȡ�豸����
    ReadStorageFromDb();                 //�����ݿ��ж�ȡ�ϲ�����

    IniControlPanelInfo();

    SoftRunState := CntSoftIniInstrumentState;    //��ʼ��������״̬

    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent +1;

    {����ͨѶ}
    FrmSplash.LbIniInfo.Caption := '����ͨѶ...';

    //��ʼ��ѭ��ͨѶ�������
    IniInstrumentMscomLoopComand();  //��ʼ��ͨѶѭ������

    InstructionCommPort := SetFile.ReadInteger('SerialCommunication', 'Instruction1', 1);

    sStatusBar1.Panels[1].Text := '�˿ںţ�' + inttostr(InstructionCommPort) ;
    sStatusBar1.Panels[2].Text := '����';
    Instru1MscommDspState := Instru1MscomDspIsNomarl ;

    try
        if Instruction1MSComm.PortOpen then
        begin
            Instruction1MscommOpen := False ;
            Showmessage('ͨѶ�˿�ͨѶ�˿��ѱ�ռ�ã�ͨѶʧ��!');
            //Application.Terminate;
        end
        else
        begin
            Instruction1MSComm.CommPort := InstructionCommPort ;   //���˿ں�
            Instruction1MSComm.Settings := '19200,n,8,1';
            Instruction1MSComm.InBufferSize := 1024;    //���ý��ջ�������С
            Instruction1MSComm.OutBufferSize := 1024;    //���÷��ͻ�������С
            Instruction1MSComm.InputLen := 0;            //һ�ζ�ȡ���ջ������е���������
            Instruction1MSComm.SThreshold := 0;          //һ�η�����������
            Instruction1MSComm.InBufferCount := 0;       //��ս��ջ�����
            Instruction1MSComm.OutBufferCount := 0;      //��շ��ͻ�����
            Instruction1MSComm.PortOpen := True;
            Instruction1MscommOpen := True;
        end;
    except
        Instruction1MscommOpen := False;

        Instru1MscommDspState := Instru1MscomDspIsPortNo ;           //�˿ڲ�����
        sStatusBar1.Panels[2].Text := '��ʧ��';

        Showmessage('ͨѶ�˿ڴ�ʧ��!');
        //Application.Terminate;
    end;
    
    FrmSplash.LbIniInfo.Caption := 'ͨѶ�˿ڴ򿪳ɹ�...'  ;
    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;

    FrmSplash.LbIniInfo.Caption := '���ӿ�����...' ;

    {��ʼ��������ͨѶ������}
    for i := 0 to CntCommunicateBufLen -1 do
    begin
        Instruction1SendBuf[i].Active := False;
        Instruction1ReceiveBuf[i].Active := False;
    end;
    Instruction1SendBufWtPt := 0 ;
    Instruction1SendBufRdPt := 0 ;
    Instruction1ReceivePt := 0 ;

    Instruction1MscommState := CntInstruction1MscommIdle;

    Instruction1MscommTmr.Enabled := True;

    {��ʼ��������}
    Instruction1Init();

    SoftRunState := CntSoftRuningState;

    setFile.Free;

    {������Ȩ�޳�ʼ��}
    InitPermissonInFrmMain();
end;

procedure TFrmMain.InitPermissonInFrmMain();
begin
    //��Ա����
    if pos(CntPermissonCode[CntPermIsPersonMang], PersonnelPermit) >=1 then
        NPerssonMangement.Enabled := True
    else
        NPerssonMangement.Enabled := False;

    //��ȹ���
    if pos( '[' + CntPermissonCode[CntPermIsRecipe], PersonnelPermit) >=1 then
        NRecipe.Enabled := True
    else
        NRecipe.Enabled := false;

    //��������
    if pos('[' + CntPermissonCode[CntPermIsProdTask], PersonnelPermit) >= 1 then
        NProdTask.Enabled := True
    else
        NProdTask.Enabled := False;

    //ͨѶ����
    if pos('[' + CntPermissonCode[CntCommunicate], PersonnelPermit) >= 1 then
        NCommunicate.Enabled := True
    else
        NCommunicate.Enabled := False;
        
    //�豸����
    if pos('[' + CntPermissonCode[CntSysConfig], PersonnelPermit) >= 1 then
        NSysConfig.Enabled := True
    else
        NSysConfig.Enabled := False;

    //�źŶ���
    if pos('[' + CntPermissonCode[CntSignalDefine], PersonnelPermit) >= 1 then
        NSingleDefine.Enabled := True
    else
        NSingleDefine.Enabled := False;

    //ԭ�Ϲ���
    if pos('[' + CntPermissonCode[CntPermIsMaterialStock], PersonnelPermit) >= 1 then     //ԭ�Ͽ��
        NMaterialStocks.Enabled := True
    else
        NMaterialStocks.Enabled := False;
        
    //��������
    if pos('[' + CntPermissonCode[CntPermIsProdData], PersonnelPermit) >= 1 then          //�������ݲ�ѯ
        NProdData.Enabled := True
    else
        NProdData.Enabled := False;

    //��У��
    if pos('[' + CntPermissonCode[CntPermIsWeigCalZero] + 'e]', PersonnelPermit) >= 1 then
        NWeigherCalZero.Enabled := True
    else
        NWeigherCalZero.Enabled := false;

    //��У׼
    if pos('[' + CntPermissonCode[CntPermIsWeigCalValue] + 'e]', PersonnelPermit) >= 1 then
        NWeigherCal.Enabled := True
    else
        NWeigherCal.Enabled := False;

    //��������
    if pos('[' + CntPermissonCode[CntPermIsPara], PersonnelPermit) >= 1 then
    begin
        NWeigherParaSet.Enabled := True;
        RMStorageSet.Enabled    := True;
        NMidBinPara.Enabled     := True;
        SMMixerPara.Enabled     := True;
    end
    else
    begin
        NWeigherParaSet.Enabled := False;
        RMStorageSet.Enabled    := False;
        NMidBinPara.Enabled     := False;
        SMMixerPara.Enabled     := False;
    end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin

    IniAdvStrGdProRd();
    IniAdvStrGdProdNotice();

    IniProdNoticeTb();            //��ʼ�������ɳ�����Ϣ��

    FrmSplash.Close ;

    DspSoftAuthorInfo();    //��ʾ�����Ȩ

    StatusDspTmr.Enabled := True;
end;

procedure TFrmMain.IniAdvStrGdProRd();
begin
    AdvStrGdProRd.Cells[1, 0] := 'ԭ����';
    AdvStrGdProRd.Cells[2, 0] := '�䷽ֵ(kg)';
    AdvStrGdProRd.Cells[3, 0] := '�趨ֵ(kg)';
    AdvStrGdProRd.Cells[4, 0] := '���ֵ(kg)';
    AdvStrGdProRd.Cells[5, 0] := '���(%)';
    AdvStrGdProRd.Cells[6, 0] := '�ֺ�';
    AdvStrGdProRd.Cells[7, 0] := '״̬';    //0����ʾδ�������  10��ʾ�������
    AdvStrGdProRd.Cells[8, 0] := '�̺�';

    AdvStrGdProRd.ColWidths[6] := 0;
    AdvStrGdProRd.ColWidths[7] := 0;
    //AdvStrGdProRd.ColWidths[8] := 0;
end;

procedure TFrmMain.IniAdvStrGdProdNotice();
begin
    AdvStrGdProdNotice.cells[0, 0] := 'ID';
    AdvStrGdProdNotice.ColWidths[0] := 1;
    AdvStrGdProdNotice.cells[2, 0] := '��ˮ��';
    AdvStrGdProdNotice.cells[3, 0] := '���񵥱��';
    AdvStrGdProdNotice.cells[4, 0] := '�������';
    AdvStrGdProdNotice.cells[5, 0] := '���ͳ���';
    AdvStrGdProdNotice.cells[6, 0] := '����';
    AdvStrGdProdNotice.cells[7, 0] := '������Ϣ';    //�ͻ�����  ��������  ������λ
    AdvStrGdProdNotice.cells[8, 0] := '����Ҫ��';    //ǿ�ȵȼ�  ̮���  �����ȼ�  ����Ҫ��

    DspProdNoticeFromDb();
end;

procedure TFrmMain.IniProdNoticeTb();            //��ʼ�������ɳ�����Ϣ��
begin
    sCmbBxTruckCodeInNoticeInfo.Text := '';
    sCmbBxTruckCodeInNoticeInfo.Items.Clear;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select distinct(Code) as TruckCode from Truck';
    ADOQuery1.Open;
    while not ADOQuery1.Eof do
    begin
        sCmbBxTruckCodeInNoticeInfo.Items.Add(ADOQuery1.FieldByName('TruckCode').AsString);
        ADOQuery1.Next;
    end;
end;

procedure TFrmMain.DspSoftAuthorInfo();    //��ʾ�����Ȩ
var
    IniFile          : TInifile;
    AuthorRemainDays : Double;
    HaspKeyErrInfo   : String;
    RequstCode       : String;
    Mobile           : String;
begin
    //��ȡ��ȡʣ������
    if GetAuthorizedRemainingDays(EndRunDate, AuthorRemainDays, HaspKeyErrInfo) = 0 then
    begin
        if AuthorRemainDays <= 3 then
        begin
            Panel2.Visible := True;
            IniFile := TInifile.Create(ExtractFilePath(Application.ExeName) + 'set.ini');
            RequstCode := IniFile.ReadString('Application', 'Code', '') ;
            if RequstCode = '' then
            begin
                randomize;
                IniFile.WriteString ( 'Application', 'Code', format('%.4d', [random(9999)]) );
                RequstCode := IniFile.ReadString('Application', 'Code', '') ;
            end;
            Mobile := IniFile.ReadString('Equip', 'Mobile', '') ;
            IniFile.Free;
        end;

        if AuthorRemainDays > 0 then
        begin
            Lb1SoftAuthor.Caption := '�����Ȩʣ�� ' + Format('%.1f', [AuthorRemainDays]) + ' �졣��༭��Ϣ��';
            Lb2SoftAuthor.Caption := '"����01����ţ�' + HaspKeyId + ',������' + RequstCode + '"';
            Lb3SoftAuthor.Caption := '�������豸��Ӧ�̣��ֻ��ţ�' + Mobile;
        end
        else
        begin
            Lb1SoftAuthor.Caption := '�����Ȩ�ѵ���,����������������༭��Ϣ��';
            Lb2SoftAuthor.Caption := '"����01����ţ�' + HaspKeyId + ',������' + RequstCode + '"';
            Lb3SoftAuthor.Caption := '�������豸��Ӧ�̣��ֻ��ţ�' + Mobile;
        end;
    end
    else
    begin
        Showmessage('��ȡ��ǰʱ��ʧ�ܣ�ϵͳ������������������������������Ƿ������� ' + HaspKeyErrInfo);
    end;
end;

procedure TFrmMain.AdvStrGdProdNoticeGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    if ARow = 0 then HAlign := taCenter;
end;

procedure TFrmMain.IniLoadWeigherImg(WeigherId : Integer; X,Y,W,H : Integer);
begin

    //����ͼƬ
    WeigherImg[WeigherId] := TImage.Create(FrmMain);
    WeigherImg[WeigherId].Parent := FrmMain;
    WeigherImg[WeigherId].Tag := WeigherId;
    WeigherImg[WeigherId].PopupMenu := PMWeigher;
    WeigherImg[WeigherId].OnContextPopup := WeigherContextPopup;

    WeigherImg[WeigherId].Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Images\Equips\Instruments\Weigher.png');

    WeigherImg[WeigherId].Left := X;
    WeigherImg[WeigherId].Top := Y;
    WeigherImg[WeigherId].Width := W;
    WeigherImg[WeigherId].Height := H;

    WeigherImg[WeigherId].Cursor := crDrag;

end;

procedure TFrmMain.LoadWeigherDischValveImg(WeigherId : Integer; X,Y : Integer);
begin
    WeigherDischValveImg[WeigherId] := TImage.Create(FrmMain);
    WeigherDischValveImg[WeigherId].Parent := FrmMain;
    WeigherDischValveImg[WeigherId].Tag := WeigherId;
    WeigherDischValveImg[WeigherId].Name := 'WeigDischValveImg' + intToStr(WeigherId);
    WeigherDischValveImg[WeigherId].Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Images\Equips\Instruments\WeigDischValveClose.png');
    WeigherDischValveImg[WeigherId].AutoSize := True;
    WeigherDischValveImg[WeigherId].Left := X;
    WeigherDischValveImg[WeigherId].Top := Y;

    WeigherDischValveImg[WeigherId].OnMouseDown := WghrDschValveImgMouseDn;
    WeigherDischValveImg[WeigherId].OnMouseUp   := WghrDschValveImgMouseUp;
end;

procedure TFrmMain.WghrDschValveImgMouseDn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img : TImage;
    InstruId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    InstruId := Img.Tag;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + InstruId -1, $0009 );
end;

procedure TFrmMain.WghrDschValveImgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img : TImage;
    InstruId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    InstruId := Img.Tag;
    showmessage(inttostr(InstruId));
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + InstruId -1, $000A );
end;

procedure TFrmMain.DspWeigherDschValveState(WeigherId : Integer; NewState : Integer);
begin
    case NewState of

        CntWeigDischValveIsClose   :    //ж�Ϸ��ر�״̬
        begin
            WeigherDischValveImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveClose.png');
            WeigherDischValveImgState[WeigherId] := CntWeigDischValveIsClose;
        end;

        CntWeigDischValveIsOPen    :    //ж�Ϸ���״̬
        begin
            WeigherDischValveImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveOPen.png');
            WeigherDischValveImgState[WeigherId] := CntWeigDischValveIsOPen;
        end;

        else
        begin
            WeigherDischValveImgState[WeigherId] := CntWeigDischValveIsInvalid;
        end;
    end;
end;

procedure TFrmMain.LoadWeigherDischVibratorImg(WeigherId : Integer; X,Y : Integer);
begin
    WeigherDischVibraImg[WeigherId] := TImage.Create(FrmMain);
    WeigherDischVibraImg[WeigherId].Parent := FrmMain;
    WeigherDischVibraImg[WeigherId].Tag := WeigherId;
    WeigherDischVibraImg[WeigherId].Name := 'WeigDischVibraImg' + intToStr(WeigherId);
    WeigherDischVibraImg[WeigherId].Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Images\Equips\Instruments\WeigVibratorClose.png');
    WeigherDischVibraImg[WeigherId].AutoSize := True;
    WeigherDischVibraImg[WeigherId].Left := X;
    WeigherDischVibraImg[WeigherId].Top := Y;
    WeigherDischVibraImg[WeigherId].Cursor := crHandPoint;
    WeigherDischVibraImg[WeigherId].OnClick := WeigherDschVibraImgClick ;
end;

procedure TFrmMain.WeigherDschVibraImgClick(Sender: TObject);
var
    Img : TImage;
    WghrId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    WghrId := Img.Tag ;

    if ( WeigherStateInInstru[WghrId] and $0020 ) <> 0 then    //��λ���� ж�Ϸ�״̬ Ϊ ��
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + WghrId -1, $0014 );    //�رճ�ж������
    end
    else
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + WghrId -1, $0013 );    //�򿪳�ж������
    end; 
end;

procedure TFrmMain.DspWghrDschVibraState(WeigherId : Integer; NewState : Integer );
begin
    case NewState of
        CntVibraImgStaIsClose   :    //���� ͼƬ ��   ״̬
        begin
            WeigherDischVibraImg[WeigherId].Picture.LoadFromFile( AppPath + '\Images\Equips\Instruments\WeigVibratorClose.png' );
            WeigherDischVibraImgState[WeigherId] := CntVibraImgStaIsClose;      //��ж������ͼƬ״̬ Ϊ ��
        end;
        
        CntVibraImgStaIsOpen    :    //���� ͼƬ ��   ״̬
        begin
            WeigherDischVibraImg[WeigherId].Picture.LoadFromFile( AppPath + '\Images\Equips\Instruments\WeigVibratorOpen.png' );
            WeigherDischVibraImgState[WeigherId] := CntVibraImgStaIsOpen ;      //��ж������ͼƬ״̬ Ϊ ��
        end;

        else
        begin
            WeigherDischVibraImgState[WeigherId] := CntVibraImgStaIsInvalid;
        end;
    end;
end;

procedure TFrmMain.LoadWeigherDischValveCloseLmtImg(WeigherId : Integer;
  X,Y : Integer);
begin 
    WeigherDischValveCloseLmtImg[WeigherId] := TImage.Create(FrmMain);
    WeigherDischValveCloseLmtImg[WeigherId].Parent := FrmMain;
    WeigherDischValveCloseLmtImg[WeigherId].Tag := WeigherId;
    WeigherDischValveCloseLmtImg[WeigherId].Name := 'WeigDischValveClsLmtImg' + intToStr(WeigherId);
    WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Images\Equips\Instruments\WeigDischValveLmtInValid.png');
    WeigherDischValveCloseLmtImg[WeigherId].AutoSize := True;
    WeigherDischValveCloseLmtImg[WeigherId].Left := X;
    WeigherDischValveCloseLmtImg[WeigherId].Top := Y;
end;

procedure TFrmMain.DspWghrDschValveCloseLmtImg(WeigherId : Integer; NewState : Integer);    //���³ƹ���ͼƬ״̬
begin
    Case NewState of
        CntWghrDschValveClsLmtImgIsInvalid      :    //��ж�Ϸ�����ͼƬ ��Ч     ״̬
        begin
            WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveLmtInValid.gif' );
            WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsInvalid;
        end;

        CntWghrDschValveClsLmtImgIsValid        :    //��ж�Ϸ�����ͼƬ ��Ч     ״̬
        begin
            WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveLmtValid.gif' );
            WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsValid;
        end;

        CntWghrDschValveClsLmtImgIsValidFlash   :    //��ж�Ϸ�����ͼƬ ��Ч��˸ ״̬
        begin
            WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveLmtValidFlash.gif' );
            WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsValidFlash;
        end;

        CntWghrDschValveClsLmtImgIsInvalidFlash :    //��ж�Ϸ�����ͼƬ ��Ч��˸ ״̬
        begin
            WeigherDischValveCloseLmtImg[WeigherId].Picture.LoadFromFile(AppPath + '\Images\Equips\Instruments\WeigDischValveLmtInValidFlash.gif' );
            WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsInvalidFlash;
        end;
    end;
end;

procedure TFrmMain.LoadWeigherValueLabel(WeigherId : Integer; X,Y,W,H : Integer);    //��ж�Ϸ�ͼƬ
begin
    WeigherValueLab[WeigherId]             := TLabel.Create(FrmMain);
    WeigherValueLab[WeigherId].Parent      := FrmMain;
    WeigherValueLab[WeigherId].Tag         := WeigherId;
    WeigherValueLab[WeigherId].Name        := 'WeigValueLab' + inttostr(WeigherId);
    WeigherValueLab[WeigherId].Alignment   := taCenter;
    WeigherValueLab[WeigherId].AutoSize    := False;
    WeigherValueLab[WeigherId].Left        := X;
    WeigherValueLab[WeigherId].Top         := Y;
    WeigherValueLab[WeigherId].Width       := W;
    WeigherValueLab[WeigherId].Height      := H;
    WeigherValueLab[WeigherId].Transparent := True;
    WeigherValueLab[WeigherId].Caption     := '0';
end;

procedure TFrmMain.WeigherContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
    Img : Timage;
begin
    Img := TImage(Sender);
    PMWeigherId := Img.Tag;
end;

procedure TFrmMain.LoadStorageImgFromFile( ImageNo : Integer; SourseImgDir : String ;
  X,Y : Integer; Width, Height : Integer);
begin
    StorageImg[ImageNo] := TImage.Create(FrmMain);
    StorageImg[ImageNo].Parent := FrmMain;
    StorageImg[ImageNo].Tag := ImageNo;
    StorageImg[ImageNo].OnContextPopup := StorageContexPopup;
    StorageImg[ImageNo].PopupMenu := PMStorage ;
    StorageImg[ImageNo].Picture.LoadFromFile(SourseImgDir);
    StorageImg[ImageNo].Left := x;
    StorageImg[ImageNo].Top := y;
    StorageImg[ImageNo].Width := Width;
    StorageImg[ImageNo].Height := Height; //}
end;

procedure TFrmMain.LoadStorageDischImg(StorageId : Integer; LoadImgType : Integer;
  SourseImgDir : String; X,Y : Integer; Width, Height : Integer);
begin
    case LoadImgType of
        CntAggregateLoadImg ,    //���ϼ�����ͼƬ
        CntPowderLoadImg    ,    //���ϲּ�����ͼƬ
        CntLiqLoadImg       :    //Һ�ּ�����ͼƬ
        begin
            StorageLoadImg[StorageId] := TImage.Create(FrmMain);
            StorageLoadImg[StorageId].Parent := FrmMain;
            StorageLoadImg[StorageId].Name  := 'ImgLoad' + inttostr(StorageId);    //StorageId #�ϲּ�����
            StorageLoadImg[StorageId].Transparent := True;
            StorageLoadImg[StorageId].Picture.LoadFromFile(SourseImgDir);
            StorageLoadImg[StorageId].Left := x;
            StorageLoadImg[StorageId].Top := y;
            StorageLoadImg[StorageId].AutoSize := True;
            StorageLoadImg[StorageId].Tag := StorageId;
            //StorageLoadImg[StorageId].Width := Width;
            //StorageLoadImg[StorageId].Height := Height;
            StorageLoadImg[StorageId].OnMouseDown := LoadImgMouseDn ;
            StorageLoadImg[StorageId].OnMouseUp   := LoadImgMouseUp ;
        end;
        CntAggregateFineImg ,    //���Ͼ�������ͼƬ
        CntPowderFineImg    ,    //���ϲ־�������ͼƬ
        CntLiqFineImg       :    //Һ�־�������ͼƬ
        begin
            StorageFineLoadImg[StorageId] := TImage.Create(FrmMain);
            StorageFineLoadImg[StorageId].Parent := FrmMain;
            StorageFineLoadImg[StorageId].Name := 'ImgFineLoad' + inttostr(StorageId);    //StorageId #�ϲ־�������
            StorageFineLoadImg[StorageId].Transparent := True;
            StorageFineLoadImg[StorageId].Picture.LoadFromFile(SourseImgDir);
            StorageFineLoadImg[StorageId].Left := x;
            StorageFineLoadImg[StorageId].Top := y;
            StorageFineLoadImg[StorageId].AutoSize := True;
            StorageFineLoadImg[StorageId].Tag := StorageId;
            //StorageFineLoadImg[StorageId].Width := Width;
            //StorageFineLoadImg[StorageId].Height := Height;
            StorageFineLoadImg[StorageId].OnMouseDown := LoadImgMouseDn ;
            StorageFineLoadImg[StorageId].OnMouseUp   := LoadImgMouseUp ;
        end;

        CntAggregateCoLoadImg ,    //���ϴּ�����ͼƬ
        CntPowderCoLoadImg    ,    //���ϴּ���
        CntLiqCoLoadImg       :    //Һ��ִּ�����ͼƬ
        begin
            StorageLoadImg[StorageId] := TImage.Create(FrmMain);
            StorageLoadImg[StorageId].Parent := FrmMain;
            StorageLoadImg[StorageId].Name  := 'ImgLoad' + inttostr(StorageId);    //StorageId #�ϲּ�����
            StorageLoadImg[StorageId].Transparent := True;
            StorageLoadImg[StorageId].Picture.LoadFromFile(SourseImgDir);
            StorageLoadImg[StorageId].Left := x;
            StorageLoadImg[StorageId].Top := y;
            StorageLoadImg[StorageId].AutoSize := True;
            StorageLoadImg[StorageId].Tag := StorageId;
            StorageLoadImg[StorageId].OnMouseDown := CoarseLoadMouseDn;    //������ͼƬ��갴��
            StorageLoadImg[StorageId].OnMouseUp   := CoarseLoadMouseUp     //������ͼƬ���̧��
        end;
    end;
end;

procedure TFrmMain.CoarseLoadMouseDn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img    : TImage;
    SiloId : Integer;
    WtAddr,
    WtData : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SiloId := Img.Tag;
    WtAddr := $0210 + StorageInfo[SiloId].InstrumentId -1;
    WtData := $0021 + StorageInfo[SiloId].LoadNo -1;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, WtAddr, WtData );                //дһ���ֵ�ͨѶ������
end;

procedure TFrmMain.CoarseLoadMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img    : TImage;
    SiloId : Integer;
    WtAddr,
    WtData : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SiloId := Img.Tag;
    WtAddr := $0210 + StorageInfo[SiloId].InstrumentId -1;
    WtData := $0025 + StorageInfo[SiloId].LoadNo -1;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, WtAddr, WtData );                //дһ���ֵ�ͨѶ������
end;

procedure TFrmMain.LoadImgMouseDn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img    : TImage;
    SiloId : Integer;
    WtAddr,
    WtData : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SiloId := Img.Tag;
    WtAddr := $0210 + StorageInfo[SiloId].InstrumentId -1;
    WtData := $0001 + StorageInfo[SiloId].LoadNo -1;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, WtAddr, WtData );                //дһ���ֵ�ͨѶ������
end;

procedure TFrmMain.LoadImgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Img    : TImage;
    SiloId : Integer;
    WtAddr,
    WtData : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SiloId := Img.Tag;
    WtAddr := $0210 + StorageInfo[SiloId].InstrumentId -1;
    WtData := $0005 + StorageInfo[SiloId].LoadNo -1;
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, WtAddr, WtData );                //дһ���ֵ�ͨѶ������
end;

procedure TFrmMain.DSpSiloVibraImgState(DspSiloId : Integer; VibraNewState : Integer);    //��������ͼƬ״̬
begin
    case VibraNewState of
        CntVibraImgStaIsClose   :    //���� ͼƬ ��   ״̬
        begin
            StorageVibratorImg[DspSiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\StorVibratorClose.png');    //�ϲ����� ͼƬ״̬ Ϊ ��
            StorageVibratorImgState[DspSiloId] := CntVibraImgStaIsClose ;
        end;

        CntVibraImgStaIsOpen    :    //���� ͼƬ ��   ״̬
        begin
            StorageVibratorImg[DspSiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\StorVibratorOpen.png');     //�ϲ������� ͼƬ״̬ Ϊ ��
            StorageVibratorImgState[DspSiloId] := CntVibraImgStaIsOpen;
        end;

        else
        begin
            StorageVibratorImgState[DspSiloId] := CntVibraImgStaIsInvalid ;
        end;
        
    end;
end;

procedure TFrmMain.DspSiloLOadVaveState(SiloId : Integer; SiloLoadVaveImgCode : Integer;
  DigitalState : Integer ) ;
var
    SourseImgDir : String;
begin
    if SiloLoadVaveImgCode = CntSiloLdValveImgIsLd then   //�ϲּ�����ͼƬ���� �� ������   ͼƬ
    begin
        case StorageInfo[SiloId].Model of
            CntAggregateStorage :    //���ϲ�
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //������״̬�ǹ�
                    begin
                        SourseImgDir := AppPath + '\Images\Equips\Storages\AggregateStorageLdClo.bmp';
                        StorageLoadImg[SiloId].Picture.LoadFromFile(SourseImgDir);
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsClose;
                    end;
                    CntLoadImgStateIsOpen  :     //������״̬�ǿ�
                    begin
                        SourseImgDir := AppPath + '\Images\Equips\Storages\AggregateStorageLdOp.bmp';
                        StorageLoadImg[SiloId].Picture.LoadFromFile(SourseImgDir);
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsOpen;
                    end;
                    else
                    begin
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                 end;
            end;

            CntPowderStorage :       //���ϲ�
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //������״̬�ǹ�
                    begin
                        StorageLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\PowStorLdClose.bmp') ;    //���ϲ֣��֣���������
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //������״̬�ǿ�
                    begin
                        StorageLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\PowStorLdOpen.bmp') ;    //���ϲ�(��)��������
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsOpen;
                    end;

                    else
                    begin
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                end;
            end;

            //CntLiquidStorage19dian :       //Һ���
            CntWaterStorage   ,      //ˮ��
            CntAddtiveStorage :      //�����
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //������״̬�ǹ�
                    begin
                        StorageLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\LiqStorLdClose.bmp' );    //װ�� Һ����(��)������ Ϊ �� ״̬
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //������״̬�ǿ�
                    begin
                        StorageLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\LiqStorLdOpen.bmp' );    //װ�� Һ����(��)������ Ϊ ��״̬
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsOpen ;
                    end;
                    else
                    begin
                        StorageLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                end;
            end;
        end;
    end
    else                                              //�ϲּ�����ͼƬ���� �� �������� ͼƬ
    begin
        case StorageInfo[SiloId].Model of
            CntAggregateStorage :    //���ϲ�
            begin

                case DigitalState of
                    CntLoadImgStateIsClose :     //������״̬�ǹ�
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\AggregateStorageLdClo.bmp');
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //������״̬�ǿ�
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\AggregateStorageFnLdOp.bmp');
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsOpen ;
                    end;

                    else
                    begin
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsInvalid ;
                    end;
                end;
            end;

            CntPowderStorage :       //���ϲ�
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //������״̬�ǹ�
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\PowStorLdClose.bmp');    //���ϲ־���������
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //������״̬�ǿ�
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\PowStorFnLdOpen.bmp' );    //���ϲ־���������
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsOpen ;
                    end;

                    else
                    begin
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                end;
            end;

            //CntLiquidStorage :       //Һ���
            CntWaterStorage   ,      //ˮ��
            CntAddtiveStorage :      //�����
            begin
                case DigitalState of
                    CntLoadImgStateIsClose :     //������״̬�ǹ�
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\LiqStorLdClose.bmp');    //װ�� Һ��� ��������״̬Ϊ ��
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsClose ;
                    end;

                    CntLoadImgStateIsOpen  :     //������״̬�ǿ�
                    begin
                        StorageFineLoadImg[SiloId].Picture.LoadFromFile(AppPath + '\Images\Equips\Storages\LiqStorFnLdOpen.bmp');    //װ�� Һ��� ��������״̬Ϊ ��
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsOpen ;
                    end;

                    else
                    begin
                        StorageFineLoadImgState[SiloId] := CntLoadImgStateIsInvalid;
                    end;
                end;
            end;
        end;
    end;
    
end;

procedure TFrmMain.LoadStorageVibrator(StorageId : Integer;
  SourseImgDir : String; X,Y : Integer; Width, Height : Integer);
begin
    StorageVibratorImg[StorageId] := TImage.Create(FrmMain);
    StorageVibratorImg[StorageId].Parent := FrmMain;
    StorageVibratorImg[StorageId].Name  := 'ImgLoadVibrator' + inttostr(StorageId);    //StorageId #�ϲּ�������
    StorageVibratorImg[StorageId].Transparent := True;
    StorageVibratorImg[StorageId].Picture.LoadFromFile(SourseImgDir);
    StorageVibratorImg[StorageId].Left := x;
    StorageVibratorImg[StorageId].Top := y;
    StorageVibratorImg[StorageId].AutoSize := True;
    StorageVibratorImg[StorageId].Tag := StorageId;
    StorageVibratorImg[StorageId].Cursor := crHandPoint;
    StorageVibratorImg[StorageId].OnClick := SiloLdVibraClick;
end;

procedure TFrmMain.SiloLdVibraClick(Sender: TObject);
var
    Img : TImage;
    SelSiloId : Integer;
    SelInstruId : Integer;
    LoadId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    SelSiloId := Img.Tag;
    SelInstruId := StorageInfo[SelSiloId].InstrumentId ;
    LoadId := StorageInfo[SelSiloId].LoadNo;

    if ( WeigherStateInInstru[SelInstruId] and ($0100 shl (LoadId -1) ) ) <> 0 then    //����Ϊ��
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + SelInstruId -1, $000F + LoadId -1 ); //������
    end
    else    //����Ϊ��
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0210 + SelInstruId -1, $000B + LoadId -1 ); //������
    end;
end;

procedure TFrmMain.LoadWeigherLoadCounerLab(WeigherId : Integer; X,Y : integer);    //�����ϼ����� ��ǩ
begin
    WeigherLoadConterLab[WeigherId] := TLabel.Create(FrmMain);
    WeigherLoadConterLab[WeigherId].Parent := FrmMain;
    WeigherLoadConterLab[WeigherId].Font.Size := 12;
    WeigherLoadConterLab[WeigherId].Font.Style := [fsBold];
    WeigherLoadConterLab[WeigherId].AutoSize := True;
    //WeigherLoadConterLab[WeigherId]
    WeigherLoadConterLab[WeigherId].Alignment := taLeftJustify;
    WeigherLoadConterLab[WeigherId].Left := X;
    WeigherLoadConterLab[WeigherId].Top := Y;
    WeigherLoadConterLab[WeigherId].Visible := False;
    WeigherLoadConterLab[WeigherId].Caption := '0';
end;

procedure TFrmMain.LoadStorageMaterilInfoLb(StorageId : Integer);
begin
    LbMaterialNameInFrmMain[StorageId] := TLabel.Create(FrmMain);
    LbMaterialNameInFrmMain[StorageId].Parent := FrmMain;
    LbMaterialNameInFrmMain[StorageId].Visible := True;
    LbMaterialNameInFrmMain[StorageId].Font.Size := 12;
    LbMaterialNameInFrmMain[StorageId].Font.Style := [fsBold];
    LbMaterialNameInFrmMain[StorageId].AutoSize := True;
    LbMaterialNameInFrmMain[StorageId].Caption := StorageInfo[StorageId].MaterName;
    LbMaterialNameInFrmMain[StorageId].Left :=
      StorageImg[StorageId].Left + (StorageImg[StorageId].Width - LbMaterialNameInFrmMain[StorageId].Width) div 2;
    LbMaterialNameInFrmMain[StorageId].Top := StorageImg[StorageId].Top - 70 ;
    //���Ϲ��
    LbMaterialSpecInFrmMain[StorageId] := TLabel.Create(FrmMain);
    LbMaterialSpecInFrmMain[StorageId].Parent := FrmMain;
    LbMaterialSpecInFrmMain[StorageId].Visible := True;
    LbMaterialSpecInFrmMain[StorageId].Font.Name := '����';
    LbMaterialSpecInFrmMain[StorageId].Font.Size := 11;
    LbMaterialSpecInFrmMain[StorageId].Font.Style := [fsBold];
    LbMaterialSpecInFrmMain[StorageId].Caption := StorageInfo[StorageId].MaterSpec ;
    LbMaterialSpecInFrmMain[StorageId].AutoSize := True;
    LbMaterialSpecInFrmMain[StorageId].Left :=
      StorageImg[StorageId].Left +
      (StorageImg[StorageId].Width - LbMaterialSpecInFrmMain[StorageId].Width) div 2;
    LbMaterialSpecInFrmMain[StorageId].Top := StorageImg[StorageId].Top - 53;

end;

procedure TFrmMain.StorageMaterialMoistureLab(StorageId : Integer; X,Y : Integer);    //ԭ�Ϻ�ˮ��
begin
    if StorageId > 6 then
    begin
        Showmessage('�ϲֺŴ���6,�޺�ˮ����Ϣ');
    end
    else
    begin
        StorageWaterParaLab[StorageId] := TLabel.Create(FrmMain);
        StorageWaterParaLab[StorageId].Parent := FrmMain;
        StorageWaterParaLab[StorageId].Visible := True;
        StorageWaterParaLab[StorageId].Font.Name := '����';
        StorageWaterParaLab[StorageId].Font.Size := 11;
        StorageWaterParaLab[StorageId].Font.Style := [];//[fsBold];
        StorageWaterParaLab[StorageId].AutoSize := False;
        StorageWaterParaLab[StorageId].Alignment := taCenter;
        StorageWaterParaLab[StorageId].Width := StorageImg[StorageId].Width;
        StorageWaterParaLab[StorageId].Left := StorageImg[StorageId].Left;
        StorageWaterParaLab[StorageId].Top := StorageImg[StorageId].Top - 15;
        StorageWaterParaLab[StorageId].Caption := Format('%.1f', [StorageInfo[StorageId].Moisture]) + '%';
    end;
end;

procedure TFrmMain.LoadStorageLoadTargerLab(StorageId : Integer);    //�����ϲ�����Ŀ��ֵ��ǩ  ����Ŀ��ֵ��ǩ
begin
    StorageLoadTargetLab[StorageId] := TLabel.Create(FrmMain);
    StorageLoadTargetLab[StorageId].Parent := FrmMain;
    StorageLoadTargetLab[StorageId].Visible := True;
    StorageLoadTargetLab[StorageId].Font.Name := '����';
    StorageLoadTargetLab[StorageId].Font.Size := 12;
    StorageLoadTargetLab[StorageId].Font.Style := [];//[fsBold];
    StorageLoadTargetLab[StorageId].AutoSize := False;
    StorageLoadTargetLab[StorageId].Alignment := taCenter;
    StorageLoadTargetLab[StorageId].Width := StorageImg[StorageId].Width;
    StorageLoadTargetLab[StorageId].Left := StorageImg[StorageId].Left;
    StorageLoadTargetLab[StorageId].Top := StorageImg[StorageId].Top - 32;
    StorageLoadTargetLab[StorageId].Caption := '0';

    StorageLOadValueLab[StorageId] := TLabel.Create(FrmMain);
    StorageLOadValueLab[StorageId].Parent := FrmMain;
    StorageLOadValueLab[StorageId].Visible := False;
    StorageLOadValueLab[StorageId].Font.Name := '����';
    StorageLOadValueLab[StorageId].Font.Size := 13;
    StorageLOadValueLab[StorageId].Font.Style := [fsBold];
    StorageLOadValueLab[StorageId].Font.Color := clYellow;
    StorageLOadValueLab[StorageId].AutoSize := False;
    StorageLOadValueLab[StorageId].Alignment := taCenter;
    StorageLOadValueLab[StorageId].Width := StorageImg[StorageId].Width;
    StorageLOadValueLab[StorageId].Left := StorageImg[StorageId].Left;
    StorageLOadValueLab[StorageId].Top := StorageImg[StorageId].Top +20;
    StorageLOadValueLab[StorageId].Caption := '9999';
    StorageLOadValueLab[StorageId].Transparent := True;
    //StorageLoadValueLabVisible[StorageId] := False;
end;

procedure TFrmMain.LoadAggregateConveyorEquip(EquipNumber : Integer;                     //���ع��������豸
  SourseImgDir : String; X, Y, Width, Height : Integer);
begin
    ImgAggregateConveyor[EquipNumber] := TIMage.Create(FrmMain);
    ImgAggregateConveyor[EquipNumber].Parent := FrmMain;
    ImgAggregateConveyor[EquipNumber].Left := X;
    ImgAggregateConveyor[EquipNumber].Top := Y;
    ImgAggregateConveyor[EquipNumber].Width := Width;
    ImgAggregateConveyor[EquipNumber].Height := Height;
    ImgAggregateConveyor[EquipNumber].Proportional := True;
    ImgAggregateConveyor[EquipNumber].Transparent  := True;
    ImgAggregateConveyor[EquipNumber].Stretch      := True;
    ImgAggregateConveyor[EquipNumber].Picture.LoadFromFile(SourseImgDir);
end;

procedure TFrmMain.LoadAggrConvHolpTmrLab(ConvyorBeltId : Integer; X,Y : Integer);    //����бƤ�����͹��ϳ���ʱ��
begin
    LabAggrConvHoldTmr[ConvyorBeltId] := TLabel.Create(FrmMain);
    LabAggrConvHoldTmr[ConvyorBeltId].Parent := FrmMain;
    LabAggrConvHoldTmr[ConvyorBeltId].Left := X;
    LabAggrConvHoldTmr[ConvyorBeltId].Top := Y;
    LabAggrConvHoldTmr[ConvyorBeltId].Font.Size := 14;
    LabAggrConvHoldTmr[ConvyorBeltId].Font.Style := [fsBold];
    LabAggrConvHoldTmr[ConvyorBeltId].AutoSize := True;
    LabAggrConvHoldTmr[ConvyorBeltId].Alignment := taLeftJustify;
    LabAggrConvHoldTmr[ConvyorBeltId].Caption := '0';
end;

procedure TFrmMain.LoadAggrDschBeltRunBtn( EquipId : Integer;   //����ƽƤ���㶯������ť
  SourseImgDir : String; X,Y,Width,Height : Integer);
begin
     ImgAggrConvRunBtn[EquipId] := TIMage.Create(FrmMain);
     ImgAggrConvRunBtn[EquipId].Parent := FrmMain;
     ImgAggrConvRunBtn[EquipId].Left := x;
     ImgAggrConvRunBtn[EquipId].Top := y;
     ImgAggrConvRunBtn[EquipId].AutoSize := True;
     ImgAggrConvRunBtn[EquipId].Tag := EquipId;
     ImgAggrConvRunBtn[EquipId].Picture.LoadFromFile(SourseImgDir);
     ImgAggrConvRunBtn[EquipId].Cursor := crHandPoint;
     ImgAggrConvRunBtn[EquipId].OnClick := AggrConvBeltRunBtnImgClick;
end;

procedure TFrmMain.AggrConvBeltRunBtnImgClick(Sender: TObject);
Var
    Img : TImage;
    BeltId : Integer;
    BeltType : Integer;
    WaitWtInstrumentReplyPt : Integer ;
begin
    Img := TImage(Sender);
    BeltId := Img.Tag ;
    BeltType := AggregateConveyorEquipInfo[BeltId].EquipType;

    case BeltType of
        CntAggConveyEquipIsLtLevelBelt    :    //��ƽƤ��
        begin
            if AggrMidHopperStateInInstru and (1 shl 7) <> 0 then    //ƽƤ������ź���Ч
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0006 ); //�ر�ƽƤ��
            end
            else    //ƽƤ�������Ч
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0005 ); //��ƽƤ��
            end;
        end;

        CntAggConveyEquipIsRtLevelBelt    :    //��ƽƤ��
        begin

        end;

        CntAggConveyEquipIsLtInclinedBelt :    //��бƤ��
        begin

        end;

        CntAggConveyEquipIsRtInclinedBelt :    //��бƤ��
        begin

        end;

        //= 5;//��������
        //= 6;//��������
        CntAggConveyEquipIsLtShtLevelBelt :    //����ƽƤ��
        begin

        end;
    end;
end;

procedure TFrmMain.DSPAggrConvEquipBtnIMgNewState(EquipId : Integer; NewState : Integer);    //���¹�������Ƥ�� ��ͣ��ťͼƬ ״̬
begin
    if AggrConvEquipBtnState[EquipId] <> CtAggrConvEquipBtnIsNone then
    begin
        case NewState of
            CtAggrConvEquipBtnIsInvalid :    //���������豸��ť״̬ Ϊ ��Ч
            begin
                ImgAggrConvRunBtn[EquipId].Picture.loadFromFile(AppPath + '\Images\Equips\Straps\RunInvalid.png');
                AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsInvalid;
            end;

            CtAggrConvEquipBtnIsValid   :    //���������豸��ť״̬ Ϊ ��Ч
            begin
                ImgAggrConvRunBtn[EquipId].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\RunValid.png');
                AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsValid;
            end;
        end;
    end;
end;

//LmtType = 1 ����λ  LmtType=2 ����λ
procedure TFrmMain.LoadLiftBucketLmtImg(LiftbucketNum : Integer; SourseImgDir : String;  //����������������λ
  X,Y : Integer; Width, Height : Integer; LmtType : Integer);
begin
    case LmtType of
        1:        //��������������λ
        begin
            ImgLiftBucketBottomLmt[LiftbucketNum] := TImage.Create(FrmMain);
            ImgLiftBucketBottomLmt[LiftbucketNum].Parent := FrmMain;
            ImgLiftBucketBottomLmt[LiftbucketNum].Left   := x;
            ImgLiftBucketBottomLmt[LiftbucketNum].Top    := y;
            ImgLiftBucketBottomLmt[LiftbucketNum].Width  := Width;
            ImgLiftBucketBottomLmt[LiftbucketNum].Height := Height;
            ImgLiftBucketBottomLmt[LiftbucketNum].AutoSize := True;
            ImgLiftBucketBottomLmt[LiftbucketNum].Picture.LoadFromFile(SourseImgDir);
        end;
        2:       //��������������λ
        begin
            ImgLiftBucketTopLmt[LiftbucketNum] := TImage.Create(FrmMain);
            ImgLiftBucketTopLmt[LiftbucketNum].Parent := FrmMain;
            ImgLiftBucketTopLmt[LiftbucketNum].Left   := x;
            ImgLiftBucketTopLmt[LiftbucketNum].Top    := y;
            ImgLiftBucketTopLmt[LiftbucketNum].Width  := Width;
            ImgLiftBucketTopLmt[LiftbucketNum].Height := Height;
            ImgLiftBucketTopLmt[LiftbucketNum].AutoSize := True;
            ImgLiftBucketTopLmt[LiftbucketNum].Picture.LoadFromFile(SourseImgDir);
        end;
    end;
end;

//LmtType = 1 ������ť  LmtType=2 �½���ť
//LiftbucketNum =1������������LiftbucketNum=2����������
procedure TFrmMain.LoadLiftBucketBtnImg(LiftbucketNum : Integer; SourseImgDir : String;  //����������������ť
  X,Y : Integer; Width, Height : Integer; LmtType : Integer);
begin
    case LmtType of
        1:        //��������������
        begin
            ImgLiftBucketGoUp[LiftbucketNum] := TImage.Create(FrmMain);
            ImgLiftBucketGoUp[LiftbucketNum].Parent   := FrmMain;
            ImgLiftBucketGoUp[LiftbucketNum].Left     := x;
            ImgLiftBucketGoUp[LiftbucketNum].Top      := y;
            ImgLiftBucketGoUp[LiftbucketNum].Width    := Width;
            ImgLiftBucketGoUp[LiftbucketNum].Height   := Height;
            ImgLiftBucketGoUp[LiftbucketNum].AutoSize := True;
            ImgLiftBucketGoUp[LiftbucketNum].Cursor   := crHandPoint;
            ImgLiftBucketGoUp[LiftbucketNum].Tag      := LiftbucketNum;
            //ImgLiftBucketGoUp[LiftbucketNum].OnClick  := LiftBucketGoUpBtnClick;
            ImgLiftBucketGoUp[LiftbucketNum].OnMouseDown := LiftBucketGoUpMouseDn ;
            ImgLiftBucketGoUp[LiftbucketNum].OnMouseUp   := LiftBucketGoUpMouseUp ;
            ImgLiftBucketGoUp[LiftbucketNum].Picture.LoadFromFile(SourseImgDir);
        end;

        2:       //�����������½�
        begin
            ImgLiftBucketGoDn[LiftbucketNum] := TImage.Create(FrmMain);
            ImgLiftBucketGoDn[LiftbucketNum].Parent   := FrmMain;
            ImgLiftBucketGoDn[LiftbucketNum].Left     := x;
            ImgLiftBucketGoDn[LiftbucketNum].Top      := y;
            ImgLiftBucketGoDn[LiftbucketNum].Width    := Width;
            ImgLiftBucketGoDn[LiftbucketNum].Height   := Height;
            ImgLiftBucketGoDn[LiftbucketNum].AutoSize := True;
            ImgLiftBucketGoDn[LiftbucketNum].Cursor   := crHandPoint;
            ImgLiftBucketGoDn[LiftbucketNum].Tag      := LiftbucketNum;
            //ImgLiftBucketGoDn[LiftbucketNum].OnClick  := LiftBucketGoDnBtnClick;
            ImgLiftBucketGoDn[LiftbucketNum].OnMouseDown := LiftBucketGoDnMouseDn ;
            ImgLiftBucketGoDn[LiftbucketNum].OnMouseUp   := LiftBucketGoDnMouseUp ;
            ImgLiftBucketGoDn[LiftbucketNum].Picture.LoadFromFile(SourseImgDir);
        end;
    end;
end;

procedure TFrmMain.CreatLiftBucketPreRiseLab(LiftbucketNum : Integer; X,Y : Integer;   //����������Ԥ������ǩ
  Width, Height : Integer);
begin
    LabLiftBucketPreRisLab[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketPreRisLab[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketPreRisLab[LiftbucketNum].Left := x;
    LabLiftBucketPreRisLab[LiftbucketNum].Top  := y ;
    LabLiftBucketPreRisLab[LiftbucketNum].Caption := 'Ԥ����';
    LabLiftBucketPreRisLab[LiftbucketNum].Visible := True;;
end;

Procedure TFrmMain.CreatLiftBucketPreRiseTmrLab(LiftbucketNum : Integer; X,Y : Integer;   //����������Ԥ������ʱ��
  Width, Height : Integer);
begin
    LabLiftBucketPreRisTmr[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketPreRisTmr[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketPreRisTmr[LiftbucketNum].Left := x;
    LabLiftBucketPreRisTmr[LiftbucketNum].Top  := y ;
    LabLiftBucketPreRisTmr[LiftbucketNum].Caption := '��ʱ��';
    LabLiftBucketPreRisTmr[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.CreatLiftBucketDschLab (LiftbucketNum : Integer; X,Y : Integer;         //����������ж�ϱ�ǩ
  Width, Height : Integer);
begin
    LabLiftBucketDschLab[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketDschLab[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketDschLab[LiftbucketNum].Left := x;
    LabLiftBucketDschLab[LiftbucketNum].Top  := y ;
    LabLiftBucketDschLab[LiftbucketNum].Caption := 'ж�ϼ�ʱ';
    LabLiftBucketDschLab[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.CreatLiftBucketDschTmrLab(LiftbucketNum : Integer; X,Y : Integer;      //����������ж�ϼ�ʱ��
  Width, Height : Integer);
begin
    LabLiftBucketDschTmr[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketDschTmr[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketDschTmr[LiftbucketNum].Left := x;
    LabLiftBucketDschTmr[LiftbucketNum].Top  := y ;
    LabLiftBucketDschTmr[LiftbucketNum].Caption := '��ʱ��';
    LabLiftBucketDschTmr[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.CreatLiftBucketProCountNmLab(LiftbucketNum : Integer; X,Y : Integer;   //��������������������ǩ
  Width, Height : Integer);
begin
    LabLiftBucketLdCountLab[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketLdCountLab[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketLdCountLab[LiftbucketNum].Left := x;
    LabLiftBucketLdCountLab[LiftbucketNum].Top  := y ;
    LabLiftBucketLdCountLab[LiftbucketNum].Caption := '�̴Σ�';
    LabLiftBucketLdCountLab[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.CreatLiftBucketProCounterLab(LiftbucketNum : Integer; X,Y : Integer;   //��������������������
  Width, Height : Integer);
begin
    LabLiftBucketLdCounter[LiftbucketNum] := TLabel.Create(FrmMain);
    LabLiftBucketLdCounter[LiftbucketNum].Parent := FrmMain;
    LabLiftBucketLdCounter[LiftbucketNum].Left := x;
    LabLiftBucketLdCounter[LiftbucketNum].Top  := y ;
    LabLiftBucketLdCounter[LiftbucketNum].Caption := '��ʱ��';
    LabLiftBucketLdCounter[LiftbucketNum].Visible := True;;
end;

procedure TFrmMain.LiftBucketGoUpBtnClick(Sender: TObject);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1������������2����������
begin
    Img := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //��������
        begin
            showmessage('������������') ;
        end;

        2 :    //��������
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoDnMouseDn(Sender: TObject; Button: TMouseButton; //�������½� ��ť ��� ����
  Shift: TShiftState; X, Y: Integer);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1������������2����������
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //��������
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0003 ); ;
        end;

        2 :    //��������
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoDnMouseUp(Sender: TObject; Button: TMouseButton; //�������½� ��ť ��� ̧��
  Shift: TShiftState; X, Y: Integer);    
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1������������2����������
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //��������
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0004 );    //�ر��������½�
        end;

        2 :    //��������
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoDnBtnClick(Sender: TObject);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1������������2����������
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //��������
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0003 ); ;
        end;

        2 :    //��������
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoUpMouseDn(Sender: TObject; Button: TMouseButton;    //������ ���� ��ť ��갴��
  Shift: TShiftState; X, Y: Integer);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1������������2����������
    WaitWtInstrumentReplyPt : Integer;
begin
    Img    := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //��������
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0001 );   //���� ������ ����
        end;

        2 :    //��������
        begin

        end;
    end;
end;

procedure TFrmMain.LiftBucketGoUpMouseUp(Sender: TObject; Button: TMouseButton;    //������ ���� ��ť ���̧��
  Shift: TShiftState; X, Y: Integer);
var
    BtnTag : Integer;
    Img : TImage;
    LiftBucketNum : Integer;    //1������������2����������
    WaitWtInstrumentReplyPt : Integer;
begin
    Img    := TImage( Sender );
    BtnTag := Img.Tag;

    LiftBucketNum := BtnTag;
    case LiftBucketNum of
        1 :    //��������
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0002 );   //���� ������ ����
        end;

        2 :    //��������
        begin

        end;
    end;
end;

procedure TFrmMain.LoadAggregateBinImgFromFile(MidBinId : Integer; SourseImgDir : String;    //���������м��ͼƬ
  X,Y : Integer; Width, Height : Integer);
begin
    ImgAggregateMidBin[MidBinId] := TImage.Create(FrmMain);
    ImgAggregateMidBin[MidBinId].Parent := FrmMain;
    ImgAggregateMidBin[MidBinId].OnContextPopup := AggrHopperOnContextPopup;
    ImgAggregateMidBin[MidBinId].PopupMenu := PMAggregateMidBin;
    ImgAggregateMidBin[MidBinId].Left := X;
    ImgAggregateMidBin[MidBinId].Top := Y ;
    ImgAggregateMidBin[MidBinId].Width := Width;
    ImgAggregateMidBin[MidBinId].Height := Height;
    ImgAggregateMidBin[MidBinId].Tag := MidBinId;
    ImgAggregateMidBin[MidBinId].Picture.LoadFromFile(SourseImgDir);  //}
end;

procedure TFrmMain.LoadAggregateBinFullImgFromFile(MidBinId : Integer; SourseImgDir : String;    //���������м������ʶͼƬ
  X,Y : Integer; Width, Height : Integer);
begin
    ImgMidBinFull[MidBinId] := TImage.Create(FrmMain);
    ImgMidBinFull[MidBinId].Parent := FrmMain;
    ImgMidBinFull[MidBinId].AutoSize := True;
    ImgMidBinFull[MidBinId].Picture.LoadFromFile(SourseImgDir);
    ImgMidBinFull[MidBinId].Top  := ImgAggregateMidBin[MidBinId].Top;
    ImgMidBinFull[MidBinId].Left := ImgAggregateMidBin[MidBinId].Left ;

    MidBinIsFull[MidBinId] := True;
end;

procedure TFrmMain.AggrHopperOnContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
    Img : TImage;    
begin
     Img := TImage(Sender);
     PMAggrHopperId := Img.Tag;
end;

procedure TFrmMain.LoadAggrMidStorDschValveImg(MidBinId : Integer;              //װ�ع����м��ж�Ϸ�
  SourseImgDir : String; X,Y : Integer);
begin
    ImgAggrMidBinDschValve[MidBinId] := TImage.Create(FrmMain);
    ImgAggrMidBinDschValve[MidBinId].Parent := FrmMain;
    ImgAggrMidBinDschValve[MidBinId].Left := X;
    ImgAggrMidBinDschValve[MidBinId].Top  := Y;
    ImgAggrMidBinDschValve[MidBinId].Tag := MidBinId;
    ImgAggrMidBinDschValve[MidBinId].AutoSize := True;
    ImgAggrMidBinDschValve[MidBinId].Cursor := crHandPoint;
    ImgAggrMidBinDschValve[MidBinId].Picture.LoadFromFile(SourseImgDir);  //}
    ImgAggrMidBinDschValve[MidBinId].OnClick := AggrMdHopperDschValveImgClick;
end;

procedure TFrmMain.AggrMdHopperDschValveImgClick(Sender : TObject);
var
    Img : TImage;
    MidBinId : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    MidBinId := Img.Tag;

    case MidBinId of
        1:    //1#�����м��
        begin
            if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then     //�м��ж�Ϸ� ��Ч
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0002 ); //�ر��м�� ж�Ϸ�
            end
            else                                                      //�м��ж�Ϸ� ��Ч
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0001 ); //���м�� ж�Ϸ�
            end;
        end ;

        2:    //2#�����м��
        begin

        end;
    end;
end;

procedure TFrmMain.DSpAggrMidHopperDschValveImgNewState(MidBinId : Integer;     //��ʾ�����м��ж�Ϸ�ͼƬ ��״̬
  NewDschValueState : Integer);
begin
    case NewDschValueState of
        CntMdHopDshValImgIsInvalie :    //�м䶷ж�Ϸ�״̬ Ϊ ��Ч
        begin
            ImgAggrMidBinDschValve[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\DschValveClose.png');
            AggrMidHopperDschValveImgState[MidBinId] := CntMdHopDshValImgIsInvalie;
        end;

        CntMdHopDshValImgIsValid   :    //�м䶷ж�Ϸ�״̬ �� ��Ч
        begin
            ImgAggrMidBinDschValve[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\DschValveOpen.png');
            AggrMidHopperDschValveImgState[MidBinId] := CntMdHopDshValImgIsValid;
        end;
    end;
end;

procedure TFrmMain.LoadAggrMidStorOpenLmtImg(MidBinId : Integer; SourseImgDir : String;    //װ���м�ֿ�����λ
  X,Y : Integer );
begin
    ImgAggrMidBinOpenLmt[MidBinId] := TImage.Create(FrmMain);     //�����м�ֿ�����λ
    ImgAggrMidBinOpenLmt[MidBinId].Parent := FrmMain;
    ImgAggrMidBinOpenLmt[MidBinId].Left := X;
    ImgAggrMidBinOpenLmt[MidBinId].Top  := Y;
    ImgAggrMidBinOpenLmt[MidBinId].Tag := MidBinId;
    ImgAggrMidBinOpenLmt[MidBinId].AutoSize := True;
    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile(SourseImgDir);  //}
end;

procedure TFrmMain.LoadAggrMidStorCloseLmtImg(MidBinId : Integer; SourseImgDir : String;    //װ���м�ֹ�����λ
  X,Y : Integer );
begin
    ImgAggrMIdBinCloseLmt[MidBinId] := TImage.Create(FrmMain);     //�����м�ֹ�����λ
    ImgAggrMIdBinCloseLmt[MidBinId].Parent := FrmMain;
    ImgAggrMIdBinCloseLmt[MidBinId].Left := X;
    ImgAggrMIdBinCloseLmt[MidBinId].Top  := Y;
    ImgAggrMIdBinCloseLmt[MidBinId].Tag := MidBinId;
    ImgAggrMIdBinCloseLmt[MidBinId].AutoSize := True;
    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile(SourseImgDir);  //}
end;

procedure TFrmMain.DspAggrMidBinDschValvLmtImgNewState(MidBinId : Integer;      //�����м䶷ж�Ϸ� ��λ ͼƬ״̬
  DschValveLmtNm : Integer; LmtImgNewState : Integer);
begin
    case DschValveLmtNm of
        CtMdHopDschValLmtIsClose :       //�м䶷ж���� ��λ�� ����
        begin
            case LmtImgNewState of
                CtMdHopDschValLmtImgIsInvalid :  //�м䶷ж���� ��λͼƬ ��Ч
                begin
                    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveLmtInValid.png');
                    AggrMdHopperDschValClLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsInvalid;
                end;

                CtMdHopDschValLmtImgIsValid   :  //�м䶷ж���� ����λͼƬ ��Ч
                begin
                    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveCloLmtValid.gif');
                    AggrMdHopperDschValClLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsValid;
                end;

                CtMdHopDschValLmtImgIsInvSpl  :  //�м䶷ж���� ��λͼƬ ��Ч��˸
                begin
                    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveLmtInValidFlash.gif');
                    AggrMdHopperDschValClLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsInvSpl;
                end;

                CtMdHopDschValLmtImgIsValSpl  :  //�м䶷ж���� ��λͼƬ ��Ч��˸
                begin
                    ImgAggrMIdBinCloseLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidbinDschValveLmtValidFlash.gif');
                    AggrMdHopperDschValClLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsValSpl;
                end;
            end; 
        end;

        CtMdHopDschValLmtIsOpen  :       //�м䶷ж���� ��λ�� ����
        begin
            case LmtImgNewState of
                CtMdHopDschValLmtImgIsInvalid :  //�м䶷ж���� ��λͼƬ ��Ч
                begin
                    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveLmtInValid.png');
                    AggrMdHopperDschValOpLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsInvalid;
                end;

                CtMdHopDschValLmtImgIsValid   :  //�м䶷ж���� ��λͼƬ ��Ч
                begin
                    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveOpLmtValid.png');
                    AggrMdHopperDschValOpLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsValid;
                end;

                CtMdHopDschValLmtImgIsInvSpl  :  //�м䶷ж���� ��λͼƬ ��Ч��˸
                begin
                    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinDschValveLmtInValidFlash.gif');
                    AggrMdHopperDschValOpLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsInvSpl;
                end;

                CtMdHopDschValLmtImgIsValSpl  :  //�м䶷ж���� ��λͼƬ ��Ч��˸
                begin
                    ImgAggrMidBinOpenLmt[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidbinDschValveLmtValidFlash.gif');
                    AggrMdHopperDschValOpLmtImgState[MidBinId] := CtMdHopDschValLmtImgIsValSpl;
                end;
            end;
        end;
    end;
end;

procedure TFrmMain.LoadAggrMidStorVibraImg(MidBinId : Integer; SourseImgDir : String;    //װ���м������
  X,Y : Integer );
begin
    ImgAggrMidBinVibra[MidBinId] := TImage.Create(FrmMain);     //�����м������
    ImgAggrMidBinVibra[MidBinId].Parent := FrmMain;
    ImgAggrMidBinVibra[MidBinId].Left := X;
    ImgAggrMidBinVibra[MidBinId].Top  := Y;
    ImgAggrMidBinVibra[MidBinId].Tag := MidBinId;
    ImgAggrMidBinVibra[MidBinId].AutoSize := True;
    ImgAggrMidBinVibra[MidBinId].Picture.LoadFromFile(SourseImgDir);
    ImgAggrMidBinVibra[MidBinId].Cursor := crHandPoint;
    ImgAggrMidBinVibra[MidBinId].OnClick := AggrMidBinDschVibraImgClick; //}
end;

procedure TFrmMain.AggrMidBinDschVibraImgClick(Sender : TObject);
var
    Img : TImage;
    MidBin : Integer;
    WaitWtInstrumentReplyPt : Integer;
begin
    Img := TImage(Sender);
    MidBin := Img.Tag;

    case MIdBin of
        1:    //1#�м������
        begin
            if AggrMidHopperStateInInstru and (1 shl 9) <> 0 then    //�м䶷ж������ ��� ��Ч
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $000A);    //�ر�����
            end
            else
            begin
                WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0221, $0009);    //������
            end;
        end;
    end;
end;

procedure TFrmMain.DspAggrMidBInDschVibraImgNewState(MidBinId : Integer;        //���¹����м��ж������ͼƬ״̬
  NewVibraImgState : Integer);
begin
    case NewVibraImgState of
        CntMdHopDshVibraImgIsInvalie :    //�м䶷ж�� ����ͼƬ ��Ч״̬
        begin
            ImgAggrMidBinVibra[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinVibratorInvalid.png');
            AggrMidHopperDschVibraImgState[MidBinId] := CntMdHopDshVibraImgIsInvalie ;
        end;

        CntMdHopDshVibraImgIsValid   :    //�м䶷ж�� ����ͼƬ ��Ч״̬
        begin
            ImgAggrMidBinVibra[MidBinId].Picture.LoadFromFile( AppPath+ 'Images\Equips\MidBin\MidBinVibratorValid.png');
            AggrMidHopperDschVibraImgState[MidBinId] := CntMdHopDshVibraImgIsValid;
        end;
    end;
end;

procedure TFrmMain.LoadAggrMidBinDschTmrLab(MidBinId : Integer; X,Y : Integer);    //�����м��ж�ϼ�ʱ����ǩ
begin
    LabAggrMidBinDschTmr[MidBinId] := TLabel.Create(FrmMain);
    LabAggrMidBinDschTmr[MidBinId].Parent := FrmMain;
    LabAggrMidBinDschTmr[MidBinId].Left := X;
    LabAggrMidBinDschTmr[MidBinId].Top := Y;
    LabAggrMidBinDschTmr[MidBinId].Font.Size := 14;
    LabAggrMidBinDschTmr[MidBinId].Font.Style := [fsBold];
    LabAggrMidBinDschTmr[MidBinId].AutoSize := True;
    LabAggrMidBinDschTmr[MidBinId].Alignment := taLeftJustify;
    LabAggrMidBinDschTmr[MidBinId].Caption := '0';
end;

procedure TFrmMain.LoadMidBinLoadCounterLab(MidBinId : Integer; X,Y : Integer);    //�����м��װ���̴�
begin
    LabAggrMIdBinLdCounter[MidBinId] := TLabel.Create(FrmMain);
    LabAggrMIdBinLdCounter[MidBinId].Parent := FrmMain;
    LabAggrMIdBinLdCounter[MidBinId].Left := X;
    LabAggrMIdBinLdCounter[MidBinId].Top := Y;
    LabAggrMIdBinLdCounter[MidBinId].Font.Size := 12;
    LabAggrMIdBinLdCounter[MidBinId].Font.Style := [fsBold];
    LabAggrMIdBinLdCounter[MidBinId].AutoSize := True;
    LabAggrMIdBinLdCounter[MidBinId].Alignment := taLeftJustify;
    LabAggrMIdBinLdCounter[MidBinId].Caption := '0';
end;

procedure TFrmMain.LoadAggrLiftBucketImg(BucketNum : Integer; SourseImgDir : String;    //����������ͼƬ
  X,Y : Integer );
begin
    ImgLiftBucket[BucketNum] := TImage.Create(FrmMain);
    ImgLiftBucket[BucketNum].Parent   := FrmMain;
    ImgLiftBucket[BucketNum].Left     := X;
    ImgLiftBucket[BucketNum].Top      := Y;
    ImgLiftBucket[BucketNum].Tag      := BucketNum;
    ImgLiftBucket[BucketNum].AutoSize := True;
    ImgLiftBucket[BucketNum].Picture.LoadFromFile( SourseImgDir );
    ImgLiftBucket[BucketNum].Cursor   := crDrag;
    ImgLiftBucket[BucketNum].PopupMenu:= PMAggregateMidBin;
    ImgLiftBucket[BucketNum].OnContextPopup := AggrHopperOnContextPopup;
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]
    //ImgLiftBucket[BucketNum]

end;

procedure TFrmMain.StorageContexPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
    Img : TImage ;
begin
    Img := Timage(Sender);
    PMStorageId := Img.Tag;

    //if StorageInfo[PMStorageId].StockDsp then
    //    RMAddMater.Visible := True
    //else
        RMAddMater.Visible := False;
end;

procedure TfrmMain.CreateMixerImg(MixerID : Integer; SourseImgDir : String;    //���������ͼƬ
    X,Y : Integer; Width, Height : Integer);
begin
    ImgMixer[MixerID] := TImage.Create(FrmMain);
    ImgMixer[MixerID].Parent := FrmMain;
    ImgMixer[MixerID].PopupMenu := PMMixer ;
    ImgMixer[MixerID].Left := X;
    ImgMixer[MixerID].Top := Y;
    //ImgMixer[ImgNo].Width := Width;
    //ImgMixer[ImgNo].Height := Height;
    ImgMixer[MixerID].Tag := MixerID;
    ImgMixer[MixerID].AutoSize := True;
    ImgMixer[MixerID].Picture.LoadFromFile(SourseImgDir);  //}
end;

procedure TFrmMain.DspMixerFlashNewState(MixerId : Integer; MewState : Integer);    //�������������
begin
    case MewState of
        CtMxrFlashStIsEmptyStop :    //��������� ��ͣ
        begin
            ImgMixer[MixerID].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Blender1.png');
            MixerFalshState[MixerId] := CtMxrFlashStIsEmptyStop ;
        end;

        CtMxrFlashStIsFullStop  :    //��������� ��ͣ
        begin
            ImgMixer[MixerID].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Blender3.png');
            MixerFalshState[MixerId] := CtMxrFlashStIsFullStop ;                                                           
        end;

        CtMxrFlashStIsEmptyRun  :    //��������� ������
        begin
            ImgMixer[MixerID].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\BlenderEmptyRun.gif');
            MixerFalshState[MixerId] := CtMxrFlashStIsEmptyRun ;
        end;

        CtMxrFlashStIsFullRun   :    //��������� ������
        begin
            ImgMixer[MixerID].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\BlenderFullRun.gif');
            MixerFalshState[MixerId] := CtMxrFlashStIsFullRun ;
        end;
    end;
end;

procedure TfrmMain.CreateMixerDschDoor(MixerId : Integer; SourseImgDir : String;    //���������ж����ͼƬ
  X,Y : Integer; Width, Height : Integer);
begin
    ImgMixerDschDoor[MixerId] := TImage.Create(FrmMain);
    ImgMixerDschDoor[MixerId].Parent := FrmMain ;
    ImgMixerDschDoor[MixerId].Left := X;
    ImgMixerDschDoor[MixerId].Top := Y;
    //ImgMixerDschDoor[MixerId].Width := width;
    //ImgMixerDschDoor[MixerId].Height := Height;
    ImgMixerDschDoor[MixerId].AutoSize := True;
    ImgMixerDschDoor[MixerId].Picture.LoadFromFile(SourseImgDir);
    {      //�����ж���Źر�


    ImgMixerDschDoor[2] := TImage.Create(FrmMain);
    ImgMixerDschDoor[2].Parent := FrmMain;
    ImgMixerDschDoor[2].Left := X;
    ImgMixerDschDoor[2].Top := Y;
    ImgMixerDschDoor[2].Width := Width;
    ImgMixerDschDoor[2].Height := Height;
    ImgMixerDschDoor[1].Picture.LoadFromFile(SourseImgDir + '\Half.png');      //�����ж���Ű뿪

    ImgMixerDschDoor[3] := TImage.Create(FrmMain);
    ImgMixerDschDoor[3].Parent := FrmMain;
    ImgMixerDschDoor[3].Left := X;
    ImgMixerDschDoor[3].Top := Y;
    ImgMixerDschDoor[3].Width := Width;
    ImgMixerDschDoor[3].Height := Height;
    ImgMixerDschDoor[3].Picture.LoadFromFile(SourseImgDir + '\Open.png');      //�����ж����ȫ�� //}
end;

procedure TFrmMain.DspMixerDschValveImgNewState(MixerId : Integer; NewState : Integer);     //�����ж�Ϸ�ͼƬ״̬
begin
    case NewState of
        CtMxrDschValStIsOpen     :    //�����ж���� ״̬  ��
        begin
            ImgMixerDschDoor[MixerId].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Open.png');
            MixerDschValveImgState[MixerId] := CtMxrDschValStIsOpen ;
        end;

        CtMxrDschValStIsClose    :    //�����ж���� ״̬  ��
        begin
            ImgMixerDschDoor[MixerId].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Close.png');
            MixerDschValveImgState[MixerId] := CtMxrDschValStIsClose;
        end;

        CtMxrDschValStIsHalfOpen :    //�����ж���� ״̬  �뿪
        begin
            ImgMixerDschDoor[MixerId].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\Half.png');
            MixerDschValveImgState[MixerId] := CtMxrDschValStIsHalfOpen;
        end;

        CtMxrDschValStIsAlarm    :    //�����ж���� ״̬   ����
        begin
            ImgMixerDschDoor[MixerId].Picture.LoadFromFile( AppPath + '\Images\Equips\Blenders\OpenAlarm.png');
            MixerDschValveImgState[MixerId] := CtMxrDschValStIsAlarm;
        end;
    end;
end;

procedure TFrmMain.DSpBtnMixerDschValveOPenNewState(MixerId : Integer; NewState : Integer);
begin
    case NewState of
        CtBtnMxrDschValveOpStIsValid   :    //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
        begin
            cxBtnMixerDischOPen.Color := clLime;

            BtnMxrDschValveOpState[1] := CtBtnMxrDschValveOpStIsValid;
        end;

        CtBtnMxrDschValveOpStIsInvalid :    //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
        begin
            cxBtnMixerDischOPen.Color := clBtnFace;
            
            BtnMxrDschValveOpState[1] := CtBtnMxrDschValveOpStIsInvalid;
        end;
    end;
end;

procedure TFrmMain.DspBtnMixerDschValveCloseNewState(MixerId : Integer; NewState : Integer);
begin
    case NewState of
        CtBtnMxrDschValveClStIsValid   :    //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
        begin
            cxBtnMixerDischClose.Color := clLime;

            BtnMxrDschValveClState[1] := CtBtnMxrDschValveClStIsValid;
        end;

        CtBtnMxrDschValveClStIsInvalid :    //�����ж���� ���Ű�ť״̬ Ϊ ��Ч
        begin
            cxBtnMixerDischClose.Color := clBtnFace;

            BtnMxrDschValveClState[1] := CtBtnMxrDschValveClStIsInvalid;
        end;
    end;
end;

procedure TFrmMain.LoadMixerDschTmrLab(MixerId : Integer; X,Y : Integer);       //���ؽ����ж�ϼ�ʱ����ǩ
begin
    LabMixerDschTmr[MixerId] := TLabel.Create(FrmMain);
    LabMixerDschTmr[MixerId].Parent := FrmMain;
    LabMixerDschTmr[MixerId].Left := X;
    LabMixerDschTmr[MixerId].Top := Y;
    LabMixerDschTmr[MixerId].Font.Size := 14;
    LabMixerDschTmr[MixerId].AutoSize := True;
    LabMixerDschTmr[MixerId].Alignment := taLeftJustify;
    LabMixerDschTmr[MixerId].Caption := '0';
end;

procedure TFrmMain.LoadMixerProdCounterLab(MixerId : Integer; X,Y : Integer);   //���ؽ����������������ǩ
begin
    LabMixerProdCounter[MixerId] := TLabel.Create(FrmMain);     //�����ж�ϼ�ʱ����ǩ
    LabMixerProdCounter[MixerId].Parent := FrmMain;
    LabMixerProdCounter[MixerId].Left := X;
    LabMixerProdCounter[MixerId].Top := Y;
    LabMixerProdCounter[MixerId].Font.Size := 12;
    LabMixerProdCounter[MixerId].AutoSize := True;
    LabMixerProdCounter[MixerId].Alignment := taLeftJustify;
    LabMixerProdCounter[MixerId].Caption := '0';
end;

procedure TFrmMain.CreatBellImg( X,Y : Integer;   //���ص���
  Width, Height : Integer);
begin
    ImgBell := TBellImg.Create(FrmMain)  ;       //����ͼƬ
    ImgBell.Parent := FrmMain;
    ImgBell.Left := X;
    ImgBell.Top  := Y;
    ImgBell.AutoSize := True;
    ImgBell.Picture.LoadFromFile( AppPath + '\Images\Equips\Bell\Bell.png');
    ImgBell.Cursor := crHandPoint;
    ImgBellState := ImgBeltStateIsUnRing;
    ImgBell.OnMouseDown := ImgBellMouseDn;
    ImgBell.OnMouseUp   := ImgBellMouseUp;
end;

procedure TFrmMain.ImgBellMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if ( mouseEnterBellImg ) then
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $000C );   //���� ��
        ImgBellState := ImgBeltStateIsUnRing ;     //����ͼƬ����״̬
        ImgBell.Picture.LoadFromFile( AppPath + '\Images\Equips\Bell\Bell.png' );
    end;
end;

procedure TFrmMain.ImgBellMouseDn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    //Showmessage(inttostr(x) + ',' + inttostr(y));
    WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $000B );   //���� ��
    ImgBellState := IMgBeltStateIsRing ;     //����ͼƬ��״̬
    ImgBell.Picture.LoadFromFile( AppPath + '\Images\Equips\Bell\Ring.png' );
end;
//------------------------------------------------------------------------------

//---------------------------��ʼ����ѡ��---------------------------------------
//procedure TFrmMain.IniCheckerForControlPanel(CheckNm : String; X,Y : Integer;
//  Width, Height : Integer; Check : Boolean);
//var
//    CheckB : TRZCheckBox;
//begin
    {CheckB := TRZCheckBox(FindComponent(CheckNm));
    try
        CheckB.Left := X;
        CheckB.Top := Y;
        //CheckB.Width := Width;
        //CheckB.Height := Height;
        CheckB.Checked := Check;
    except
        Showmessage('��Ч�ĸ�ѡ��' + CheckNm);
    end; //}
//end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
procedure TFrmMain.UpdataBitBtnGlyph(BtnName : String; Check : Boolean);
var
    Btn : TcxButton;
begin
    Btn := TcxButton(FindComponent(BtnName));
    if Check then
        ImageList1.GetBitmap(1, Btn.Glyph)
    else
        ImageList1.GetBitmap(0, Btn.Glyph);
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
procedure TFrmMain.Instruction1MscommTmrTimer(Sender: TObject);
//var

    //i : Integer ;
    //ReceiveByte : array of Byte ;
    //ReceiveByteCount : Integer ;
begin
    Instruction1MscommTmr.Enabled := False ;

    case Instruction1MscommState of
        CntInstruction1MscommIdle :    //����
        begin
            WtInstrument1MscommOutputBuf();    //дͨѶ����Buf
        end;

        CntInstruction1MscommWaitPly :    //�ȴ��ظ�
        begin
            Instruction1MscommLong := Instruction1MscommLong +20;    //ͨѶ��ʱ
        end;

        CntInstruction1MscommReceiving :    //������
        begin
            Instruction1MscommLong := Instruction1MscommLong + 20;    //ͨѶ��ʱ��ʱ��
        end;

    end;

    if (Instruction1MscommLong > 500) and (Instruction1MscommState <> CntInstruction1MscommIdle) then    //ͨѶ��ʱ
    begin
        if Instru1MscommFails < 10 then inc(Instru1MscommFails);

        if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
        begin
            Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
            Instruction1SendBufRdPtInc();
        end;
        Instruction1MscommState := CntInstruction1MscommIdle;    //ͨѶ״̬
        //sStatusBar1.Panels[2].Text := '״̬�� ����!';
    end
    else
    begin
        //sStatusBar1.Panels[2].Text := '״̬�� ����!';
    end;

    Instruction1MscommTmr.Enabled := True ;
end;

procedure TFrmMain.WtInstrument1MscommOutputBuf();    //дͨѶ����Buf
var
    SendBinaryData : array of byte ;
    i : integer;
begin
    if (Instruction1SendBuf[Instruction1SendBufRdPt].Active) and
       ((SoftRunState = CntSoftIniInstrumentState) or (Instruction1MscommCommandType <> CntInstruction1MscommRandCmd))
      then    //���ͻ������ǿ�
    begin
        SetLength(SendBinaryData, Instruction1SendBuf[Instruction1SendBufRdPt].SendByteCounter);
        for i:=0 to Instruction1SendBuf[Instruction1SendBufRdPt].SendByteCounter -1 do
        begin
            SendBinaryData[i] := Instruction1SendBuf[Instruction1SendBufRdPt].SendByte[i];
        end;
        
        if Instruction1MscommOpen then
        begin
            Instruction1MSComm.InBufferCount := 0;       //��ս��ջ�����
            //Instruction1MSComm.OutBufferCount := 0;      //��շ��ͻ�����
            Instruction1MSComm.RThreshold := 5;

            Instruction1MSComm.Output := SendBinaryData;
        end;

        Instruction1MscommLong := 0;    //����ͨѶ��ʱ��
        Instruction1ReceiveBytePt := 0;
        Instruction1ReceivePt := Instruction1SendBufRdPt ;
        Instruction1MscommState := CntInstruction1MscommWaitPly ;
        Instruction1MscommCommandType := CntInstruction1MscommRandCmd;
    end
    else
    begin
        if ( SoftRunState = CntSoftRuningState ) then
        begin
            SetLength(SendBinaryData, 8);

            LoopMscomCommandPt := LoopMscomCommandPt +1;
            if LoopMscomCommandPt >= CntLoopMscomCommandCount then LoopMscomCommandPt := 0;

            for i:=0 to 7 do
            begin
                SendBinaryData[i] := LoopMscommCommand[LoopMscomCommandPt][i];
            end;

            {SendBinaryData[0] := $0A;    SendBinaryData[1] := $03;
            SendBinaryData[2] := $00;    SendBinaryData[3] := $00;
            SendBinaryData[4] := $00;    SendBinaryData[5] := $30;
            ModbusCRCCheck(SendBinaryData, 6) ;  }

            if Instruction1MscommOpen then
            begin
                Instruction1MSComm.InBufferCount := 0;       //��ս��ջ�����
                //Instruction1MSComm.OutBufferCount := 0;      //��շ��ͻ�����
                Instruction1MSComm.RThreshold := 5;

                Instruction1MSComm.Output := SendBinaryData;
            end;

            Instruction1MscommLong        := 0;    //����ͨѶ��ʱ��
            Instruction1ReceiveBytePt     := 0;
            Instruction1ReceivePt         := Instruction1SendBufRdPt ;
            Instruction1MscommCommandType := CntInstruction1MscommLoopCmd;
            Instruction1MscommState       := CntInstruction1MscommWaitPly ;   
        end
        else
        begin

            Instruction1MscommState := CntInstruction1MscommIdle ;
        end;
    end;
end;

procedure TFrmMain.Instruction1MscommReceiveProg();    //ͨѶ���մ�;
var
    HiCRCByte ,
    LoCRCByte : Byte ;
    i : integer ;
begin
    {CRCУ��}
    if (Instruction1ReceiveBytePt >= 4) and (Instruction1ReceiveBytePt < CntInstruction1ReceiveByteLen ) then     //��Ч�Ľ�������
    begin
        HiCRCByte := Instruction1ReceiveByte[Instruction1ReceiveBytePt -1 -1];
        LoCRCByte := Instruction1ReceiveByte[Instruction1ReceiveBytePt -1];
        ModbusCRCCheck(Instruction1ReceiveByte, Instruction1ReceiveBytePt-2);
        if (HiCRCByte = Instruction1ReceiveByte[Instruction1ReceiveBytePt -1 -1]) and (LoCRCByte = Instruction1ReceiveByte[Instruction1ReceiveBytePt -1]) then    //У��ɹ�
        begin
            case Instruction1MscommCommandType of    //ͨѶ��������
                CntInstruction1MscommLoopCmd :    //ѭ������
                begin
                    case LoopMscomCommandPt of
                        0:    //��ʼ��ַ=$0000
                        begin
                            //��ֵ����״̬
                            for i:=1 to WeigherCount do
                            begin
                                if 3+ (i-1) *2 +1 >= Instruction1ReceiveBytePt -1 -1 then break;
                                WeigherValueI[i] := Instruction1ReceiveByte[3+ (i-1) *2] *256 + Instruction1ReceiveByte[3+ (i-1) *2 +1];
                                WeigherStateInInstru[i] := Instruction1ReceiveByte[3+ $0010*2 + (i-1) *2] *256 + Instruction1ReceiveByte[3+ $0010*2 + (i-1) *2 +1];
                            end;

                            //�����״̬
                            if (Instruction1ReceiveBytePt -1 -1) >= $0020 *2 +1 then
                                MixerStateInInstru := Instruction1ReceiveByte[3+ $0020 *2] *256 + Instruction1ReceiveByte[3+ $0020 *2 +1];

                            //�����м��״̬
                            AggrMidHopperStateInInstru := Instruction1ReceiveByte[3+ $0021 *2] *256 + Instruction1ReceiveByte[3+ $0021 *2 +1];
                            //��λ������״̬
                            InstrumentState := Instruction1ReceiveByte[3+ $0024 *2] *256 + Instruction1ReceiveByte[3+ $0024 *2 +1];
                            WgherLoadEnableInInstrument := Instruction1ReceiveByte[3+ $0025 *2] *256 + Instruction1ReceiveByte[3+ $0025 *2 +1];
                            //бƤ��״̬
                            if (Instruction1ReceiveBytePt -1 -1) >= $002D *2 + 1 then
                                ConveryBeltStateInInstru := Instruction1ReceiveByte[3+ $002D *2] *256 + Instruction1ReceiveByte[3+ $002D *2 +1];

                            {Label99.Caption := '';
                            Label67.Caption := '';
                            Label31.Caption := '';
                            for i:= $00 to $0F do
                            begin
                                Label99.Caption := Label99.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $00) *2] *256 + Instruction1ReceiveByte[3+ (i + $00) *2 +1], 4 ) + ' ';
                                Label67.Caption := Label67.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $10) *2] *256 + Instruction1ReceiveByte[3+ (i + $10) *2 +1], 4 ) + ' ';
                                Label31.Caption := Label31.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $20) *2] *256 + Instruction1ReceiveByte[3+ (i + $20) *2 +1], 4 ) + ' ';
                            end;    //}
                        end;

                        1:    //��ʼ��ַ=$0030
                        begin
                            for i:=1 to WeigherCount do
                            begin
                                WeigherLoadCounterInInstu[i] := Instruction1ReceiveByte[3+ (i-1) *2] *256 + Instruction1ReceiveByte[3+ (i-1) *2 +1];
                            end;
                            //�������������������
                            MixerProdCounterInInstru  := Instruction1ReceiveByte[3+ ($0040-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0040-$0030) *2 +1];    //0040H
                            //0041H ����������ʱ��
                            MixerMixingTmrInInstu := Instruction1ReceiveByte[3+ ($0041-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0041-$0030) *2 +1];
                            //0042H �����ж�ϼ�ʱ��
                            MixerDschTmrInInstru  := Instruction1ReceiveByte[3+ ($0042-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0042-$0030) *2 +1];
                            //�м����������������
                            AggrLoadCounterInInstru   := Instruction1ReceiveByte[3+ ($0043-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0043-$0030) *2 +1];    //0043H
                            //��λ���еĹ������ͼ�ʱ�� ��������бƤ�����ͳ���ʱ�� / �����������ӳ�ʱ��
                            AggrConveyTmrInInstrument := Instruction1ReceiveByte[3+ ($0044-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0044-$0030) *2 +1];      //0044H
                            //��λ���й����м��Ͷ��ʱ���ʱ��
                            AggrMidBinDschTmrInInstru := Instruction1ReceiveByte[3+ ($0045-$0030) *2] *256 + Instruction1ReceiveByte[3+ ($0045-$0030) *2 +1];      //0045H

                            {Label32.Caption := '';
                            Label33.Caption := '';
                            Label34.Caption := '';

                            for i:=0 to $0F do
                            begin
                                Label32.Caption := Label32.Caption + inttohex(Instruction1ReceiveByte[3+ i *2] *256 + Instruction1ReceiveByte[3+ i *2 +1], 4 ) + ' ';
                                Label33.Caption := Label33.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $10) *2] *256 + Instruction1ReceiveByte[3+ (i + $10) *2 +1], 4 ) + ' ';
                                Label34.Caption := Label34.Caption + inttohex(Instruction1ReceiveByte[3+ (i + $20) *2] *256 + Instruction1ReceiveByte[3+ (i + $20) *2 +1], 4 ) + ' ';
                            end;    //}
                        end;

                        2:    //��ʼ��ַ=$070F
                        begin
                            AutoRingState := Instruction1ReceiveByte[3+ $01 *2] *256 + Instruction1ReceiveByte[3+ $01 *2 +1];

                            {Label36.Caption := '';
                            for i:= 0 to $0B do
                            begin
                                Label36.Caption := Label36.Caption + inttohex(Instruction1ReceiveByte[3+ i *2] *256 + Instruction1ReceiveByte[3+ i *2 +1], 4 ) + ' ';
                            end;    //}
                        end;
                    end;
                end;

                CntInstruction1MscommRandCmd :    //�������
                begin
                    case Instruction1ReceiveByte[0] of

                        $0A :
                        begin
                            Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveCmd := Instruction1ReceiveByte[1] ;    //�������

                            //if ((Instruction1ReceiveByte[2] = $07) and (Instruction1ReceiveByte[3] = $92)) then
                              //Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveCmd := Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveCmd or $80;
                            //  Showmessage('�޲�');

                            for i:=0 to Instruction1ReceiveByte[2] -1 do
                            begin
                                if i >= CntInstruction1MscommBufLen then break;
                                Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveByte[i] := Instruction1ReceiveByte[3 +i];    //����
                            end;
                            Instruction1ReceiveBuf[Instruction1ReceivePt].ReceiveByteCount := Instruction1ReceiveByte[2];    //�ֽ�����

                            //if not ( (Instruction1ReceiveByte[2] = $0A) and (Instruction1ReceiveByte[3] = $40) ) then
                            Instruction1ReceiveBuf[Instruction1ReceivePt].Active := True ;
                        end;
                    end;
                end;
            end;

            if Instru1MscommFails > 0 then dec(Instru1MscommFails);
        end
        else    //CRCУ��ʧ��
        begin
            if Instru1MscommFails < 10 then Inc(Instru1MscommFails);
        end;
    end
    else
    begin    //��Ч�Ľ�������
        if Instru1MscommFails < 10 then inc(Instru1MscommFails);
    end;
end;

procedure TFrmMain.Instruction1MSCommComm(Sender: TObject);
var
    ReceiveByte : array of byte ;
    ReceiveByteCount : Integer ;
    RemainReceiveByteCount : Integer ;
    ReceiveDataByteCount : Integer;
    ReceiveByteCountPlan : Integer;
    i : integer;
begin
    ReceiveByteCount := Instruction1MSComm.InBufferCount;
    if ReceiveByteCount > 0 then
    begin
        ReceiveByte := Instruction1MSComm.Input;
        
        for i:=0 to ReceiveByteCount -1 do
        begin
            Instruction1ReceiveByte[Instruction1ReceiveBytePt] := ReceiveByte[i];
            Instruction1ReceiveBytePt := Instruction1ReceiveBytePt +1;
            if Instruction1ReceiveBytePt >= CntInstruction1ReceiveByteLen then Instruction1ReceiveBytePt := 0;
        end;

        case Instruction1MscommState of
            CntInstruction1MscommWaitPly :
            begin
                case ReceiveByte[1] of    //ͨѶ��������
                    $03 :
                    begin
                        ReceiveDataByteCount := ReceiveByte[2] ;
                        ReceiveByteCountPlan := 3 + ReceiveDataByteCount + 2;
                        RemainReceiveByteCount := ReceiveByteCountPlan - ReceiveByteCount ;
                        if RemainReceiveByteCount <= 0 then
                        begin
                            if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                            begin
                                Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                                Instruction1SendBufRdPtInc();
                            end;
                            Instruction1MscommReceiveProg();    //ͨѶ���մ���
                            Instruction1MscommState := CntInstruction1MscommIdle;    //ͨѶ״̬����
                        end
                        else
                        begin
                            Instruction1MSComm.RThreshold := RemainReceiveByteCount ;
                            Instruction1MscommState := CntInstruction1MscommReceiving ;
                        end;
                    end;

                    $06 :
                    begin
                        ReceiveByteCountPlan := 8 ;    //������ֽ���
                        RemainReceiveByteCount := ReceiveByteCountPlan - ReceiveByteCount ;
                        if RemainReceiveByteCount <= 0 then
                        begin
                            if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                            begin
                                Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                                Instruction1SendBufRdPtInc();
                            end;
                            Instruction1MscommReceiveProg();    //ͨѶ���մ���
                            Instruction1MscommState := CntInstruction1MscommIdle;    //ͨѶ״̬����
                        end
                        else
                        begin
                            Instruction1MSComm.RThreshold := RemainReceiveByteCount ;
                            Instruction1MscommState := CntInstruction1MscommReceiving ;
                        end;
                    end;

                    $10 :
                    begin
                        ReceiveByteCountPlan := 8 ;    //������ֽ���
                        RemainReceiveByteCount := ReceiveByteCountPlan - ReceiveByteCount ;
                        if RemainReceiveByteCount <= 0 then
                        begin
                            if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                            begin
                                Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                                Instruction1SendBufRdPtInc();
                            end;
                            Instruction1MscommReceiveProg();    //ͨѶ���մ���
                            Instruction1MscommState := CntInstruction1MscommIdle;    //ͨѶ״̬����
                        end
                        else
                        begin
                            Instruction1MSComm.RThreshold := RemainReceiveByteCount ;
                            Instruction1MscommState := CntInstruction1MscommReceiving ;
                        end;
                    end;

                    $83 ,
                    $86 ,
                    $90 :
                    begin
                        ReceiveByteCountPlan := 8 ;    //������ֽ���
                        RemainReceiveByteCount := ReceiveByteCountPlan - ReceiveByteCount ;
                        if RemainReceiveByteCount <= 0 then
                        begin
                            if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                            begin
                                Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                                Instruction1SendBufRdPtInc();
                            end;
                            Instruction1MscommReceiveProg();    //ͨѶ���մ���
                            Instruction1MscommState := CntInstruction1MscommIdle;    //ͨѶ״̬����
                        end
                        else
                        begin
                            Instruction1MSComm.RThreshold := RemainReceiveByteCount ;
                            Instruction1MscommState := CntInstruction1MscommReceiving ;
                        end;
                    end;
                end;
            end;

            CntInstruction1MscommReceiving :
            begin
                if Instruction1MscommCommandType = CntInstruction1MscommRandCmd then
                begin
                    Instruction1SendBuf[Instruction1SendBufRdPt].Active := False;
                    Instruction1SendBufRdPtInc();
                end;
                Instruction1MscommReceiveProg();    //ͨѶ���մ���
                Instruction1MscommState := CntInstruction1MscommIdle;;    //ͨѶ״̬����
            end;
        end;
    end;
end;

procedure TFrmMain.ImgMixerContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
    Showmessage('Mixer') ;
end;

procedure TFrmMain.NWeigheStartClick(Sender: TObject);
Var
    MscommReceiveBufPf : Integer;
begin
    WtAWordToInstument1MscommBuf(MscommReceiveBufPf, $0200, $0020 + PMWeigherId -1);              //дһ���ֵ�ͨѶ������
end;

procedure TFrmMain.NWeigherStopClick(Sender: TObject);
Var
    MscommReceiveBufPf : Integer;
begin
    WtAWordToInstument1MscommBuf(MscommReceiveBufPf, $0200, $0030 + PMWeigherId -1);              //дһ���ֵ�ͨѶ������
end;

procedure TFrmMain.NWeigherrDschRemainClick(Sender: TObject);
Var
    MscommReceiveBufPf : Integer;
begin
    if not FrmWeigDschRemainCrt then
    begin
        FrmWeigDschRemain := TFrmWeigDschRemain.Create(Nil);
        FrmWeigDschRemainCrt := True;
    end;
    FrmWeigDschRemain.ShowModal ;
end;

procedure TFrmMain.NWeigherCalZeroClick(Sender: TObject);
Var
    DataValue : array[0..1] of Integer;
begin
    if messagebox(getfocus, pchar('ȷ��ҪУ�����'), 'ϵͳѯ��', MB_YESNO) = idYes then
    begin
        DataValue[0] := PmWeigherId -1;
        DataValue[1] := 0;
        MscommStateInFrmMain := CntMscommCmdIsCalZero ;    //ͨѶ������У��
        MscommTmrInFrmMain := 0;
        WtWordSToInstucment1MscommBuf(MscommReceiveBufPfInFrmMain, $0202, DataValue, 2); //д�������ͨѶ������
        TmrMscomStateDsp.Enabled := True;
    end;
end;

procedure TFrmMain.NWeigherCalClick(Sender: TObject);
begin
    if not FrmWeigherCalValueCrt then
    begin
        FrmWeigherCalValue := TFrmWeigherCalValue.Create(Nil);
        FrmWeigherCalValueCrt := True;
    end;
    FrmWeigherCalValue.Caption := WeigherInfo[PmWeigherId].Name + '��ֵУ׼' ;
    FrmWeigherCalValue.ShowModal;
end;

procedure TFrmMain.NWeigherParaSetClick(Sender: TObject);
begin
    if not FrmWeigAttrCrt then
    begin
        FrmWeigherAttribute := TFrmWeigherAttribute.Create(Nil);
        FrmWeigAttrCrt := True;
    end;
    FrmWeigherAttribute.ShowModal ;
end;

procedure TFrmMain.RMAddMaterClick(Sender: TObject);
begin
    Showmessage(StorageInfo[PMStorageId].Name + '����');
end;

procedure TFrmMain.RMStorageReplaceClick(Sender: TObject);
begin
    Showmessage(StorageInfo[PMStorageId].Name + '����');
end;

procedure TFrmMain.RMStorageSetClick(Sender: TObject);
begin
    //Showmessage(StorageInfo[PMStorageId].Name + '����');
    if not FrmStorageAttributeCrt then
    begin
        FrmStorageAttribute    := TFrmStorageAttribute.Create(Nil);
        FrmStorageAttributeCrt := True;
    end;
    FrmStorageAttribute.ShowModal;
end;

procedure TFrmMain.j1Click(Sender: TObject);
begin
    if not FrmBasicSettingCrt then
    begin
        FrmBasicSetting := TFrmBasicSetting.Create(Nil);
        FrmBasicSettingCrt := True;
    end;
    FrmBasicSetting.Show;
end;

procedure TFrmMain.NRecipeClick(Sender: TObject);
begin
    if not FrmRecipeCrt then
    begin
         FrmRecipe := TFrmRecipe.Create(Self);
         FrmRecipeCrt := True;
    end;
    FrmRecipe.Show;
end;

procedure TFrmMain.NProdTaskClick(Sender: TObject);
begin
    if Not FrmTaskCrt then
    begin
        FrmTask := TFrmTask.Create(Nil);
        FrmTaskCrt := True;
    end;
    FrmTask.Show;
end;

procedure TFrmMain.AdvStrGdProdNoticeClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
    ExResult : Integer;
begin
    //�ǹ���״̬
    //if ( InstrumentState and $0030 <> $0030 ) then
    if ( InstrumentState and (1 shl 5) ) or ( InstrumentState and (1 shl 4) ) = 0 then 
    begin
        if (ACol=1) and (ARow>0) then
        begin
            AdvStrGdProdNotice.ClearCols(1,1);
            AdvStrGdProdNotice.AddDataImage(1, ARow, 0, haLeft, vaTop);    //��ʶ���ɳ�����ѡ��

            {��ʾ������Ϣ}
            DspNoticeInfo(ARow);

            ProdNoticeInfoRdPt := 1;             //�����ɳ�����Ϣ��ָ��
            ProdNoticeInfoWtPt := 1;             //�����ɳ�����Ϣдָ��

            {������Ϣ��ʼ��}
            IniProdNoticeInfo(ProdNoticeInfoWtPt);

            {��������Ϣ��ʼ��}
            IniWeigherLoadInfoForProdStart();

            {����ֵ��Ϣ��ʼ��}
            IniSiloLoadInfo();

            {��ʾ������Ϣ}
            DspNoticeInfo( ARow );

            {��ֵ������Ϣ}
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_Code := Trim(AdvStrGdProdNotice.cells[3, ARow]) ;
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID := StrToInt(Trim(AdvStrGdProdNotice.cells[2, ARow]));

            {��ȡ��ȣ����͵���Ӧ���ϲ�}
            ExResult := GetProdRecipeToSiloRecipe( ARow );

             {�������}
            if ExResult = 0 then
            begin
                ExResult := TaskBatchsProg( ARow );
            end;

            {����Ŀ��ֵ}
            if ExResult = 0 then
            begin
                ExResult := GetStorageLoadTargetForProdStart();    //��������ʱ��ȡ�ϲֵ�����Ŀ��ֵ
            end;

            {������Ϣ��ʾ}
            DspProdBatchInfoOnFrmMain(ProdNoticeInfoWtPt) ;
        end;
    end;
end;

procedure TFrmMain.DspNoticeInfo(NoticeTabRow : Integer);
var
    NOticeFlowID : String;
begin
    NOticeFlowID := Trim(AdvStrGdProdNotice.cells[0, NoticeTabRow]);

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select'
                        + ' ' + 'A1.ProdRecCode as ProdRecCode'
                        + ',' + 'A1.ProdTaskCode as ProdTaskCode'
                        + ',' + 'A1.Driver as ProdDriver'
                        + ',' + 'A1.ProdTruckCode as ProdTruckCode'
                        + ',' + 'A1.ProdAmount as ProdAmount'
                        + ',' + 'A2.Customer as ProjCustomer'
                        + ',' + 'A2.ProjNm as ProjNm'
                        + ',' + 'A2.CastPart as ProjCastPart'
                        + ',' + 'A2.PlanAmount as ProjPlanAmount'
                        + ',' + 'A2.TolAmount as ProjTolAmount'
                        + ',' + 'A2.TolVehs as ProjTolVehs'
                        + ' ' + 'from'
                        + ' ' + '(ProdNotice A1 LEFT JOIN ProdTask A2 on A1.ProdTaskCode = A2.Code)'
                        + ' ' + 'where A1.ID =' + NOticeFlowID;
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        LbClentInNoticeInfo.Caption    := ADOQuery1.FieldByName('ProjCustomer').AsString;
        LbProdReciInNoticeInfo.Caption := ADOQuery1.FieldByName('ProdRecCode').AsString;
        LbProjInfoInNOticeInfo.Caption := ADOQuery1.FieldByName('ProjNm').AsString
                                        + '/'
                                        + ADOQuery1.FieldByName('ProjCastPart').AsString;
        sCmbBxTruckCodeInNoticeInfo.Text
                                       := ADOQuery1.FieldByName('ProdTruckCode').AsString;
        sCmbBxDriverInNoticeInfo.Text  := ADOQuery1.FieldByName('ProdDriver').AsString;
        LbProdAmountInNoticeInfo.Caption
                                       := ADOQuery1.FieldByName('ProdAmount').AsString;
        LbPlanAmountInNoticeInfo.Caption
                                       := ADOQuery1.FieldByName('ProjPlanAmount').AsString;
        LbTotalAmountInNoticeInfo.Caption
                                       := ADOQuery1.FieldByName('ProjTolAmount').AsString;
        LbTruckContInNoticeInfo.Caption:= ADOQuery1.FieldByName('ProjTolVehs').AsString;
    end;

end;

procedure TFrmMain.AdvStrGdProdNoticeCanClickCell(Sender: TObject; ARow,
  ACol: Integer; var Allow: Boolean);
begin
    if ARow >= 1 then
    begin
        sBtnProdNotice.Caption := '�ɳ��޸�';
    end
    else
    begin
        AdvStrGdProdNotice.Row := AdvStrGdProdNotice.RowCount -1;
        sBtnProdNotice.Caption := '�����ɳ�';
    end;
end;

procedure TFrmMain.sBtnProdNoticeClick(Sender: TObject);
begin
    FrmProdNotice.ShowModal ;
end;

procedure TFrmMain.DspProdNoticeFromDb();
var
    RdCount : Integer;
    RowPt : Integer;
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select A1.ID as FlowID'
                        + ', A1.ProdTaskCode as ProdTaskCode'
                        + ', A1.ProdRecCode as ProdRecCode'
                        + ', A1.ProdTruckCode as TruckCode'
                        + ', A1.ProdAmount as ProdAmount'
                        + ', A2.Customer as Customer'
                        + ', A2.ProjNm as ProjNm'
                        + ', A2.CastPart as CastPart'
                        + ', A2.ConcrStrength as ConcrStrength'
                        + ', A2.ConcrSlump as ConcrSlump'
                        + ', A2.ConcrSeepage as ConcrSeepage'
                        + ', A2.TecReq as TecReq'
                        + ' ' + 'from (ProdNotice A1 LEFT JOIN ProdTask A2 on A1.ProdTaskCode = A2.Code) order by A1.ID';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        RdCount := ADOQuery1.RecordCount;
        RdCount := RdCount + 1;

        RowPt := 1;
        while not ADOQuery1.Eof do
        begin
            AdvStrGdProdNotice.cells[0, RowPt] := ADOQuery1.FieldByName('FlowID').AsString;
            AdvStrGdProdNotice.cells[2, RowPt] := ADOQuery1.FieldByName('FlowID').AsString;    //'��ˮ��';
            AdvStrGdProdNotice.cells[3, RowPt] := ADOQuery1.FieldByName('ProdTaskCode').AsString;    //���񵥱��';
            AdvStrGdProdNotice.cells[4, RowPt] := ADOQuery1.FieldByName('ProdRecCode').AsString;  //'�������';
            AdvStrGdProdNotice.cells[5, RowPt] := ADOQuery1.FieldByName('TruckCode').AsString;       //'���ͳ���';
            AdvStrGdProdNotice.cells[6, RowPt] := ADOQuery1.FieldByName('ProdAmount').AsString;     //'����';
            AdvStrGdProdNotice.cells[7, RowPt] := ADOQuery1.FieldByName('Customer').AsString 
                                                          + '/' + ADOQuery1.FieldByName('ProjNm').AsString 
                                                          + '/' + ADOQuery1.FieldByName('CastPart').AsString ;    //'������Ϣ';    //�ͻ�����  ��������  ������λ
            AdvStrGdProdNotice.cells[8, RowPt] := ADOQuery1.FieldByName('ConcrStrength').AsString
                                          + '/' + ADOQuery1.FieldByName('ConcrSlump').AsString
                                          + '/' + ADOQuery1.FieldByName('ConcrSeepage').AsString
                                          + '/' + ADOQuery1.FieldByName('TecReq').AsString;    //(ǿ�ȵȼ�  ̮���  �����ȼ�  ����Ҫ�� )
            RowPt := RowPt +1;
            ADOQuery1.Next;
        end;

    end
    else
    begin
        RdCount := 1;
    end;

    AdvStrGdProdNotice.RowCount := RdCount +1;
    AdvStrGdProdNotice.RowHeights[RdCount] := 0;
end;

procedure TFrmMain.StatusDspTmrTimer(Sender: TObject);
var
    i, k : Integer;
    WeigDecimal : Integer;
    StateTest : Integer;

    WgrLoadEnable : Integer;
    DspSiloId : Integer;

    SiloWtLoadPt : Integer;
    LdTargetSiloId : Integer;
    LoadValueI : Integer;
    LoadValueF : Double;

    LdInfoNodeRow : Integer;
    SiloLdTgeRdPt : Integer;
    LdErr : Double;
    PermisErr : Double;
    
    ProdRow : Integer;

    LdSiloCountFowWgr : Integer;
begin
    StatusDspTmr.Enabled := False;

    //ͨѶ״̬��ʾ
    if Instruction1MscommOpen then
    begin
        if Instru1MscommFails >= 8 then
        begin
            if Instru1MscommDspState <> Instru1MscomDspIsFault then            //ͨѶ��ʾ״̬Ϊ����
            begin
                sStatusBar1.Panels[2].Text := '����';
                Instru1MscommDspState := Instru1MscomDspIsFault ;
            end;
         end
        else
        begin
            if Instru1MscommDspState <> Instru1MscomDspIsNomarl then            //ͨѶ��ʾ״̬Ϊ����
            begin
                sStatusBar1.Panels[2].Text := '����';
                Instru1MscommDspState := Instru1MscomDspIsNomarl ;
            end;
        end;
    end
    else
    begin
        if Instru1MscommDspState <> Instru1MscomDspIsPortNo then
        begin
            Instru1MscommDspState := Instru1MscomDspIsPortNo ;           //�˿ڲ�����
            FrmMain.sStatusBar1.Panels[2].Text := '��ʧ��';
        end;
    end;

    {��ֵ��ʾ}
    WgrLoadEnable := WgherLoadEnableInInstrument;
    for i:=1 to WeigherCount do
    begin
        if WeigherInfo[i].Enable then
        begin
            {��ֵ��ʾ}
            WeigDecimal := WeigherPara[i][CntWeigherDecimalIndex].Value;
            if WeigherValueI[i] > 32767 then
                WeigherValueLab[i].Caption := Format('%.' + inttostr(WeigDecimal) + 'f',[(WeigherValueI[i] -65536)/ Power(10, WeigDecimal)])
            else
                WeigherValueLab[i].Caption := Format('%.' + inttostr(WeigDecimal) + 'f',[WeigherValueI[i] / Power(10, WeigDecimal)]) ;

            //�����ϼ����� ��ǩ
            if (InstrumentState and ( (1 shl 4) or (1 shl 5) ) <> 0)     //��λ����ͣ״̬ �� ��������״̬ ��
               and
               (WgrLoadEnable and ( 1 shl (i-1) ) <> 0)     //��Ӧ�������Ǳ����趨ֵ
                then
            begin
                if LbWgrLdCounterVisibleState[i] <> CtLbWgrLdCounterVisibleIsTrue then    //�����ϼ�������ǩ�� Visible Ϊ ��True
                begin
                    WeigherLoadConterLab[i].Visible := True;
                    LbWgrLdCounterVisibleState[i] := CtLbWgrLdCounterVisibleIsTrue;
                end;
                WeigherLoadConterLab[i].Caption := IntToStr(WeigherLoadCounterInInstu[i]);
            end
            else
            begin
                if LbWgrLdCounterVisibleState[i] <> CtLbWgrLdCounterVisibleIsFalse then    //�����ϼ�������ǩ�� Visible Ϊ ��False
                begin
                    WeigherLoadConterLab[i].Visible := False;
                    LbWgrLdCounterVisibleState[i] := CtLbWgrLdCounterVisibleIsFalse;
                end;
            end;

            {��״̬��ʾ}
            //�������
            StateTest := $0001;
            for k:=1 to 4 do
            begin
                DspSiloId := WeigherInfo[i].StorageId[k];
                if  DspSiloId > 0 then
                begin
                    if StorageInfo[DspSiloId].DschMode = CntStorageDoubleDsch then    //�ϲ�Ϊ˫������
                    begin
                        if WeigherStateInInstru[i] and StateTest <> 0 then    //�����������Ч
                        begin
                            if StorageFineLoadImgState[DspSiloId] <> CntLoadImgStateIsOpen then     //ͼƬ״̬Ϊ�ǿ�״̬
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsFnLd, CntLoadImgStateIsOpen);
                            end;
                        end
                        else
                        begin
                            if StorageFineLoadImgState[DspSiloId] <> CntLoadImgStateIsClose then     //ͼƬ״̬Ϊ�ǹر�״̬
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsFnLd, CntLoadImgStateIsClose);
                            end;
                        end;
                    end
                    else    //�ϲ�Ϊ��������
                    begin
                        if WeigherStateInInstru[i] and StateTest <> 0 then    //���������Ч
                        begin
                            if StorageLoadImgState[DspSiloId] <> CntLoadImgStateIsOpen then    //������ͼƬΪ�������Ч״̬
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsLd, CntLoadImgStateIsOpen);
                            end;
                        end
                        else
                        begin
                            if StorageLoadImgState[DspSiloId] <> CntLoadImgStateIsClose then
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsLd, CntLoadImgStateIsClose);
                            end;
                        end;
                    end;
                end;
                StateTest := StateTest shl 1;
            end;

            //�ּ������
            StateTest := $1000;
            for k:=1 to 4 do
            begin
                DspSiloId := WeigherInfo[i].StorageId[k];
                if DspSiloId > 0 then
                begin
                    if StorageInfo[DspSiloId].DschMode = CntStorageDoubleDsch then    //�ϲ�Ϊ˫������
                    begin
                        if WeigherStateInInstru[i] and StateTest <> 0 then    //�ּ��������Ч
                        begin
                            if StorageLoadImgState[DspSiloId] <> CntLoadImgStateIsOpen then
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsLd, CntLoadImgStateIsOpen);
                            end;
                        end
                        else
                        begin
                            if StorageLoadImgState[DspSiloId] <> CntLoadImgStateIsClose then
                            begin
                                DspSiloLOadVaveState(DspSiloId, CntSiloLdValveImgIsLd, CntLoadImgStateIsClose);
                            end;
                        end;
                    end;
                end;
                StateTest := StateTest shl 1;
            end;

            //�ϲ�����
            StateTest := $0100 ;
            for k:=1 to 4 do
            begin
                DspSiloId := WeigherInfo[i].StorageId[k];
                if DspSiloId > 0 then    //�ó� �� ��Ӧ���ϲ� ��ʹ��
                begin
                    if StorageInfo[DspSiloId].Vibrator then    //ʹ������
                    begin
                        if WeigherStateInInstru[i] and StateTest <> 0 then
                        begin
                            if StorageVibratorImgState[DspSiloId] <> CntVibraImgStaIsOpen then    //�ϲ����� �� ��״̬
                            begin
                                DSpSiloVibraImgState(DspSiloId, CntVibraImgStaIsOpen);
                            end;
                        end
                        else
                        begin
                            if StorageVibratorImgState[DspSiloId] <> CntVibraImgStaIsClose then    //�ϲ����� �� ��״̬
                            begin
                                DSpSiloVibraImgState(DspSiloId, CntVibraImgStaIsClose);
                            end;
                        end;
                    end;
                end;
                StateTest := StateTest shl 1;
            end;

            //��ж�Ϸ�ͼƬ
            if ( WeigherStateInInstru[i] and $0010 ) <> 0 then
            begin
                if WeigherDischValveImgState[i] <> CntWeigDischValveIsOPen then    //ж�Ϸ�ͼƬ �Ǵ� ״̬
                begin
                    DspWeigherDschValveState(i, CntWeigDischValveIsOPen);
                end;
            end
            else
            begin
                if WeigherDischValveImgState[i] <> CntWeigDischValveIsClose then   //ж�Ϸ�ͼƬ �ǹر� ״̬
                begin
                    DspWeigherDschValveState(i, CntWeigDischValveIsClose);
                end;
            end;

            //��ж������
            if WeigherInfo[i].DischVibrator then
            begin
                if ( WeigherStateInInstru[i] and $0020 ) <> 0 then
                begin
                    if WeigherDischVibraImgState[i] <> CntVibraImgStaIsOpen then        //��ж������ͼƬ �ǿ� ״̬
                    begin
                        DspWghrDschVibraState(i, CntVibraImgStaIsOpen );
                    end;
                end
                else
                begin
                    if WeigherDischVibraImgState[i] <> CntVibraImgStaIsClose then        //��ж������ͼƬ �ǹر� ״̬
                    begin
                        DspWghrDschVibraState(i, CntVibraImgStaIsClose);
                    end;
                end;
            end;

            //�ƹ�����λ
            if WeigherInfo[i].CloseLmt then
            begin
                if ( WeigherStateInInstru[i] and $0010 ) <> 0 then    //��ж�Ϸ� ��
                begin
                    if ( WeigherStateInInstru[i] and $0080 ) <> 0 then    //������Ч
                    begin
                        if WeigherDischValveCloseLmtImgState[i] <> CntWghrDschValveClsLmtImgIsValidFlash then    //�� ��Ч��˸ ״̬
                        begin
                            DspWghrDschValveCloseLmtImg(i, CntWghrDschValveClsLmtImgIsValidFlash);    //������λͼƬΪ ��Ч��˸ ״̬
                        end;
                    end
                    else
                    begin
                        if WeigherDischValveCloseLmtImgState[i] <> CntWghrDschValveClsLmtImgIsInvalid then    //�� �� ״̬
                        begin
                            DspWghrDschValveCloseLmtImg(i, CntWghrDschValveClsLmtImgIsInvalid);    //������λͼƬΪ �� ״̬
                        end;
                    end;
                end
                else    //��ж�Ϸ� ��
                begin
                    if ( WeigherStateInInstru[i] and $0080 ) <> 0 then    //������Ч
                    begin
                        if WeigherDischValveCloseLmtImgState[i] <> CntWghrDschValveClsLmtImgIsValid then    //����ͼƬ Ϊ ����Ч ״̬
                        begin
                            DspWghrDschValveCloseLmtImg(i, CntWghrDschValveClsLmtImgIsValid);    //���¹���ͼƬ Ϊ ��Ч ״̬
                        end;
                    end
                    else
                    begin
                        if WeigherDischValveCloseLmtImgState[i] <> CntWghrDschValveClsLmtImgIsInvalidFlash then    //����ͼƬ Ϊ ����Ч��˸ ״̬
                        begin
                            DspWghrDschValveCloseLmtImg(i, CntWghrDschValveClsLmtImgIsInvalidFlash);    //���¹���ͼƬ Ϊ ��Ч��˸ ״̬
                        end;
                    end;
                end;
            end;

            if InstrumentState and ( (1 shl 4) or (1 shl 5) ) <> 0 then    //�������л���ͣ��
            begin
                if ( WeigherStateInInstru[i] and $0040 ) <> 0 then    //�������
                begin
                    if not WeigherLoadInfo[i].LoadFactDsp then    //����ֵδ��ʾ
                    begin
                        ReadWordsFromInstrument1( WeigherLoadInfo[i].RdFactWaitPt , $0100 + (i -1) * $08,  $04 );    //�������ϲ���
                        WeigherLoadInfo[i].RdFactLoadEna := True;
                        WeigherLoadInfo[i].LoadFactDsp := True;
                    end
                    else
                    begin
                        if WeigherLoadInfo[i].RdFactLoadEna then
                        begin
                            if Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].Active then
                            begin
                                Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].Active := False;
                                WeigherLoadInfo[i].RdFactLoadEna := False;

                                WeigherLoadInfo[i].RecordBatchCount := WeigherLoadInfo[i].RecordBatchCount + 1;
                                PermisErr := RoundTo(WeigherPara[i][CntWeigherTRGIndex].Value / Power(10, WeigherPara[i][CntWeigherTRGIndex].Decimal) , -WeigherPara[i][CntWeigherTRGIndex].Decimal);

                                for k:=1 to 4 do
                                begin
                                    LdTargetSiloId := WeigherInfo[i].StorageId[k];
                                    //------���������Ǿ�ϻ����һ��𵽸����ã���Ϊÿ���Ƶ��ĸ����϶������ᶼʹ��----
                                    //if ( LdTargetSiloId < 1 ) and ( LdTargetSiloId > CntStorageCount ) then
                                    //begin
                                    //    Showmessage('��Ч�ļ�¼�ϲ�');
                                    //    exit;
                                    //end;
                                    //-----------------�ϻ�ȥ������ 2017.05.10 17:43 ���س�-------------------------
                                    if ( StorageInfo[LdTargetSiloId].Enable ) and (ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLoadEn[LdTargetSiloId] ) then    //�ϲ���ʹ��
                                    begin
                                        LoadValueI := Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].ReceiveByte[(k-1)*2] *256
                                                    + Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].ReceiveByte[(k-1)*2 +1];
                                        LoadValueF := RoundTo(LoadValueI / Power(10, WeigDecimal), -WeigDecimal);

                                        SiloWtLoadPt := SiloLoadInfo[LdTargetSiloId].WtPt;
                                        SiloLoadInfo[LdTargetSiloId].LoadFact[SiloWtLoadPt] := LoadValueF ;

                                        StorageLoadValueLab[LdTargetSiloId].Caption := format('%.' + inttostr(WeigDecimal) + 'f', [LoadValueF]);
                                        StorageLoadValueLab[LdTargetSiloId].Visible := True;

                                        //������Ϣֵд��ʵʱ���������
                                        LdInfoNodeRow := (WeigherLoadInfo[i].RecordBatchCount -1) * (ProdNoticeInfo[ProdNoticeInfoRdPt].LdStorageCounter + 1) +1;
                                        AdvStrGdProRd.ExpandNode(LdInfoNodeRow);
                                        AdvStrGdProRd.AllCells[4, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := format('%.' + inttostr(WeigDecimal) + 'f', [LoadValueF]);

                                        //��ȡ����Ŀ��ֵ
                                        SiloLdTgeRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargRdPt[LdTargetSiloId];
                                        if ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[LdTargetSiloId][SiloLdTgeRdPt].EndBatchNumber > WeigherLoadInfo[i].RecordBatchCount then
                                        begin
                                            SiloLdTgeRdPt := SiloLdTgeRdPt +1;
                                            if SiloLdTgeRdPt > CntProdStorageTargetQueueLen then SiloLdTgeRdPt := 1;
                                            ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargRdPt[LdTargetSiloId] := SiloLdTgeRdPt;
                                        end;
                                        SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt]
                                          := Roundto(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[LdTargetSiloId][SiloLdTgeRdPt].LoadTarget, -WeigDecimal) ;

                                        //�������
                                        if SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt] > 0 then
                                        begin
                                            LdErr := (LoadValueF - SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt]) / SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt] *100;
                                            LdErr := RoundTo(LdErr , -1);
                                        end
                                        else
                                        begin
                                            LdErr := 0;
                                        end;

                                        AdvStrGdProRd.AllCells[5, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := format('%.1f', [LdErr]);

                                        if LdErr < 0 then LdErr := -LdErr;
                                        if PermisErr < LdErr then
                                        begin
                                            if LoadValueF > SiloLoadInfo[LdTargetSiloId].LoadTarget[SiloWtLoadPt] then
                                                SiloLoadInfo[LdTargetSiloId].ErrorIsOver[SiloWtLoadPt] := CntLdErrIsPositive    //������
                                            else
                                                SiloLoadInfo[LdTargetSiloId].ErrorIsOver[SiloWtLoadPt] := CntLdErrIsNegative;    //������


                                            AdvStrGdProRd.FontColors[4, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := clRed;
                                            AdvStrGdProRd.FontColors[5, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := clRed;
                                        end
                                        else
                                        begin
                                            SiloLoadInfo[LdTargetSiloId].ErrorIsOver[SiloWtLoadPt] := CntLdErrIsNone ;    //�޳���
                                        end;

                                        AdvStrGdProRd.AllCells[7, LdInfoNodeRow + ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[LdTargetSiloId]] := '10';

                                        SiloLoadInfo[LdTargetSiloId].Wt2ndPt := SiloWtLoadPt;
                                        SiloWtLoadPt := SiloWtLoadPt + 1;
                                        if SiloWtLoadPt > CntLoadValueQueueLen then SiloWtLoadPt := 1;
                                        SiloLoadInfo[LdTargetSiloId].WtPt := SiloWtLoadPt;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end
                else    //�ر��ϲ���ʾ
                begin
                    if WeigherLoadInfo[i].LoadFactDsp then    //����Ŀ��ֵ����ʾ
                    begin
                        LdSiloCountFowWgr := 0;
                        for k:=1 to 4 do
                        begin
                            LdTargetSiloId := WeigherInfo[i].StorageId[k];
                            if StorageInfo[LdTargetSiloId].Enable then    //�ϲ���ʹ��
                            begin
                                StorageLoadValueLab[LdTargetSiloId].Visible := False;
                                if (ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLoadEn[LdTargetSiloId] ) then
                                begin
                                    WeigherLoadInfo[i].Rd2ndSiloId := LdTargetSiloId;
                                    LdSiloCountFowWgr := LdSiloCountFowWgr +1;
                                end;
                            end;
                        end;
                        WeigherLoadInfo[i].LoadFactDsp := False;

                        LdTargetSiloId := WeigherLoadInfo[i].Rd2ndSiloId;
                        if (LdSiloCountFowWgr = 1)    //�����ϲ�ֻ��1��
                          and ( SiloLoadInfo[LdTargetSiloId].ErrorIsOver[SiloLoadInfo[LdTargetSiloId].Wt2ndPt] = CntLdErrIsPositive)    //������
                          and (WeigherPara[i][CntWeigherUDCIndex].Value =1)    //����۳�
                          then
                        begin
                            //��ȡ�۳�ֵ
                            ReadWordsFromInstrument1( WeigherLoadInfo[i].RdFactWaitPt , $0103 + (i -1) * $08,  $01 );    //�������ϲ���
                            //�ñ�־λ
                            WeigherLoadInfo[i].Rd2ndLoadEna := True;
                        end
                        else
                        begin
                            WeigherLoadInfo[i].Rd2ndLoadEna := False;
                        end;
                    end;

                    //�ȴ��۳�ֵ�ظ�
                    if WeigherLoadInfo[i].Rd2ndLoadEna then
                    begin
                        if Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].Active then
                        begin
                            Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].Active := False;
                            WeigherLoadInfo[i].Rd2ndLoadEna := False;

                            LoadValueI := Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].ReceiveByte[0] *256
                                        + Instruction1ReceiveBuf[WeigherLoadInfo[i].RdFactWaitPt].ReceiveByte[1];
                            LoadValueF := RoundTo(LoadValueI / Power(10, WeigDecimal), -WeigDecimal);

                            if LoadValueF <> 0 then    //��ֹ��Ϊ���ʱ������������Ŀ۳�ֵ
                            begin
                                SiloWtLoadPt := SiloLoadInfo[WeigherLoadInfo[i].Rd2ndSiloId].Wt2ndPt;
                                SiloLoadInfo[WeigherLoadInfo[i].Rd2ndSiloId].LoadFact[SiloWtLoadPt] := LoadValueF ;
                            end;

                            //Showmessage('�ֺţ�' + IntToStr(WeigherLoadInfo[i].Rd2ndSiloId) + '- ��¼���кţ�' + inttostr(SiloWtLoadPt) + '-�۳�ֵ��' + FloatTostr( LoadValueF) );

                        end;
                    end;
                end;
            end;
        end;
    end;

    //--------------------------------------------------------------------------

    {ƽƤ��״̬��ʾ}
    //ƽƤ���ֶ�λ1#���������豸
    if AggregateConveyorEquipInfo[1].Use then
    begin
        //ƽƤ�����
        if not AggregateConveyorEquipInfo[1].ContinueRun then
        begin
            if AggrMidHopperStateInInstru and (1 shl 7) <> 0 then
            begin
                if AggrConvEquipBtnState[1] <> CtAggrConvEquipBtnIsValid then    //���������豸��ť״̬ Ϊ ����Ч
                begin
                    DSPAggrConvEquipBtnImgNewState(1, CtAggrConvEquipBtnIsValid);
                end;
            end
            else
            begin
                if AggrConvEquipBtnState[1] <> CtAggrConvEquipBtnIsInvalid then    //���������豸��ť״̬ Ϊ ����Ч
                begin
                    DSPAggrConvEquipBtnImgNewState(1, CtAggrConvEquipBtnIsInvalid);
                end;
            end;
        end;
        //ƽƤ������
        if  ( not AggregateConveyorEquipInfo[1].RunLmtCheck ) and ( AggrMidHopperStateInInstru and (1 shl 7) <> 0 ) then //�� ��λ ���м�� = ���������� ��ƽƤ�� ����ź� ��Ч
        begin
            if ( (WeigherStateInInstru[1] or WeigherStateInInstru[2] or WeigherStateInInstru[3] or WeigherStateInInstru[4] or WeigherStateInInstru[5] or WeigherStateInInstru[6]) and (1 shl 4) <> 0 ) then
            begin
                //AggrConvEquipFlashTmr[1]   := AggrConvEquipFlashTmr[1] + AppFlashTmrInval;
                //if AggrConvEquipFlashTmr[1] >= 500 then
                begin
                    AggrConvEquipFlashTmr[1] := 0;
                    AggrConvEquipFlashSta[1] := CntBeltFlashStaIsFullRun;     //Ƥ������״̬ ������ת

                    case AggrConvEquipFlashFrame[1] of
                        1 :
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp2.bmp');
                            AggrConvEquipFlashFrame[1] := 2;
                        end;
                        2 :
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp3.bmp');
                            AggrConvEquipFlashFrame[1] := 3;
                        end;
                        else
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp4.bmp');
                            AggrConvEquipFlashFrame[1] := 1;
                        end;
                    end;
                end;
            end
            else
            begin
                AggrConvEquipFlashTmr[1]   := AggrConvEquipFlashTmr[1] + AppFlashTmrInval;
                if AggrConvEquipFlashTmr[1] >= 500 then
                begin
                    if AggrConvEquipFlashSta[1] <> CntBeltFlashStaIsEmptyRun then
                    begin
                        AggrConvEquipFlashSta[1] := CntBeltFlashStaIsEmptyRun;     //Ƥ������״̬ ����ת
                        ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrpEmptyRun.gif');
                    end;
{                    AggrConvEquipFlashTmr[1] := 0;
                    AggrConvEquipFlashSta[1] := CntBeltFlashStaIsEmptyRun;     //Ƥ������״̬ ����ת

                    case AggrConvEquipFlashFrame[1] of
                        1:
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp1.bmp');
                            AggrConvEquipFlashFrame[1] := 2;
                        end;
                        else
                        begin
                            ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp0.bmp');
                            AggrConvEquipFlashFrame[1] := 1;
                        end;
                    end;}


                end;
            end;
        end
        else
        begin
            if AggrConvEquipFlashSta[1] <> CntBeltFlashStaIsEmptyStop then     //Ƥ������״̬ ��ֹͣ
            begin
                ImgAggregateConveyor[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\HorStrp0.bmp');
                AggrConvEquipFlashSta[1] := CntBeltFlashStaIsEmptyStop ;    //Ƥ������״̬ ��ֹͣ
            end;
        end;
    end;

    {бƤ������}
    //2#�豸Ϊ��бƤ��
    if AggregateConveyorMode = CntAggregateConveyorBelt then    //�������ͷ�ʽ = бƤ��
    begin
        if AggregateConveyorEquipInfo[2].Use then    //��бƤ��ʹ��
        begin
            if AggregateConveyorEquipInfo[2].RunLmtCheck and (AggrMidHopperStateInInstru and (1 shl 2) <> 0) then    //бƤ����ת
            begin
                if ( (WeigherStateInInstru[1] or WeigherStateInInstru[2] or WeigherStateInInstru[3] or WeigherStateInInstru[4] or WeigherStateInInstru[5] or WeigherStateInInstru[6]) and (1 shl 4) <> 0 )    //���ϳ�ж��
                  or (AggrMidHopperStateInInstru and (1 shl 8) <> 0)        //�����м��װ����
                  then
                begin //бƤ����������
                    AggrConvEquipFlashTmr[2] := AggrConvEquipFlashTmr[2] + AppFlashTmrInval;
                    if AggrConvEquipFlashTmr[2] >= 500 then
                    begin
                        AggrConvEquipFlashTmr[2] := 0;
                        AggrConvEquipFlashSta[2] := CntBeltFlashStaIsFullRun;     //Ƥ������״̬ ������ת

                        case AggrConvEquipFlashFrame[2] of
                            1 :
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp2.bmp');
                                AggrConvEquipFlashFrame[2] := 2;
                            end;
                            2 :
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp3.bmp');
                                AggrConvEquipFlashFrame[2] := 3;
                            end;
                            else
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp4.bmp');
                                AggrConvEquipFlashFrame[2] := 1;
                            end;
                        end;
                    end;
                end
                else    //бƤ����ת
                begin
                    AggrConvEquipFlashTmr[2] := AggrConvEquipFlashTmr[2] + AppFlashTmrInval;
                    if AggrConvEquipFlashTmr[2] >= 500 then
                    begin
                        AggrConvEquipFlashTmr[2] := 0;
                        AggrConvEquipFlashSta[2] := CntBeltFlashStaIsEmptyRun;     //Ƥ������״̬ ����ת

                        case AggrConvEquipFlashFrame[2] of
                            1:
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp1.bmp');
                                AggrConvEquipFlashFrame[2] := 2;
                            end;
                            else
                            begin
                                ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp0.bmp');
                                AggrConvEquipFlashFrame[2] := 1;
                            end;
                        end;
                    end;
                end;
            end
            else    //бƤ����ֹ
            begin
                if AggrConvEquipFlashSta[2] <> CntBeltFlashStaIsEmptyStop then     //Ƥ������״̬ ��ֹͣ
                begin
                    ImgAggregateConveyor[2].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\VerStrp0.bmp');
                    AggrConvEquipFlashSta[2] := CntBeltFlashStaIsEmptyStop ;    //Ƥ������״̬ ��ֹͣ
                end;
            end;

            //бƤ�����͹��ϳ�����ʱ��
            LabAggrConvHoldTmr[1].Caption := InttoStr(AggrConveyTmrInInstrument);
        end;
    end
    else    //�������ͷ�ʽ = ������
    begin
        //��������
        if AggregateConveyorEquipInfo[5].Use then
        begin
            DspLiftBucketState(1);    //1������������
        end;
        //��������
        if AggregateConveyorEquipInfo[6].Use then
         begin
            DspLiftBucketState(2);    //2������������
        end;
    end;

    {�����м��}
    if AggregateConveyorMode = CntAggregateConveyorBelt then    //�������ͷ�ʽ = бƤ��
    begin
        DspAggrMidHopperState();
    end ;


    {�����������ʾ}
    MixerFlashDsp();    //�����������ʾ

    if ConveryBeltStateInInstru and ( 1 shl 11 ) <> 0 then
        Label10.Caption := '�ֶ�ģʽ'
    else
        Label10.Caption := '�Զ�ģʽ';

    {����������ư�ť��ʾ}
    DspProdControlBtnState();

    if ( MixerMixingTmrInInstu = 0) then    //�������ʱ��Ϊ0����ʾ�����ʱ�Ѿ�����
    begin
        if (MixerProdCounterInInstru > ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId) and (ProdWtPieceInDbEn) then
        begin
            //д�������ݼ�¼
            ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId := ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId +1;

            WritePieceInfoIntoDb();

            //����λ����ȡ�����趨����
            if ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId >= ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount then
            begin
                ReadWordsFromInstrument1( ReadPieceNumberInfo.RdBufPt , $0841,  $0001 );    //�������ϲ���
                ReadPieceNumberInfo.RdWaitEn := True;
            end;

            ProdWtPieceInDbEn := False;
        end;
    end;

    if ReadPieceNumberInfo.RdWaitEn then
    begin
        if Instruction1ReceiveBuf[ReadPieceNumberInfo.RdBufPt ].Active then
        begin
            Instruction1ReceiveBuf[ReadPieceNumberInfo.RdBufPt].Active := False;
            ReadPieceNumberInfo.RdWaitEn := False;
            
            ReadPieceNumberInfo.SetPieceNumber := Instruction1ReceiveBuf[ReadPieceNumberInfo.RdBufPt].ReceiveByte[0] *256
                                                + Instruction1ReceiveBuf[ReadPieceNumberInfo.RdBufPt].ReceiveByte[1];
            if ReadPieceNumberInfo.SetPieceNumber <= ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId then
            begin
                ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId := ReadPieceNumberInfo.SetPieceNumber;
                UpdateDbForProdEnd();    //�����������������ݿ�

                //ĩ�̴�ӡ������
                if CkLastBatchPrtDevl.Checked then
                begin
                    FrmDeliveryPreview.Show;
                end;

                //���ɳ����б���ɾ���Ѿ������˵��ɵ�
                ProdRow := DelProdedNoticeFromDspTab(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdNotice_ID) ;

                if (ProdMode = CtProdIsContinue ) then
                begin
                    if (ProdRow <= AdvStrGdProdNotice.RowCount - 2) and (Trim(AdvStrGdProdNotice.Cells[2, ProdRow]) <> '') then
                    begin
                         PresStartProd.Visible := True;

                         ProdNoticeInfoRdPt := 1;             //�����ɳ�����Ϣ��ָ��
                         ProdNoticeInfoWtPt := 1;             //�����ɳ�����Ϣдָ��

                         ProdStartRow := ProdRow;

                         ProdStart(ProdStartRow) ;
                    end;
                end;
            end;
        end;
    end;

    //�޸��ϲ�����Ŀ��ֵ
    if StoraLdTgtModiInfo.Ena then
    begin
        StoraLdTargetModifyRec();
    end;

    if ProdBatchsModiInfo.Ena then
    begin
        ProdBatchsModifyRec();
    end;

    //-------------------------------------------------------------------------
    TaskDspTmr := TaskDspTmr + StatusDspTmr.Interval;
    if TaskDspTmr >= 3000 then
    begin
        TaskDspTmr := 0;
        DspErpTask();
    end;
    
    StatusDspTmr.Enabled := True;
end;

procedure TFrmMain.DspErpTask();
var
    RowCount : integer;
begin
    QryErp.Close;
    QryErp.SQL.Clear;
    QryErp.SQL.Text := 'select * from ProdNoticeERP where state=0';
    QryErp.Open;
    while not QryErp.Eof do
    begin
        {д�ɳ��������ݿ�}
        try
            FrmMain.ADOConnection.BeginTrans;
            ADOSubErp.Close;
            ADOSubErp.SQL.Clear;
            ADOSubErp.SQL.Text := 'insert into ProdNotice (ProdTaskCode,ProdRecCode'
                         + ',ProdTruckCode'
                         + ',Driver'
                         + ',ProdAmount'
                         + ',NoticeDt'
                         + ',Dispatcher'
                         + ',Inspector'
                         + ') values '
                         + '('
                         + '''' + QryErp.FieldByName('ProdTaskCode').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('ProdRecCode').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('ProdTruckCode').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('Driver').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('ProdAmount').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('NoticeDt').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('Dispatcher').asstring + ''''
                         + ',' + '''' + QryErp.FieldByName('Inspector').asstring + ''''
                         + ')';
            ADOSubErp.ExecSQL;

            RowCount := AdvStrGdProdNotice.RowCount;
            AdvStrGdProdNotice.RowHeights[RowCount -1] := 20;

            ADOSubErp.Close;
            ADOSubErp.SQL.Clear;
            ADOSubErp.SQL.Text := 'SELECT @@IDENTITY AS maxid from ProdNotice';
            ADOSubErp.Open;
            if not ADOSubErp.Eof then
            begin
              FrmMain.AdvStrGdProdNotice.cells[0, RowCount -1] := inttostr(ADOSubErp.FieldByName('maxid').AsInteger);
              FrmMain.AdvStrGdProdNotice.cells[2, RowCount -1] := inttostr(ADOSubErp.FieldByName('maxid').AsInteger);    //'��ˮ��';
            end;
            //
            //FrmMain.AdvStrGdProdNotice.cells[3, RowCount -1] := QryErp.FieldByName('ProdTaskCode').asstring;    //���񵥱��';
            //FrmMain.AdvStrGdProdNotice.cells[4, RowCount -1] := QryErp.FieldByName('ProdTruckCode').asstring;  //'�������';
           // FrmMain.AdvStrGdProdNotice.cells[5, RowCount -1] := Trim(sCmbBxTruck.Text);       //'���ͳ���';
           // FrmMain.AdvStrGdProdNotice.cells[6, RowCount -1] := Trim(sEtProdAmount.Text);     //'����';
            //FrmMain.AdvStrGdProdNotice.cells[7, RowCount -1] := Trim(sCmbBxClient.Text)
            //                                              + '-' + Trim(sCmbBxProjNm.Text)
            //                                              + '-' + Trim(sCmbBxCastPart.Text) ;    //'������Ϣ';    //�ͻ�����  ��������  ������λ
            //FrmMain.AdvStrGdProdNotice.cells[8, RowCount -1] := Trim(sCmbBxStrength.Text)
            //                                              + '-' + Trim(sCmbBxConcrSlump.Text)
            //                                              + '-' + Trim(sCmbBxConcrSeepage.Text)
            //                                              + '-' + Trim(sEtTecReq.Text);    //'����Ҫ��';    //ǿ�ȵȼ�  ̮���  �����ȼ�  ����Ҫ��

            //AdvStrGdProdNotice.cells[2, RowCount -1] := QryErp.FieldByName('FlowID').AsString;    //'��ˮ��';

            AdvStrGdProdNotice.cells[3, RowCount -1] := QryErp.FieldByName('ProdTaskCode').AsString;    //���񵥱��';
            AdvStrGdProdNotice.cells[4, RowCount -1] := QryErp.FieldByName('ProdRecCode').AsString;  //'�������';
            AdvStrGdProdNotice.cells[5, RowCount -1] := QryErp.FieldByName('ProdTruckCode').AsString;       //'���ͳ���';
            AdvStrGdProdNotice.cells[6, RowCount -1] := QryErp.FieldByName('ProdAmount').AsString;     //'����';
            //AdvStrGdProdNotice.cells[7, RowCount -1] := ADOQuery1.FieldByName('Customer').AsString
            //                                              + '/' + ADOQuery1.FieldByName('ProjNm').AsString
            //                                              + '/' + ADOQuery1.FieldByName('CastPart').AsString ;    //'������Ϣ';    //�ͻ�����  ��������  ������λ
            //AdvStrGdProdNotice.cells[8, RowCount -1] := ADOQuery1.FieldByName('ConcrStrength').AsString
            //                              + '/' + ADOQuery1.FieldByName('ConcrSlump').AsString
            //                              + '/' + ADOQuery1.FieldByName('ConcrSeepage').AsString
            //                              + '/' + ADOQuery1.FieldByName('TecReq').AsString;    //(ǿ�ȵȼ�  ̮���  �����ȼ�  ����Ҫ�� )



            AdvStrGdProdNotice.RowCount := RowCount +1;
            AdvStrGdProdNotice.RowHeights[RowCount] := 0;

            ADOSubErp.Close;
            ADOSubErp.SQL.Clear;
            ADOSubErp.SQL.Text := 'delete from ProdNoticeERP where id=' +QryErp.FieldByName('id').AsString;
            ADOSubErp.ExecSQL;

            FrmMain.ADOConnection.CommitTrans;
        except
            FrmMain.ADOConnection.RollbackTrans;
        end;
        {------------------

        ADOQry
                         + '''' + Trim(sCmbBxTaskCode.Text) + ''''              //ProdTaskID
                         + ',' + '''' + Trim(sCmbBxRecipeCode.Text) + ''''      //ProdRecCode
                         + ',' + '''' + Trim(sCmbBxTruck.Text) + ''''           //ProdTruckCode
                         + ',' + '''' + Trim(sCmbBxDriver.Text) + ''''          //Driver
                         + ',' + (sEtProdAmount.Text)
                         + ',' + '''' + DateToStr(Date()) +' ' + TimeToStr(Time()) + ''''
                         + ',' + '''' + Trim(sCmbBxDispatcher.Text) + ''''      //Dispatcher
                         + ',' + '''' + Trim(sCmbBxInspector.Text) + ''''       //Inspector
                         + ')';
        ADOQry.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
        ExResult := True;
    except
        FrmMain.ADOConnection.RollbackTrans;
        ExResult := False;
    end;
    if ExResult then
    begin
        ADOQry.Close;
        ADOQry.SQL.Clear;
        ADOQry.SQL.Text := 'select @@identity as lastId from ProdNotice';
        ADOQry.Open;
        if not ADOQry.Eof then
        begin
            sEtFlowId.Text := ADOQry.FieldByName('lastId').AsString;
        end;
    end;//}

    {��������������}
    {if ExResult then
    begin
        RowCount := FrmMain.AdvStrGdProdNotice.RowCount;
        FrmMain.AdvStrGdProdNotice.RowHeights[RowCount -1] := 20;

        FrmMain.AdvStrGdProdNotice.cells[0, RowCount -1] := Trim(sEtFlowId.Text);
        FrmMain.AdvStrGdProdNotice.cells[2, RowCount -1] := Trim(sEtFlowId.Text);    //'��ˮ��';
        FrmMain.AdvStrGdProdNotice.cells[3, RowCount -1] := Trim(sCmbBxTaskCode.Text);    //���񵥱��';
        FrmMain.AdvStrGdProdNotice.cells[4, RowCount -1] := Trim(sCmbBxRecipeCode.Text);  //'�������';
        FrmMain.AdvStrGdProdNotice.cells[5, RowCount -1] := Trim(sCmbBxTruck.Text);       //'���ͳ���';
        FrmMain.AdvStrGdProdNotice.cells[6, RowCount -1] := Trim(sEtProdAmount.Text);     //'����';
        FrmMain.AdvStrGdProdNotice.cells[7, RowCount -1] := Trim(sCmbBxClient.Text)
                                                          + '-' + Trim(sCmbBxProjNm.Text)
                                                          + '-' + Trim(sCmbBxCastPart.Text) ;    //'������Ϣ';    //�ͻ�����  ��������  ������λ
        FrmMain.AdvStrGdProdNotice.cells[8, RowCount -1] := Trim(sCmbBxStrength.Text)
                                                          + '-' + Trim(sCmbBxConcrSlump.Text)
                                                          + '-' + Trim(sCmbBxConcrSeepage.Text)
                                                          + '-' + Trim(sEtTecReq.Text);    //'����Ҫ��';    //ǿ�ȵȼ�  ̮���  �����ȼ�  ����Ҫ��

        FrmMain.AdvStrGdProdNotice.RowCount := RowCount +1;
        FrmMain.AdvStrGdProdNotice.RowHeights[RowCount] := 0;
    end;

    if ExResult then
    begin
        Self.Close ;
    end;}
    //    ----------------------
        QryErp.Next;
    end;
end;

//LiftBucketNum=1������������LiftBucketNum = 2����������
procedure TFrmMain.DspLiftBucketState(LiftBucketNum : Integer);    //ˢ��������״̬
begin
    case LiftBucketNum of
        1 :    //��������
        begin
            //ˢ���½�����ź�״̬
            if AggrMidHopperStateInInstru and (1 shl 5) <> 0 then    //�½��ź����
            begin
                if ImgLiftBuktGoDnBtnDspSta[1] <> CntImgLiftBuktBtnDspStaIsValid then    //��Ч״̬
                begin
                    ImgLiftBuktGoDnBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsValid;
                    ImgLiftBucketGoDn[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\GoDnBtnValid.png');
                end;
            end
            else
            begin
                if ImgLiftBuktGoDnBtnDspSta[1] <> CntImgLiftBuktBtnDspStaIsInvad then    //��Ч
                begin
                    ImgLiftBuktGoDnBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsInvad;
                    ImgLiftBucketGoDn[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\GoDnBtnInvalid.png');
                end;
            end;

            //ˢ����������ź�״��
            if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then    //�����ź����
            begin
                if ImgLiftBuktGoUpBtnDspSta[1] <> CntImgLiftBuktBtnDspStaIsValid then    //��Ч״̬
                begin
                    ImgLiftBuktGoUpBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsValid;
                    ImgLiftBucketGoUp[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\GoUpBtnValid.png');
                end;
            end
            else
            begin
                if ImgLiftBuktGoUpBtnDspSta[1] <> CntImgLiftBuktBtnDspStaIsInvad then    //��Ч״̬
                begin
                    ImgLiftBuktGoUpBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsInvad;
                    ImgLiftBucketGoUp[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\GoUpBtnInvalid.png');
                end;
            end;

            //ˢ������λ
            if AggrMidHopperStateInInstru and (1 shl 0) <> 0 then
            begin
                if ImgLiftBuktTopLmtDspSta[1] <> CntImgLiftBuktLmtDspStaIsValid then    //��Ч״̬
                begin
                    ImgLiftBuktTopLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsValid;
                    ImgLiftBucketTopLmt[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\WeigDischValveLmtValid.png');
                end;
            end
            else
            begin
                if ImgLiftBuktTopLmtDspSta[1] <> CntImgLiftBuktLmtDspStaIsInvad then    //��Ч״̬
                begin
                    ImgLiftBuktTopLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsInvad;
                    ImgLiftBucketTopLmt[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\WeigDischValveLmtInValid.png');
                end;
            end;

            //��������λ
            if AggrMidHopperStateInInstru and (1 shl 1) <> 0 then    //��������������Ч
            begin
                if ImgLiftBuktBtmLmtDspSta[1] <> CntImgLiftBuktLmtDspStaIsValid then
                begin
                    ImgLiftBuktBtmLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsValid ;
                    ImgLiftBucketBottomLmt[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\WeigDischValveLmtValid.png');
                end;
            end
            else
            begin
                if ImgLiftBuktBtmLmtDspSta[1] <> CntImgLiftBuktLmtDspStaIsInvad then
                begin
                    ImgLiftBuktBtmLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsInvad ;
                    ImgLiftBucketBottomLmt[1].Picture.LoadFromFile(AppPath + '\Images\Equips\Straps\WeigDischValveLmtInValid.png');
                end;
            end;

            //����״̬
            LeftLiftBucketFlash();    //��������������ʾ

            //Ԥ������ʱ��
            LabLiftBucketPreRisTmr[1].Caption := IntToStr(AggrConveyTmrInInstrument);     //����������Ԥ������ʱ��

            //ж�ϼ�ʱ��
            LabLiftBucketDschTmr[1].Caption := IntToStr(AggrMidBinDschTmrInInstru) ;     //����������ж�ϼ�ʱ����ǩ

            //�����̴μ�����
            LabLiftBucketLdCounter[1].Caption := IntToStr(AggrLoadCounterInInstru);     //�����������̴μ�������ǩ

        end;

        2 :    //��������
        begin

        end;
    end;
end;

procedure TFrmMain.LeftLiftBucketFlash();    //��������������ʾ
var
    MovX : Integer;
    MovY : Integer;
begin
    if AggrMidHopperStateInInstru and (1 shl 1) <> 0 then    //��������������Ч
    begin
        ImgLiftBucket[1].Left := LiftBucketAttr[1].XBottom;
        ImgLiftBucket[1].Top  := LiftBucketAttr[1].YBottom;
    end
    else if AggrMidHopperStateInInstru and (1 shl 0) <> 0 then    //������Ч
    begin
        ImgLiftBucket[1].Left := LiftBucketAttr[1].XTop;
        ImgLiftBucket[1].Top  := LiftBucketAttr[1].YTop;
    end
    else
    begin
        if AggrMidHopperStateInInstru and (1 shl 5) <> 0 then    //�½��ź����
        begin
            LiftBucketAttr[1].MovTmr := LiftBucketAttr[1].MovTmr + AppFlashTmrInval;
            if LiftBucketAttr[1].MovTmr >= 1000 then
            begin
                LiftBucketAttr[1].GodnTmr := LiftBucketAttr[1].GodnTmr + LiftBucketAttr[1].MovTmr;


                //MovX := LiftBucketAttr[1].GoUpTmr * LiftBucketAttr[1].XMoveMax  div LiftBucketAttr[1].GoDnLong ;
                //if MovX > LiftBucketAttr[1].XMoveMax then MovX := LiftBucketAttr[1].XMoveMax;
                //ImgLiftBucket[1].Left := LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax - MovX ;

                //MovY := LiftBucketAttr[1].GoUpTmr * LiftBucketAttr[1].YMoveMax  div LiftBucketAttr[1].GoDnLong ;
                //if MovY > LiftBucketAttr[1].YMoveMax then MovY := LiftBucketAttr[1].YMoveMax;
                //ImgLiftBucket[1].Top := LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax + MovY ;

                MovX := ImgLiftBucket[1].Left - LiftBucketAttr[1].MovTmr * LiftBucketAttr[1].XMoveMax  div LiftBucketAttr[1].GoDnLong;
                if MovX > LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax then
                    MovX := LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax
                else if MovX < LiftBucketAttr[1].XBottom then
                    MovX := LiftBucketAttr[1].XBottom;
                ImgLiftBucket[1].Left := MovX;

                MovY := ImgLiftBucket[1].Top + LiftBucketAttr[1].MovTmr * LiftBucketAttr[1].YMoveMax  div LiftBucketAttr[1].GoDnLong;
                if MovY < LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax then
                    MovY := LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax
                else if MovY > LiftBucketAttr[1].YBottom then
                    MovY := LiftBucketAttr[1].YBottom;
                ImgLiftBucket[1].Top := MovY;
                
                LiftBucketAttr[1].MovTmr := 0;
            end;
        end;

        if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then    //�����ź����
        begin
            LiftBucketAttr[1].MovTmr := LiftBucketAttr[1].MovTmr + AppFlashTmrInval;
            if LiftBucketAttr[1].MovTmr >= 1000 then
            begin
                LiftBucketAttr[1].GoUpTmr := LiftBucketAttr[1].GoUpTmr + LiftBucketAttr[1].MovTmr;


                //MovX := LiftBucketAttr[1].GoUpTmr * LiftBucketAttr[1].XMoveMax  div LiftBucketAttr[1].GoUpLong ;
                //if MovX > LiftBucketAttr[1].XMoveMax then MovX := LiftBucketAttr[1].XMoveMax;
                //ImgLiftBucket[1].Left := LiftBucketAttr[1].XBottom + MovX ;

                //MovY := LiftBucketAttr[1].GoUpTmr * LiftBucketAttr[1].YMoveMax  div LiftBucketAttr[1].GoUpLong ;
                //if MovY > LiftBucketAttr[1].YMoveMax then MovY := LiftBucketAttr[1].YMoveMax;
                //ImgLiftBucket[1].Top := LiftBucketAttr[1].YBottom - MovY
                MovX := ImgLiftBucket[1].Left + LiftBucketAttr[1].MovTmr * LiftBucketAttr[1].XMoveMax  div LiftBucketAttr[1].GoUpLong;
                if MovX > LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax then MovX := LiftBucketAttr[1].XBottom + LiftBucketAttr[1].XMoveMax ;
                ImgLiftBucket[1].Left := MovX;

                MovY := ImgLiftBucket[1].Top - LiftBucketAttr[1].MovTmr * LiftBucketAttr[1].YMoveMax  div LiftBucketAttr[1].GoUpLong;
                if MovY < LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax then MovY := LiftBucketAttr[1].YBottom - LiftBucketAttr[1].YMoveMax ;
                ImgLiftBucket[1].Top := MovY;

                LiftBucketAttr[1].MovTmr := 0;
            end;
        end;
    end;
end;

procedure TFrmMain.StoraLdTargetModifyRec();
var
    i : integer;
    OperRow : Integer;
    StorLdState : Integer;
    WgrDecimal : Integer;
    StoraLdTargtWtPt : Integer;
begin
    if Instruction1ReceiveBuf[StoraLdTgtModiInfo.RevBufPt].Active then    //�յ���������
    begin
        WgrDecimal := WeigherPara[StorageInfo[StoraLdTgtModiInfo.ModiStorId].InstrumentId][CntWeigherDecimalIndex].Value;

        for i:= 1 to ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount do
        begin
            OperRow := 1 + (i-1) * (ProdNoticeInfo[ProdNoticeInfoRdPt].LdStorageCounter +1)+ ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLdNumInNotice[StoraLdTgtModiInfo.ModiStorId];

            if trim(AdvStrGdProRd.AllCells[7, OperRow]) <> '' then
            begin
                try
                    StorLdState := StrToInt( trim(AdvStrGdProRd.AllCells[7, OperRow]) );
                except
                    StorLdState := 0;
                end;
            end
            else
            begin
                StorLdState := 0;
            end;

            if StorLdState < 10 then
            begin
                AdvStrGdProRd.AllCells[GrdLdInfoEdtCol, OperRow] := Format('%.' + inttostr(WgrDecimal) + 'f', [StoraLdTgtModiInfo.NewTarget]);
            end;
        end;

        StorageLoadTargetLab[StoraLdTgtModiInfo.ModiStorId].Caption := Format('%.' + inttostr(WgrDecimal) + 'f', [StoraLdTgtModiInfo.NewTarget]);

        StoraLdTargtWtPt := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStorageLdTargWtPt[StoraLdTgtModiInfo.ModiStorId];

        ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStorageLdTarget[StoraLdTgtModiInfo.ModiStorId][StoraLdTargtWtPt].LoadTarget := StoraLdTgtModiInfo.NewTarget;
        //[StoraLdTgtModiInfo.NewTarget][ProdStorageLdTargWtPt[StoraLdTgtModiInfo.NewTarget]].LoadTarget :=4;// 

        EtNewLdTarg.Visible := False;
        GrdLdInfoEditing    := False;
        StoraLdTgtModiInfo.Ena := False;

        Instruction1ReceiveBuf[StoraLdTgtModiInfo.RevBufPt].Active := False;
    end
    else
    begin
        StoraLdTgtModiInfo.Tmr := StoraLdTgtModiInfo.Tmr + AppFlashTmrInval;
        if StoraLdTgtModiInfo.Tmr > 1000 then
        begin
            StoraLdTgtModiInfo.Tmr := 1000;
            GrdLdInfoEditing    := False;
            StoraLdTgtModiInfo.Ena := False;
            Showmessage('�·�����Ŀ��ֵʧ��!');
            EtNewLdTarg.Visible := False;
        end;
    end;
end;

procedure TFrmMain.ProdBatchsModifyRec();                    //�޸������������ճ���
var
    i : Integer;
    TabRowCount : Integer;
    TabTotlaRow : Integer;
    RowSpan : Integer;
    RealRowOfLastRow : Integer;
begin
    if Instruction1ReceiveBuf[ProdBatchsModiInfo.RevBufPt].Active then    //�յ���������
    begin
        ProdBatchsModiInfo.Ena := False;

        case ProdBatchsModiInfo.ModiTp of
            CtProdBatchsModiIsDec :
            begin
                TabRowCount := AdvStrGdProRd.RowCount ;
                TabTotlaRow := AdvStrGdProRd.TotalRowCount;
                RowSpan := ProdNoticeInfo[ProdNoticeInfoRdPt].LdStorageCounter + 1;

                RealRowOfLastRow := AdvStrGdProRd.RealRowIndex(TabRowCount-1);

                if (TabTotlaRow - RowSpan) = RealRowOfLastRow then    //���һ���ڵ�û��չ��
                begin
                    if AdvStrGdProRd.IsNode(TabRowCount-1) then
                    begin
                        AdvStrGdProRd.ExpandNode(RealRowOfLastRow);
                    end;
                end;

                TabRowCount := AdvStrGdProRd.RowCount;
                //AdvStrGdProRd.RemoveNode(RealRowOfLastRow);
                //AdvStrGdProRd.ClearRows(TabRowCount-RowSpan,RowSpan);
                AdvStrGdProRd.RemoveRows(TabRowCount-RowSpan,RowSpan);
                //AdvStrGdProRd.RowCount := TabRowCount - RowSpan;

                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount -1;
            end;

            CtProdBatchsModiIsInc :
            begin
                TabRowCount := AdvStrGdProRd.RowCount ;
                TabTotlaRow := AdvStrGdProRd.TotalRowCount;

                RowSpan := ProdNoticeInfo[ProdNoticeInfoRdPt].LdStorageCounter + 1;
                AdvStrGdProRd.RowCount := TabRowCount + RowSpan;
                for i:=TabRowCount to TabRowCount + RowSpan do
                begin
                    AdvStrGdProRd.Rows[i].Clear;
                end;

                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount + 1;

                AdvStrGdProRd.AllCells[1, TabTotlaRow] := '��' + inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount) + '��';
                for i:=TabTotlaRow+1 to TabTotlaRow + RowSpan do
                begin
                    AdvStrGdProRd.Rows[i].Clear;
                    AdvStrGdProRd.AllCells[1, i] := AdvStrGdProRd.AllCells[1, i - RowSpan];    //ԭ����
                    AdvStrGdProRd.AllCells[2, i] := AdvStrGdProRd.AllCells[2, i - RowSpan];    //�䷽ֵ
                    AdvStrGdProRd.AllCells[3, i] := AdvStrGdProRd.AllCells[3, i - RowSpan];    //�趨ֵ
                    AdvStrGdProRd.AllCells[4, i] := '0';                                       //���ֵ
                    AdvStrGdProRd.AllCells[5, i] := '0';                                       //���
                    AdvStrGdProRd.AllCells[6, i] := AdvStrGdProRd.AllCells[6, i - RowSpan];    //�ֺ�
                    AdvStrGdProRd.AllCells[7, i] := '0';                                       //״̬
                    AdvStrGdProRd.AllCells[8, i] := AdvStrGdProRd.AllCells[8, i - RowSpan];    //�̺�
                end;
                AdvStrGdProRd.AddNode(TabTotlaRow, RowSpan);
                AdvStrGdProRd.ContractNode(TabTotlaRow);
            end;
        end;

        Instruction1ReceiveBuf[ProdBatchsModiInfo.RevBufPt].Active := False;
        
        if InstrumentState and $0030 <> $0000 then
        begin
            BtnIncProdSetCount.Enabled := True;                      //���һ�� ��ť
            BtnIncProdSetCountState := BtnProdSetCountStIsEnbale;

            BtnDecProdSetCount.Enabled := True;                     //����һ�� ��ť
            BtnDecProdSetCountState := BtnProdSetCountStIsEnbale;
        end;
    end
    else
    begin
        ProdBatchsModiInfo.Tmr := ProdBatchsModiInfo.Tmr + AppFlashTmrInval;
        if ProdBatchsModiInfo.Tmr > 5000 then
        begin
            ProdBatchsModiInfo.Tmr := 2000;
            ProdBatchsModiInfo.Ena := False;
            Showmessage('�޸�������������ʧ��!');

            if InstrumentState and $0030 <> $0000 then
            begin
                BtnIncProdSetCount.Enabled := True;                      //���һ�� ��ť
                BtnIncProdSetCountState := BtnProdSetCountStIsEnbale;

                BtnDecProdSetCount.Enabled := True;                     //����һ�� ��ť
                BtnDecProdSetCountState := BtnProdSetCountStIsEnbale;
            end;
        end;
    end;
end;

procedure TFrmMain.WritePieceInfoIntoDb();
Var
    RdDt : TDateTime;
    PieceId : Integer;
    i : Integer;
    RecipeRdPt,
    TargetRdPt : Integer;
    WghrDecimal : Integer;
    LdFactRdPt  : Integer;
begin
    ADOQuery1.Close;
    //д������Ϣ��Piece����
    try
        ADOQuery1.SQL.Clear;
        ADOConnection.BeginTrans;

        ADOQuery1.SQL.Text := 'insert into Piece ('
                              + 'Produce'
                              + ', Serial'
                              + ', Blend'
                              + ', DatTim'
                              + ', BldTim'
                              + ', PieAmnt'
                              + ') values ('
                              + inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_IdInDb)
                              + ',' + inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId)
                              + ',' + '1'
                              + ',' + ':WtRdTd'
                              + ',' + ':BldTm'
                              + ',' + format('%.2f', [ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchAmount])
                              + ')';
        RdDt := Now();
        ADOQuery1.Parameters.ParamByName('WtRdTd').Value := RdDt;//FloatToStr(RdDt);
        ADOQuery1.Parameters.ParamByName('BldTm').Value := DateTimeToStr(RdDt - MixerPara[CntIndexOfMixingSetLngInArray].Value /24/60/60)
                                                         + '��'
                                                         + DateTimeToStr(RdDt)
                                                         +';';
        ADOQuery1.ExecSQL;
        ADOConnection.CommitTrans;
    except
        ADOConnection.RollbackTrans;
        Showmessage('���̼�¼��Ϣ��¼ʧ��!');
    end;

    //д���̼�¼ֵ
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select @@identity as lastPieceId from Piece';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        PieceId := ADOQuery1.FieldByName('lastPieceId').AsInteger;

        try
            ADOConnection.BeginTrans;
            for i:=1 to CntStorageCount do
            begin
                if Not StorageInfo[i].Enable then Continue;

                if ProdNoticeInfo[ProdNoticeInfoRdPt].SiloLoadEn[i] then
                begin
                    WghrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;

                    //��ȶ�ȡָ��
                    RecipeRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i];
                    if ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecipe[i][RecipeRdPt].EndBatchNumber > ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId then    //�ò��䷽ֵ�ѷ����仯
                    begin
                        RecipeRdPt := RecipeRdPt +1;
                        if RecipeRdPt > CntProdStoraLdRceQueueLen then RecipeRdPt := 1;
                        ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i] := RecipeRdPt;
                    end;

                    //--------������Ϣ�������������ˣ�LoadTarget  : array[1..CntLoadValueQueueLen] of Double; �������------------
                    //����Ŀ��ֵ��ȡָ��
                    //TargetRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargRdPt[i];
                    //if ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TargetRdPt].EndBatchNumber > ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId then     //����Ŀ��ֵ�Ѿ��仯
                    //begin
                    //    TargetRdPt := TargetRdPt + 1;
                    //    if TargetRdPt > CntProdStorageTargetQueueLen then TargetRdPt := 1;
                    //    ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargRdPt[i] := TargetRdPt;
                    //end;
                    //------------------------------ͣ��------------------------------------------------------------------------

                    //����ֵ���ж�ָ��
                    LdFactRdPt := SiloLoadInfo[i].RdPt;

                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Text := 'insert into Dosage ('
                                        + 'Piece'        //�̺�
                                        + ',StorID'      //�ֺ�
                                        + ',Storage'     //�ϲ�����
                                        + ',MaterID'     //���ϱ��
                                        + ',Material'    //ԭ������
                                        + ',RecAmnt'     //���ֵ
                                        + ',PlanAmnt'    //����Ŀ��ֵ
                                        + ',FactAmnt'    //ʵ������ֵ
                                        + ') values ('
                                        + inttostr(PieceId)    //�̺�
                                        + ',' + inttostr(i)    //�ֺ�
                                        + ',' + '''' + StorageInfo[i].Name + ''''        //�ϲ�����
                                        + ',' + inttostr(StorageInfo[i].MaterId)         //ԭ�����
                                        + ',' + '''' + StorageInfo[i].MaterName + ''''   //ԭ������
                                        + ',' + format('%.' + inttostr(WghrDecimal) + 'f', [ ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecipe[i][RecipeRdPt].LoadRecipe ])        //���ֵ
                                        //--------������Ϣ�������������ˣ�LoadTarget  : array[1..CntLoadValueQueueLen] of Double; �������--------------------------------------------------------
                                        //+ ',' + format('%.' + inttostr(WghrDecimal) + 'f', [ ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TargetRdPt].LoadTarget ])      //����Ŀ��ֵ
                                        //-----------------------------------------------��Ϊ-----------------------------------------------------------------------------------------------------
                                        + ',' + format('%.' + inttostr(WghrDecimal) + 'f', [ SiloLoadInfo[i].LoadTarget[LdFactRdPt] ])      //����Ŀ��ֵ
                                        //--------������Ϣ�������������ˣ�LoadTarget  : array[1..CntLoadValueQueueLen] of Double; �޸Ľ���--------------------------------------------------------

                                        + ',' + format('%.' + inttostr(WghrDecimal) + 'f', [ SiloLoadInfo[i].LoadFact[LdFactRdPt] ])
                                        + ')';

                    //-------2017.07.12 11:48 Ϊ�����ӿ�����ģ��������-----------------------
                    //��������ֵ���ж�ָ��
                    //LdFactRdPt := LdFactRdPt + 1;
                    //if LdFactRdPt > CntLoadValueQueueLen then LdFactRdPt := 1;
                    //SiloLoadInfo[i].RdPt := LdFactRdPt ;

                    //ADOQuery1.ExecSQL;
                    //----------------------------��Ϊ------------------------------------------
                    ADOQuery1.ExecSQL;

                        //----------2017.07.12 11:51 Ϊ�����ӿ�����ģ��������������----------
                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Text := 'update Storage set Stock =Stock-' + format('%.' + inttostr(WghrDecimal) + 'f', [ SiloLoadInfo[i].LoadFact[LdFactRdPt] ]) + ' where ID =' + inttostr(i);
                    ADOquery1.ExecSQL;
                    
                        //------------------------------���ӽ���-------------------------------                      

                    LdFactRdPt := LdFactRdPt + 1;
                    if LdFactRdPt > CntLoadValueQueueLen then LdFactRdPt := 1;
                    SiloLoadInfo[i].RdPt := LdFactRdPt ;
                    //--------------------------�޸Ľ���----------------------------------------
                end;
            end;

            ADOConnection.CommitTrans;
        except
            ADOConnection.RollbackTrans;
        end;
    end
    else
    begin
        Showmessage('д���̼�¼��ϸʧ��');
    end;

    ADOQuery1.Close;

    if ProdNoticeInfo[ProdNoticeInfoRdPt].ProdRecipe_Code <> '' then    //ˢ���������񵥵��ۼƷ���
    begin
        Try
            ADOConnection.BeginTrans;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'update ProdTask set TolAmount=TolAmount + '
                                + FloatToStr(RoundTo(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchAmount, -3 ))
                                + ' where Code=' + '''' + ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_Code + '''';
            ADOQuery1.ExecSQL;
            ADOConnection.CommitTrans;
        except
            ADOConnection.RollbackTrans;
            Showmessage('�������������ۼƷ���ʧ��');
        end;
        ADOQuery1.Close;
    end;
end;

procedure TFrmMain.DspAggrMidHopperState();
begin
    {�м��ж�Ϸ�}
    if AggregateMidBinInfo[1].Use then    //1#�м����ʹ��
    begin
        if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then    //�м䶷ж���� ��� ��Ч
        begin
            if AggrMidHopperDschValveImgState[1] <> CntMdHopDshValImgIsValid then    //1#�м䶷ж�Ϸ�ͼƬ״̬ ����Ч ״̬
            begin
                DSpAggrMidHopperDschValveImgNewState(1, CntMdHopDshValImgIsValid);   //1#�м䶷ж�Ϸ�ͼƬ״̬ ��Ч ״̬
            end;
        end
        else                                                     //�м䶷ж���� ��� ��Ч
        begin
            if AggrMidHopperDschValveImgState[1] <> CntMdHopDshValImgIsInvalie then    //1#�м䶷ж�Ϸ�ͼƬ״̬ ����Ч ״̬
            begin
                DSpAggrMidHopperDschValveImgNewState(1, CntMdHopDshValImgIsInvalie);   //1#�м䶷ж�Ϸ�ͼƬ״̬ ��Ч ״̬
            end;
        end;

        //ж������
        if AggregateMidBinInfo[1].VibraValid then //ж������ ʹ�� ״̬
        begin
            if AggrMidHopperStateInInstru and (1 shl 9) <> 0 then    //�м䶷ж������ ��� ��Ч
            begin
                if AggrMidHopperDschVibraImgState[1] <> CntMdHopDshVibraImgIsValid then    //�м䶷ж�� ����ͼƬ ����Ч״̬
                begin
                    DspAggrMidBInDschVibraImgNewState(1, CntMdHopDshVibraImgIsValid);
                end;
            end
            else                                                     //�м䶷ж������ ��� ��Ч
            begin
                if AggrMidHopperDschVibraImgState[1] <> CntMdHopDshVibraImgIsInvalie then    //�м䶷ж�� ����ͼƬ ����Ч״̬
                begin
                     DspAggrMidBInDschVibraImgNewState(1, CntMdHopDshVibraImgIsInvalie);
                end;
            end;
        end;

        //��λ���
        if AggrMidHopperStateInInstru and (1 shl 4) <> 0 then    //�����м�� ж�Ϸ���� ��Ч
        begin
            //ж���ſ�״̬�µ� ������λ
            if AggregateMidBinInfo[1].OpenLmtValid then    //�����м�ֹ��� ��Ч
            begin
                 if AggrMidHopperStateInInstru and (1 shl 0) <> 0 then    //������Ч
                 begin
                     if AggrMdHopperDschValOpLmtImgState[1] <> CtMdHopDschValLmtImgIsValid then  //�м䶷ж���� ��λͼƬ ����Ч
                     begin
                         DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsOpen, CtMdHopDschValLmtImgIsValid); //�����м䶷ж���� ����ͼƬ Ϊ ��Ч״̬
                     end
                 end
                 else                                                 //������Ч
                 begin
                     if AggrMdHopperDschValOpLmtImgState[1] <> CtMdHopDschValLmtImgIsValSpl then  //�м䶷ж���� ��λͼƬ ����Ч��˸
                     begin
                         DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsOpen, CtMdHopDschValLmtImgIsValSpl); //�����м䶷ж���� ����ͼƬ ����Ч��˸״̬
                     end;
                 end;
            end;

            //ж���ſ�״̬�µ� ������λ
            if AggregateMidBinInfo[1].CloseLmtValid then
            begin
                if AggrMidHopperStateInInstru and (1 shl 1) <> 0 then    //������Ч
                begin
                    if AggrMdHopperDschValClLmtImgState[1] <> CtMdHopDschValLmtImgIsValSpl then  //�м䶷ж���� ��λͼƬ ����Ч��˸
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsClose, CtMdHopDschValLmtImgIsValSpl);
                    end;
                end
                else
                begin
                    if AggrMdHopperDschValClLmtImgState[1] <> CtMdHopDschValLmtImgIsInvalid then //�м䶷ж���� ��λͼƬ ����Ч
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsClose, CtMdHopDschValLmtImgIsInvalid);
                    end;
                end;
            end;
        end
        else                                                    //�����м�� ж�Ϸ���� ��Ч
        begin
            //ж���Źر�״̬�µ� ������λ
            if AggregateMidBinInfo[1].OpenLmtValid then    //�����м�ֹ��� ��Ч
            begin
                if AggrMidHopperStateInInstru and (1 shl 0) <> 0 then    //������Ч
                begin
                    if AggrMdHopperDschValOpLmtImgState[1] <> CtMdHopDschValLmtImgIsInvSpl then  //�м䶷ж���� ��λͼƬ ����Ч��˸
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsOpen, CtMdHopDschValLmtImgIsInvSpl); //�����м䶷ж���� ����ͼƬ Ϊ ��Ч��˸״̬
                    end;
                end
                else
                begin
                    if AggrMdHopperDschValOpLmtImgState[1] <> CtMdHopDschValLmtImgIsInvalid then //�м䶷ж���� ��λͼƬ ����Ч
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsOpen, CtMdHopDschValLmtImgIsInvalid); //�����м䶷ж���� ����ͼƬ Ϊ ��Ч״̬
                    end;
                end;
            end;

            //ж���Źر�״̬�µ� ������λ
            if AggregateMidBinInfo[1].CloseLmtValid then
            begin
                if AggrMidHopperStateInInstru and (1 shl 1) <> 0 then    //������Ч
                begin
                    if AggrMdHopperDschValClLmtImgState[1] <> CtMdHopDschValLmtImgIsValid then  //�м䶷ж���� ��λͼƬ ����Ч
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsClose, CtMdHopDschValLmtImgIsValid);
                    end;
                end
                else
                begin
                    if AggrMdHopperDschValClLmtImgState[1] <> CtMdHopDschValLmtImgIsInvSpl then  //�м䶷ж���� ��λͼƬ ����Ч��˸
                    begin
                        DspAggrMidBinDschValvLmtImgNewState(1, CtMdHopDschValLmtIsClose, CtMdHopDschValLmtImgIsInvSpl);
                    end;
                end;
            end;
        end;

        //�м���Ƿ����ϼ��
        if AggrMidHopperStateInInstru and (1 shl 3) <> 0 then    //�������м�֣��������Ƿ�δж��
        begin
            if not MidBinIsFull[1] then
            begin
                ImgMidBinFull[1].Visible := True;
                MidBinIsFull[1] := True;
            end;
        end
        else
        begin
            if MidBinIsFull[1] then
            begin
                ImgMidBinFull[1].Visible := False;
                MidBinIsFull[1] := False;
            end;
        end;

        //ж�ϼ�ʱ��
        LabAggrMidBinDschTmr[1].Caption := Inttostr(AggrMidBinDschTmrInInstru);
        //����������
        LabAggrMIdBinLdCounter[1].Caption := IntToStr(AggrLoadCounterInInstru);
    end;
end;

procedure TFrmMain.MixerFlashDsp();    //�����������ʾ
begin
    {��������ж�����ʾ}
    if MixerStateInInstru and (1 shl 3) <> 0 then    //���������
    begin
        if MixerStateInInstru and (1 shl 4) <> 0 then    //���������
        begin
            if MixerFalshState[1] <> CtMxrFlashStIsFullRun then    //��������� ������
            begin
                DspMixerFlashNewState(1, CtMxrFlashStIsFullRun);
                ProdWtPieceInDbEn := True;
            end;
        end
        else    //��ת
        begin
            if MixerFalshState[1] <> CtMxrFlashStIsEmptyRun  then    //��������� ������
            begin
                DspMixerFlashNewState(1, CtMxrFlashStIsEmptyRun);
            end;
        end;    
    end
    else    //�����ֹͣ
    begin
        if MixerStateInInstru and (1 shl 4) <> 0 then    //���������
        begin
            if MixerFalshState[1] <> CtMxrFlashStIsFullStop then;    //��������� ��ͣ
            begin
                DspMixerFlashNewState(1, CtMxrFlashStIsFullStop);
                ProdWtPieceInDbEn := True;
            end;
        end
        else    //��
        begin
            if MixerFalshState[1] <> CtMxrFlashStIsEmptyStop then    //��������� ��ͣ
            begin
                DspMixerFlashNewState(1, CtMxrFlashStIsEmptyStop);
            end;
        end;
    end;

    {�����ж���� ���Ű�ť ״̬}
    if MixerStateInInstru and (1 shl 5) <> 0 then    //�����ж���� �����ź� ��Ч
    begin
        if BtnMxrDschValveOPState[1] <> CtBtnMxrDschValveOpStIsValid then    //�����ж���� ���Ű�ť״̬ Ϊ ����Ч
        begin
            DSpBtnMixerDschValveOPenNewState(1, CtBtnMxrDschValveOpStIsValid );
        end;
    end
    else
    begin
        if BtnMxrDschValveOPState[1] <> CtBtnMxrDschValveOpStIsInvalid then    //�����ж���� ���Ű�ť״̬ Ϊ ����Ч
        begin
            DSpBtnMixerDschValveOPenNewState(1, CtBtnMxrDschValveOpStIsInvalid);
        end;
    end;

    {�����ж���� ���Ű�ť ״̬}
    if MixerStateInInstru and (1 shl 6) <> 0 then    //�����ж���� �����ź� ��Ч
    begin
        if BtnMxrDschValveClState[1] <> CtBtnMxrDschValveClStIsValid then    //�����ж���� ���Ű�ť״̬ Ϊ ����Ч
        begin
            DspBtnMixerDschValveCloseNewState(1, CtBtnMxrDschValveClStIsValid);
        end;
    end
    else
    begin
        if BtnMxrDschValveClState[1] <> CtBtnMxrDschValveClStIsInvalid then    //�����ж���� ���Ű�ť״̬ Ϊ ����Ч
        begin
            DspBtnMixerDschValveCloseNewState(1, CtBtnMxrDschValveClStIsInvalid);
        end;
    end;

    {�����ж���� ״̬}
    if MixerStateInInstru and (1 shl 0) <> 0 then     //�����ж���� ������λ ��Ч
    begin
        if MixerStateInInstru and $0006 = 0 then    //�����ж�Ϸ� �뿪����λ��������λ ����Ч�����ſ�״̬
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsOpen then    //�����ж���� ״̬  �ǿ�
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsOpen);
            end;
        end
        else    //������һ����Ч����ж������λ����
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsAlarm then;    //�����ж���� ״̬   �Ǳ���
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsAlarm);
            end;
        end;
    end
    else if MixerStateInInstru and (1 shl 1) <> 0 then    //�����ж���� ������λ ��Ч
    begin
        if MixerStateInInstru and $0005 = 0 then    //����� ���š��뿪�� ��λ��Ч ��������״̬
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsClose then    //�����ж���� ״̬  �ǹ�
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsClose);
            end;
        end
        else    //������һ����λ��Ч��������״̬
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsAlarm then;    //�����ж���� ״̬   �Ǳ���
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsAlarm);
            end;
        end;
    end
    else if MixerStateInInstru and (1shl 2) <> 0 then     //�����ж���� �뿪����λ ��Ч
    begin
        if MixerStateInInstru and $0003 = 0 then    //�����ж���� ���ޡ����� ����Ч�����뿪��
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsHalfOpen then    //�����ж���� ״̬  �ǰ뿪
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsHalfOpen);
            end;
        end
        else    //������һ����λ��Ч��������״̬
        begin
            if MixerDschValveImgState[1] <> CtMxrDschValStIsAlarm then;    //�����ж���� ״̬   �Ǳ���
            begin
                DspMixerDschValveImgNewState(1, CtMxrDschValStIsAlarm);
            end;
        end;
    end
    else    //����ж������λ����Ч
    begin
        if MixerDschValveImgState[1] <> CtMxrDschValStIsAlarm then;    //�����ж���� ״̬   �Ǳ���
        begin
            DspMixerDschValveImgNewState(1, CtMxrDschValStIsAlarm);
        end;
    end;

    //�������ʱ��
    if ( MixerMixingTmrInInstu = 0) or ( (MixerStateInInstru and (1 shl 0)) <> 0 ) then    //�����ʱ������0 �� ������Ч
        LabMixerDschTmr[1].Caption := IntToStr(MixerDschTmrInInstru)    //�����ж�ϼ�ʱ��
    else
        LabMixerDschTmr[1].Caption := IntToStr(MixerMixingTmrInInstu);     // ����������ʱ��

    //�������������������
    LabMixerProdCounter[1].Caption := IntToStr(MixerProdCounterInInstru);

end;

procedure TFrmMain.DspProdControlBtnState();    //�������ư�ť״̬��ʾ
begin
    if InstrumentState and (1 shl 6) <> 0 then     //��ʼ״̬��ʶ��Ч
    begin
          //���һ�� ��ť
          if BtnIncProdSetCountState <> BtnProdSetCountStIsDisable then    //����������ť ����Ч ״̬
          begin
              BtnIncProdSetCount.Enabled := False;
              BtnIncProdSetCountState := BtnProdSetCountStIsDisable;
          end;
          //����һ�� ��ť
          if BtnDecProdSetCountState <> BtnProdSetCountStIsDisable then    //����������ť ����Ч ״̬
          begin
              BtnDecProdSetCount.Enabled := False;
              BtnDecProdSetCountState := BtnProdSetCountStIsDisable;
          end;
          //������ͣ��ť
          if BtnProdPauseEnableState <> CtBtnProdPauseEnStIsFalse then    //������ͣ��ť Enableֵ ��False
          begin
              cxBtnProdPause.Enabled := False;
              BtnProdPauseEnableState := CtBtnProdPauseEnStIsFalse ;
          end;
          if BtnProdPauseCaptionState <> CtBtnProdPauseCpIsPause then    //������ͣ��ť Caption ��ͣ���� ״̬
          begin
              cxBtnProdPause.Caption := '��ͣ����';
              BtnProdPauseCaptionState := CtBtnProdPauseCpIsPause  ;
          end;
          //����������ť
          if BtnProdStartCaptionState <> CtBtnProdStatCpIsStart then    //����������ť Caption Ϊ ���������� ״̬
          begin
              BtnStartProd.Caption := '��������';
               BtnProdStartCaptionState := CtBtnProdStatCpIsStart;
          end;
    end
    else if InstrumentState and (1 shl 5) <> 0 then     //������ͣ״̬ ��ʶ ��Ч
    begin
        //���һ�� ��ť
        if BtnIncProdSetCountState <> BtnProdSetCountStIsEnbale then    //����������ť ����Ч ״̬
        begin
            BtnIncProdSetCount.Enabled := True;
            BtnIncProdSetCountState := BtnProdSetCountStIsEnbale ;
        end;
        //����һ�� ��ť
        if BtnDecProdSetCountState <> BtnProdSetCountStIsEnbale then    //����������ť ����Ч ״̬
        begin
            BtnDecProdSetCount.Enabled := True;
            BtnDecProdSetCountState := BtnProdSetCountStIsEnbale;
        end;
        //������ͣ��ť
        if BtnProdPauseEnableState <> CtBtnProdPauseEnStIsTrue then    //������ͣ��ť Enable ��Trueֵ
        begin
            cxBtnProdPause.Enabled := True;
            BtnProdPauseEnableState := CtBtnProdPauseEnStIsTrue ;
        end;
        if BtnProdPauseCaptionState <> CtBtnProdPauseCaIsRestart then    //������ͣ��ť Caption �ǻָ����� ״̬
        begin
            cxBtnProdPause.Caption := '�ָ�����';
            BtnProdPauseCaptionState := CtBtnProdPauseCaIsRestart;
        end;
        //����������ť
        if BtnProdStartCaptionState <> CtBtnProdStatCpIsEnd then    //����������ť Caption Ϊ �ǽ������� ״̬
        begin
            BtnStartProd.Caption := 'ֹͣ����';
            BtnProdStartCaptionState := CtBtnProdStatCpIsEnd ;
        end;
    end
    else if InstrumentState and (1 shl 4) <> 0 then     //����������״̬ ��ʶ ��Ч
    begin
        //���һ�� ��ť
        if BtnIncProdSetCountState <> BtnProdSetCountStIsEnbale then    //����������ť ����Ч ״̬
        begin
            BtnIncProdSetCount.Enabled := True;
            BtnIncProdSetCountState := BtnProdSetCountStIsEnbale ;
        end;
        //����һ�� ��ť
        if BtnDecProdSetCountState <> BtnProdSetCountStIsEnbale then    //����������ť ����Ч ״̬
        begin
            BtnDecProdSetCount.Enabled := True;
            BtnDecProdSetCountState := BtnProdSetCountStIsEnbale;
        end;
        //������ͣ��ť
        if BtnProdPauseEnableState <> CtBtnProdPauseEnStIsTrue then    //������ͣ��ť Enable ��Trueֵ
        begin
            cxBtnProdPause.Enabled := True;
            BtnProdPauseEnableState := CtBtnProdPauseEnStIsTrue ;
        end;
        if BtnProdPauseCaptionState <> CtBtnProdPauseCpIsPause then    //������ͣ��ť Caption ��ͣ���� ״̬
        begin
            cxBtnProdPause.Caption := '��ͣ����' ;
            BtnProdPauseCaptionState := CtBtnProdPauseCpIsPause  ;
        end;
        //����������ť
        if BtnProdStartCaptionState <> CtBtnProdStatCpIsEnd then    //����������ť Caption Ϊ �ǽ������� ״̬
        begin
            BtnStartProd.Caption := 'ֹͣ����';
            BtnProdStartCaptionState := CtBtnProdStatCpIsEnd ;
        end;
    end;

    //��ֹ��ж ��ť
    if InstrumentState and (1 shl 8) <> 0 then    //��ֹ����ж�� ��ʶ��Ч
    begin
        if BtnAggrDisaDschState <> CntBtnCheckStateIsTrue then   //��ť״̬ Ϊ �ǹ�ѡ ״̬
        begin
            cxBtnAggreDschDsa.Glyph := Nil;
            ImageList1.GetBitmap(1,cxBtnAggreDschDsa.Glyph) ;
            BtnAggrDisaDschState := CntBtnCheckStateIsTrue ;
        end
    end
    else    //�ǽ�ֹ��ж ״̬
    begin
        if BtnAggrDisaDschState <> CntBtnCheckStateIsFalse then   //��ť״̬ Ϊ ���޹�ѡ ״̬
        begin
            cxBtnAggreDschDsa.Glyph := Nil;
            ImageList1.GetBitmap(0,cxBtnAggreDschDsa.Glyph) ;
            BtnAggrDisaDschState := CntBtnCheckStateIsFalse ;
        end;
    end;
    //��ֹͶ�� ��ť
    if InstrumentState and ( 1 shl 9 ) <> 0 then    //��ֹͶ�� ��ʶ��Ч
    begin
        if BtnMixerDisaLoadInState <> CntBtnCheckStateIsTrue then  //��ֹͶ�� ��ť Ϊ �ǹ�ѡ ״̬
        begin
            cxBtnMixerLoadDsa.Glyph := Nil;
            ImageList1.GetBitmap(1,cxBtnMixerLoadDsa.Glyph) ;
            BtnMixerDisaLoadInState := CntBtnCheckStateIsTrue;
        end;
    end
    else    //��ֹͶ�� ��ʶ��Ч
    begin
        if BtnMixerDisaLoadInState <> CntBtnCheckStateIsFalse then    //��ֹͶ�� ��ť Ϊ ���޹�ѡ ״̬
        begin
            cxBtnMixerLoadDsa.Glyph := Nil;
            ImageList1.GetBitmap(0,cxBtnMixerLoadDsa.Glyph) ;
            BtnMixerDisaLoadInState := CntBtnCheckStateIsFalse ;
        end;
    end;
    //��ֹж�� ��ť
    if InstrumentState and ( 1 shl 10 ) <> 0 then    //��ֹж�� ��ʶ��Ч
    begin
        if BtnMixerDisaDschState <> CntBtnCheckStateIsTrue then    //��ֹж�� ��ť Ϊ �ǹ�ѡ ״̬
        begin
            cxBtnMixerDschDsa.Glyph := Nil;
            ImageList1.GetBitmap(1, cxBtnMixerDschDsa.Glyph);
            BtnMixerDisaDschState := CntBtnCheckStateIsTrue;
        end;
    end
    else    //��ֹж�� ��ʶ��Ч
    begin
        if BtnMixerDisaDschState <> CntBtnCheckStateIsFalse then     //��ֹж�� ��ť Ϊ ���޹�ѡ ״̬
        begin
            cxBtnMixerDschDsa.Glyph := Nil;
            ImageList1.GetBitmap(0, cxBtnMixerDschDsa.Glyph);
            BtnMixerDisaDschState := CntBtnCheckStateIsFalse;
        end;
    end;
    //�Զ����� ��ť
    if AutoRingState and $0001 <> 0 then    //�Զ�����
    begin
        if BtnRingState <> CntBtnCheckStateIsTrue then    //�Զ����尴ť �ǹ�ѡ ״̬
        begin
            cxBtnRing.Glyph := Nil;
            ImageList1.GetBitmap(1, cxBtnRing.Glyph);
            BtnRingState := CntBtnCheckStateIsTrue;
        end;
    end
    else    //���Զ�����
    begin
        if BtnRingState <> CntBtnCheckStateIsFalse then    //�Զ����尴ť ���޹�ѡ ״̬
        begin
            cxBtnRing.Glyph := Nil;
            ImageList1.GetBitmap(0, cxBtnRing.Glyph);
            BtnRingState := CntBtnCheckStateIsFalse;
        end;
    end;

end;

procedure TFrmMain.TmrMscomStateDspTimer(Sender: TObject);
begin
   TmrMscomStateDsp.Enabled := False;
    
    {ͨѶ״̬��ʾ}
    case MscommStateInFrmMain of

        CntMscommCmdIsInvalid :    //��Ч
        begin

        end;

        CntMscommCmdIsCalZero :    //ͨѶ������У��
        begin
            if Instruction1ReceiveBuf[MscommReceiveBufPfInFrmMain].Active then
            begin
                if Instruction1ReceiveBuf[MscommReceiveBufPfInFrmMain].ReceiveCmd = $10 then
                begin
                    MscommStateInFrmMain := CntMscommCmdIsInvalid;
                    Showmessage('У��ɹ�');
                end;
            end
            else
            begin
                MscommTmrInFrmMain := MscommTmrInFrmMain + StatusDspTmr.Interval;
                if MscommTmrInFrmMain > 3000 then
                begin
                    Showmessage('У���ʧ��');
                    MscommStateInFrmMain := CntMscommCmdIsInvalid;
                end
                else
                begin
                    TmrMscomStateDsp.Enabled := True;
                end;
            end;
        end;

        CntMscommCmdIsCalValue :    //��ֵУ׼
        begin
            if Instruction1ReceiveBuf[MscommReceiveBufPfInFrmMain].Active then
            begin
                if Instruction1ReceiveBuf[MscommReceiveBufPfInFrmMain].ReceiveCmd = $10 then
                begin
                    MscommStateInFrmMain := CntMscommCmdIsInvalid;
                    FrmWeigherCalValue.Close;
                    Showmessage('��ֵУ׼�ɹ�');
                end;
            end
            else
            begin
                MscommTmrInFrmMain := MscommTmrInFrmMain + StatusDspTmr.Interval;
                if MscommTmrInFrmMain > 3000 then
                begin
                    Showmessage('��ֵУ׼ʧ��');
                    MscommStateInFrmMain := CntMscommCmdIsInvalid;
                end
                else
                begin
                    TmrMscomStateDsp.Enabled := True;
                end;
            end;
        end;
    end;
end;

procedure TFrmMain.NPerssonMangementClick(Sender: TObject);
begin
    if not FrmPersonnelMangementCrt then
    begin
        FrmPersonnelMangement := TFrmPersonnelMangement.Create(Nil);
        FrmPersonnelMangementCrt := True;
    end;
    FrmPersonnelMangement.ShowModal;
end;

procedure TFrmMain.m1Click(Sender: TObject);
begin
    if not FrmSetPassWordCrt then
    begin
        FrmSetPassWord := TFrmSetPassWord.Create(Nil);
        FrmSetPassWordCrt := True;
    end;
    FrmEditMode := FrmEdtMdIsSetPasdForPerson ;    //��Ա�޸�����
    FrmSetPassWord.ShowModal ;
end;

procedure TFrmMain.NMidBinParaClick(Sender: TObject);
begin
    if not FrmAggrConceyorHopperAttrCrt then
    begin
        FrmAggrConceyorHopperAttr := TFrmAggrConceyorHopperAttr.Create(Nil);
        FrmAggrConceyorHopperAttrCrt := True;
    end;
    FrmAggrConceyorHopperAttr.ShowModal;
end;

procedure TFrmMain.s1Click(Sender: TObject);
begin
    if not FrmMixParaCrt then
    begin
        FrmMixPara := TFrmMixPara.Create(Nil);
        FrmMixParaCrt := True;
    end;
    FrmMixPara.ShowModal;
end;

procedure TFrmMain.MixerImgContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
Var
    Img : TImage;
begin
    Img := TImage(Sender);
    PmSltMixerId := Img.Tag;
end;

procedure TFrmMain.SystemTmrTimer(Sender: TObject);
begin
    if SystemRunDelayTmr > 0 then
    begin
        SystemRunDelayTmr := SystemRunDelayTmr - CntSystemTmrInterval ;
    end;

    SoftAuthorCheckIntervai := SoftAuthorCheckIntervai + CntSystemTmrInterval;
    if SoftAuthorCheckIntervai > 4000000 then SoftAuthorCheckIntervai := 4000000;
    if (InstrumentState and (1 shl 6) <> 0 ) and (SoftRunState <> CntSoftIniInstrumentState) then
    begin
        if SoftAuthorCheckIntervai >= 3600000 then
        begin
            DspSoftAuthorInfo();    //��ʾ�����Ȩ
            SoftAuthorCheckIntervai := 0;
        end;
    end;
end;

procedure TFrmMain.cxBtnMixerDischOPenClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if MixerStateInInstru and (1 shl 5) = 0 then    //�����ж���� �����ź� ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0004 ); //�رս���ж���� �����ź�
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0001 ); //�򿪽���ж���� �����ź�
    end
    else
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0003 ); //�رս���ж���� �����ź�
    end;
end;

procedure TFrmMain.cxBtnMixerDischCloseClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if MixerStateInInstru and (1 shl 6) = 0 then    //�����ж���� �����ź� ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0003);    //�رս����ж���� �����ź�
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0002);    //�򿪽����ж���� �����ź�
    end
    else
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0220, $0004)    //�رս����ж���� �����ź�
    end;
end;

procedure TFrmMain.cxBtnAggreDschDsaClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if InstrumentState and ( 1 shl 8 ) = 0 then     //��ֹ��ж ��ʶ��Ч
    begin
         WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0005)    //��ֹ��ж
    end
    else    //��ֹ��ж ��ʶ��Ч
    begin
         WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0006)    //�����ж
    end;
end;

procedure TFrmMain.cxBtnMixerLoadDsaClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if InstrumentState and ( 1 shl 9 ) = 0 then     //��ֹͶ�� ��ʶ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0007)    //��ֹͶ��
    end
    else    //��ֹͶ�� ��ʶ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0008)    //����Ͷ��
    end;
end;

procedure TFrmMain.cxBtnMixerDschDsaClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
begin
    if InstrumentState and ( 1 shl 10 ) = 0 then     //��ֹж�� ��ʶ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0009);    //��ֹж��
    end
    else    //��ֹж�� ��ʶ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $000A);    //����ж��
    end;
end;

procedure TFrmMain.cxBtnRingClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer;
    NewRingState : Integer;
begin
    if AutoRingState and $0001 = 0 then    //�Զ����� ��ʶ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0710, $0001);    //�����Զ�����
        NewRingState := 1;
    end
    else    //�Զ����� ��ʶ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0710, $0000);    //��ֹ�Զ�����
        NewRingState := 0;
    end;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.SQL.Text := 'update Checker set Checked=' + '''' + inttostr(NewRingState) + '''' + ' where Equip=' + '''' + 'RingAuto' + '''';
        ADOquery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Showmessage('����ʧ��');
    end;
end;

procedure TFrmMain.cxBtnProdPauseClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer ;
begin
    if InstrumentState and ( 1 shl 4 ) <> 0 then    //���������� ��ʶ��Ч
    begin
        WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0003);    //��ͣ����
    end
    else if InstrumentState and ( 1 shl 5 ) <> 0 then    //������ͣվ ��ʶ��Ч
    begin
       WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $000B);    //�ָ�����
    end;
end;

procedure TFrmMain.BtnStartProdClick(Sender: TObject);
var
    WaitWtInstrumentReplyPt : Integer ;
    ProdSelRow : Integer;
    ExResult : Integer;
    i : Integer;

    AuthorRemainDays : Double;
    HaspKeyErrInfo   : String;
begin
    if InstrumentState and (1 shl 6) <> 0 then     //��ʼ״̬��ʶ��Ч����������
    begin
        if MixerStateInInstru and (1 shl 3) = 0 then //��������������
        begin
            Showmessage('�������������!');
            exit;
        end;

        if MixerStateInInstru and (1 shl 4) <> 0 then    //���������
        begin
            Showmessage('����������ϣ����ֶ�ж�գ�����������');
            exit;
        end;

        if AggrMidHopperStateInInstru and (1 shl 3) <> 0 then    //�������м�֣��������Ƿ�δж��
        begin
            case AggregateConveyorMode of    //�������ͷ�ʽ
                CntAggregateConveyorBelt     :      //Ƥ��
                begin
                    Showmessage('�����м��δж�ϣ���ж���м�֣�������������');
                end;

                CntAggregateConveyorElevator :      //������
                begin
                    Showmessage('����������δж�ϣ���ж����������������������');
                end;
            end;
            exit;
        end;

        if GetAuthorizedRemainingDays(EndRunDate, AuthorRemainDays, HaspKeyErrInfo) = 0 then
        begin
            if AuthorRemainDays <= 3 then
            begin
                if AuthorRemainDays > 0 then
                begin
                    Showmessage('�����Ȩʣ��' + Format('%.1f' , [AuthorRemainDays]) + '�죬�뼰ʱ��ϵ�����豸��Ӧ�̣�����Ӱ����������');
                end
                else
                begin
                    Showmessage('�����Ȩ�ѵ��ڣ�����ϵ�����豸��Ӧ�̣���ȡ�µ���Ȩ');
                    exit;
                end;
            end;
        end
        else
        begin
            Showmessage('��ȡ�����Ȩ����ʧ�ܣ�����ʧ��! ' + HaspKeyErrInfo);
        end;

        ProdWtPieceInDbEn := False;
        
        PresStartProd.Visible := True;

        ProdNoticeInfoRdPt := 1;             //�����ɳ�����Ϣ��ָ��
        ProdNoticeInfoWtPt := 1;             //�����ɳ�����Ϣдָ��

        ProdStartRow := AdvStrGdProdNotice.Row;

        ProdStart(ProdStartRow) ;

        //------------------------------------------------------------------------------------------


//        AdvStrGdProdNotice.ClearCols(1,1);
//        AdvStrGdProdNotice.AddDataImage(1, ProdStartRow, 0, haLeft, vaTop);    //��ʶ���ɳ�����ѡ��

        {������Ϣ��ʼ��}
//        IniProdNoticeInfo(ProdNoticeInfoWtPt);

        {��������Ϣ��ʼ��}
//        IniWeigherLoadInfoForProdStart();

        {����ֵ��Ϣ��ʼ��}
//        IniSiloLoadInfo();

        {��ʾ������Ϣ}
//        DspNoticeInfo( ProdStartRow );

        {��ֵ������Ϣ}
//        ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_Code := Trim(AdvStrGdProdNotice.cells[3, ProdStartRow]) ;
//        ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID := StrToInt(Trim(AdvStrGdProdNotice.cells[2, ProdStartRow]));

        {��ȡ��ȣ����͵���Ӧ���Ǳ�}
//        ExResult := GetProdRecipeToSiloRecipe( ProdStartRow );

        {�������}
//        if ExResult = 0 then
//        begin
//            ExResult := TaskBatchsProg( ProdStartRow );
//        end;

        {����Ŀ��ֵ}
//        if ExResult = 0 then
//        begin
//            ExResult := GetStorageLoadTargetForProdStart();    //��������ʱ��ȡ�ϲֵ�����Ŀ��ֵ
//        end;

        {������Ϣ��ʾ}
//        DspProdBatchInfoOnFrmMain(ProdNoticeInfoWtPt) ;

        {��ʾ�ϲֵ�����Ŀ��ֵ}
//        if ExResult = 0 then
//        begin
//            ExResult := DspStorageLoadTargetInFrmMainForProdStart() ;    //������������ʾ�ϲ�����Ŀ��ֵ
//        end;

        {�Ǳ�����Ŀ��ֵ}
//        if ExResult = 0 then
//        begin
//            ExResult := GetWeigherLoadTargetForProdStart();    //��ȡ������Ŀ��ֵ
//        end;

//        if Exresult = 0 then
//        begin
//            PresStartProd.Position := 20;
//            ExResult := WriteWghrLoadTargetToInstruForProdStart();    //д������Ŀ��ֵ���Ǳ�
//        end;

//        if ExResult = 0 then
//        begin
//            StartProdSteps := CtStartProdStepIsWtLdTarget;    //������������Ϊд����Ŀ��ֵ
//            TmrStartProd.Enabled := True;    //������ʱ��
//            StartProdCmdLng := 0;
//        end
//        else
//        begin
//            PresStartProd.Visible := False;
//        end;

        //------------------------------------------------------------------------
    end
    else    //��������
    begin
        if messagebox(getfocus, Pchar('���������У�ȷ��Ҫֹͣ������?'), 'ȷ����Ϣ', MB_OKCANCEL ) = idOK then
        begin
            WtAWordToInstument1MscommBuf(WaitWtInstrumentReplyPt, $0200, $0002);    //��������
        end;
    end;
end;

procedure TFrmMain.ProdStart(ProdRow : Integer) ;     //��������
var
    ExResult : Integer;
begin
    AdvStrGdProdNotice.ClearCols(1,1);
    AdvStrGdProdNotice.AddDataImage(1, ProdRow, 0, haLeft, vaTop);    //��ʶ���ɳ�����ѡ��

    {������Ϣ��ʼ��}
    IniProdNoticeInfo(ProdNoticeInfoWtPt);

    {��������Ϣ��ʼ��}
    IniWeigherLoadInfoForProdStart();

    {����ֵ��Ϣ��ʼ��}
    IniSiloLoadInfo();

    {��ʾ������Ϣ}
    DspNoticeInfo( ProdRow );

    {��ֵ������Ϣ}
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_Code := Trim(AdvStrGdProdNotice.cells[3, ProdRow]) ;
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID := StrToInt(Trim(AdvStrGdProdNotice.cells[2, ProdRow]));

    {��ȡ��ȣ����͵���Ӧ���Ǳ�}
    ExResult := GetProdRecipeToSiloRecipe( ProdRow );

    {�������}
    if ExResult = 0 then
    begin
        ExResult := TaskBatchsProg( ProdRow );
    end;

    {����Ŀ��ֵ}
    if ExResult = 0 then
    begin
        ExResult := GetStorageLoadTargetForProdStart();    //��������ʱ��ȡ�ϲֵ�����Ŀ��ֵ
    end;

    {������Ϣ��ʾ}
    DspProdBatchInfoOnFrmMain(ProdNoticeInfoWtPt) ;

    {��ʾ�ϲֵ�����Ŀ��ֵ}
    if ExResult = 0 then
    begin
        ExResult := DspStorageLoadTargetInFrmMainForProdStart() ;    //������������ʾ�ϲ�����Ŀ��ֵ
    end;

    {�Ǳ�����Ŀ��ֵ}
    if ExResult = 0 then
    begin
        ExResult := GetWeigherLoadTargetForProdStart();    //��ȡ������Ŀ��ֵ
    end;

    if Exresult = 0 then
    begin
        PresStartProd.Position := 20;
        ExResult := WriteWghrLoadTargetToInstruForProdStart();    //д������Ŀ��ֵ���Ǳ�
    end;

    if ExResult = 0 then
    begin
        StartProdSteps := CtStartProdStepIsWtLdTarget;    //������������Ϊд����Ŀ��ֵ
        TmrStartProd.Enabled := True;    //������ʱ��
        StartProdCmdLng := 0;
    end
    else
    begin
        PresStartProd.Visible := False;
    end;

end;

procedure TFrmMain.IniProdNoticeInfo(ProdNoticeInfoNumber : Integer);    //��ʼ�������ɳ�����Ϣ
var
    i, k : Integer;
begin
    ProdNoticeInfo[ProdNoticeInfoNumber].LdStorageCounter := 0;    //����������Ŀ��ֵ���ϲ�����

    for i := 1 to CntStorageCount do
    begin
        ProdNoticeInfo[ProdNoticeInfoNumber].SiloLoadEn[i]        := False;
        ProdNoticeInfo[ProdNoticeInfoNumber].SiloLdNumInNotice[i] := 0;

        {�ϲ������䷽��Ϣ}
        for k:=1 to CntProdStoraLdRceQueueLen do
        begin
            ProdNoticeInfo[ProdNoticeInfoNumber].ProdStoraLdRecipe[i][k].EndBatchNumber := 0;      //�ϲ��䷽ֵ�����ʼ�̺�
            ProdNoticeInfo[ProdNoticeInfoNumber].ProdStoraLdRecipe[i][k].LoadRecipe       := 0;    //�ϲ��䷽��ֵ
        end;
        ProdNoticeInfo[ProdNoticeInfoNumber].ProdStoraLdRecWtPt[i] := 1;    //�ϲ����ֵ������дָ��
        ProdNoticeInfo[ProdNoticeInfoNumber].ProdStoraLdRecRdPt[i] := 1;    //�ϲ����ֵ��������ָ��

        {�ϲ�����Ŀ��ֵ��Ϣ}
        for k:=1 to CntProdStoraLdRceQueueLen do
        begin
            ProdNoticeInfo[ProdNoticeInfoNumber].ProdStorageLdTarget[i][k].EndBatchNumber := 0;    //�ϲ�����Ŀ��ֵ�����ʼ�̴�
            ProdNoticeInfo[ProdNoticeInfoNumber].ProdStorageLdTarget[i][k].LoadTarget       := 0;    //�ϲ��µ�����Ŀ��ֵ
        end;
        ProdNoticeInfo[ProdNoticeInfoNumber].ProdStorageLdTargWtPt[i] := 1;  //�����ϲ�����Ŀ��ֵ����дָ��
        ProdNoticeInfo[ProdNoticeInfoNumber].ProdStorageLdTargRdPt[i] := 1;  //�����ϲ�����Ŀ��ֵ���ж�ָ��

        {�ϲ�ԭ�Ϻ�ˮ����Ϣ}
        for k:=1 to CntStorMatWatFulQueueLen do
        begin
            ProdNoticeInfo[ProdNoticeInfoNumber].StorageMaterialWatFul[i][k].BeginBatchNumber := 0;     //�ϲ�ԭ�Ϻ�ˮ��ֵ�仯��ʼ�̴�
            ProdNoticeInfo[ProdNoticeInfoNumber].StorageMaterialWatFul[i][k].WatFul           := 0.0;   //�ϲ�ԭ�Ϻ�ˮ��ֵ��ֵ
        end;
        ProdNoticeInfo[ProdNoticeInfoNumber].StorMatWatFulWtPt[k] := 1;    //�ϲֺ�ˮ��ֵдָ��
        ProdNoticeInfo[ProdNoticeInfoNumber].StorMatWatFulRdPt[k] := 1;    //�ϲֺ�ˮ��ֵ��ָ��

        ProdNoticeInfo[ProdNoticeInfoNumber].WtDbPieceId := 0;           //���ݿ��Ѽ�¼�̴�
    end;
end;

procedure TFrmMain.IniWeigherLoadInfoForProdStart();    //��������ʱ���Ǳ�������Ϣ��ʼ��
var
    i, k : Integer;
begin
    for i:=1 to WeigherCount do    //�Ǳ���
    begin
         WeigherLoadInfo[i].RecordBatchCount := 0;
         WeigherLoadInfo[i].WtLoadValuePt := 1;
         WeigherLoadInfo[i].RdLoadValuePt := 1;

         WeigherLoadInfo[i].LoadFactDsp := False;
         WeigherLoadInfo[i].RdFactLoadEna := False;
         WeigherLoadInfo[i].Rd2ndLoadEna  := False;    //���۳�����ֵʹ��λ
         WeigherLoadInfo[i].RdFactWaitPt  := 0;

         WeigherLoadInfo[i].LoadTarget[1] := 0;
         WeigherLoadInfo[i].LoadTarget[2] := 0;
         WeigherLoadInfo[i].LoadTarget[3] := 0;
         WeigherLoadInfo[i].LoadTarget[4] := 0;

         //for k:=1 to CntLoadValueQueueLen do    //���б��
         //begin
             

         //    WeigherLoadInfo[i].LoadFact[k][1] := 0;
         //    WeigherLoadInfo[i].LoadFact[k][2] := 0;
         //    WeigherLoadInfo[i].LoadFact[k][3] := 0;
         //    WeigherLoadInfo[i].LoadFact[k][4] := 0;
         //end;
    end;
end;

procedure TFrmMain.IniSiloLoadInfo();                                           //��ʼ��������Ϣ
var
    i, k : Integer;
begin
    for i:=1 to CntStorageCount do
    begin
        SiloLoadInfo[i].WtPt := 1;
        SiloLoadInfo[i].RdPt := 1;
        for k:=1 to 4 do
        begin
            SiloLoadInfo[i].LoadFact[k]    := 0.0;
            SiloLoadInfo[i].ErrorIsOver[k] := CntLdErrIsNone;    //�޳���
        end;
    end;
end;

Function TFrmMain.GetProdRecipeToSiloRecipe(TaskGrdRow : Integer) : Integer;    //��ȡ�ϲ��䷽ֵ
//����ֵ0 ��ȡ�ɹ�
var
    RecipeIdInInfoDb : Integer;
    TestStr : String;
    i,k : Integer;
    QueueWtPt : Integer;
begin
    Result := 0;

    ProdNoticeInfo[ProdNoticeInfoWtPt].LdStorageCounter := 0;
    for i:=1 to CntStorageCount do
    begin
        //�����ϲ��䷽
        ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLoadEn[i] := False;
        ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLdNumInNotice[i] := 0;
        for k:=1 to CntProdStoraLdRceQueueLen do
        begin
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][k].EndBatchNumber := 0;
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][k].LoadRecipe := 0.0;
        end;
    end;

    {��ʼ��������ϲ�����ֵ}
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdRecipe_Code := Trim( AdvStrGdProdNotice.Cells[4, TaskGrdRow] );    //�������
    if ProdNoticeInfo[ProdNoticeInfoWtPt].ProdRecipe_Code = '' then
    begin
        Showmessage('�����ϢΪ��');
        Result := 1;
    end
    else
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'select ID from RecipeInfo where Code ='
                            + '''' + ProdNoticeInfo[ProdNoticeInfoWtPt].ProdRecipe_Code + '''';
        ADOQuery1.Open;
        if ADOQuery1.Eof then
        begin
            ADOQuery1.Close;
            Result := 2;
            Showmessage('��Ч����ȱ��');
            exit;
        end
        else
        begin
            RecipeIdInInfoDb := ADOQuery1.FieldByName('ID').AsInteger;
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Text := 'select * from RecipeLst where RecipeInfoID=' + inttostr(RecipeIdInInfoDb);
            ADOQuery1.Open;

            while not ADOQuery1.Eof do
            begin
                for i:=1 to CntStorageCount do
                begin
                    if StorageInfo[i].MaterId = ADOQuery1.FieldByName('MaterId').AsInteger then    //ƥ���ϲ�
                    begin
                        break;
                    end;
                end;
                if i <= CntStorageCount then
                begin
                    QueueWtPt := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecWtPt[i];
                    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][QueueWtPt].EndBatchNumber := 1;
                    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][QueueWtPt].LoadRecipe := ADOQuery1.FieldByName('Amount').AsFloat;
                    if ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][QueueWtPt].LoadRecipe > 0.01 then
                    begin
                        ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLoadEn[i] := True;
                        ProdNoticeInfo[ProdNoticeInfoWtPt].LdStorageCounter := ProdNoticeInfo[ProdNoticeInfoWtPt].LdStorageCounter +1;
                        ProdNoticeInfo[ProdNoticeInfoWtPt].SiloLdNumInNotice[i] := ProdNoticeInfo[ProdNoticeInfoWtPt].LdStorageCounter;
                    end;
                end
                else
                begin
                    Showmessage('û���ҵ���֮��Ӧ���ϲ֣�' );
                    Result := 3;
                    Break;
                end;
                ADOQuery1.Next;
            end;
        end;
    end;
end;

Function TFrmMain.TaskBatchsProg(TaskGrdRow : Integer) : Integer;    //������̴���
//����ֵ=0��������̳ɹ�
var
    TempProdAmount : Double;
    TempCount : Integer;
    TempBatchAmount : Double;
    TempProdAmountErr : Double;
begin

    Result := 0;

    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount      := 0;    //������������
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchsCount := 0;    //������������
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount := 0;    //�����̷���
    
    if Trim(AdvStrGdProdNotice.Cells[6, TaskGrdRow]) <> '' then
    begin
        try
            TempProdAmount := StrToFloat(Trim(AdvStrGdProdNotice.Cells[6, TaskGrdRow]));
            TempProdAmount := roundTo(TempProdAmount, -3);
        except
            Result := 1;
            Exit;
        end;
    end
    else
    begin
        Result := 2;
        exit;
    end;

    if MixerInfo.MaxCap < 0.0001 then
    begin
        Result := 3;
        Showmessage('����������������');
        Exit;
    end;

    TempCount := Trunc(TempProdAmount / MixerInfo.MaxCap);
    if TempCount <= 0 then TempCount := 1;

    TempBatchAmount   := RoundTo(TempProdAmount / TempCount, -3);
    if TempBatchAmount > MixerInfo.MaxCap then TempBatchAmount := MixerInfo.MaxCap;

    TempProdAmountErr := TempProdAmount - TempBatchAmount * TempCount;
    if (TempProdAmountErr >0) and (TempProdAmountErr > 0.01) then
    begin
        TempCount       := TempCount +1;
        TempBatchAmount := RoundTo(TempProdAmount / TempCount, -3);
    end;

    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount      := TempProdAmount;   //�����ɳ�������������
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchsCount := TempCount;        //�����ɳ�������������
    ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount := TempBatchAmount;  //�����ɳ������ĵ��̷���}

end;

Function TFrmMain.GetStorageLoadTargetForProdStart() : Integer;    //��ȡ�ϲֵ�����Ŀ��ֵ
var
    i : Integer;

    TmpStorageMatWatFulWtPt ,
    TmpStorageMatWatFulRdPt : Integer;    //�ϲ�ԭ�Ϻ�ˮ�ʶ��ж�ȡָ��
    TmpMatWatFul : Double;                //��ˮ��
    WaterInAggr ,
    WaterSumInAggr: Double;

    TempStorageTarget : Double;
    TmpStorageRecQueueRdPt : Integer;    //�ϲ���ȶ��ж�ָ��
    TmpStorageRecipe : Double;

    TmpStorLdTargetQueueWtPt : Integer;    //�ϲ�����Ŀ��ֵ����дָ��
begin
    {for i:=1 to CntStorageCount do
    begin
        //StorageLoadTarget[i] := 0.0;
        ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdTarget[i] := 0.0;
    end;

    WaterSumInAggr := 0;
    }
    {�����������Ŀ��ֵ}
    {for i:=1 to CntStorageCount do
    begin
        if ( StorageInfo[i].Enable ) and (StorageInfo[i].Model = CntAggregateStorage) then
        begin
            StorageLoadTarget[i] := StorageLoadRecipe[i] * ProdBatchAmount;
            WaterInAggr :=StorageInfo[i].Moisture * StorageLoadTarget[i] /100;
            WaterSumInAggr := WaterSumInAggr + WaterInAggr;
            StorageLoadTarget[i] := StorageLoadTarget[i] + WaterInAggr;
        end;
    end;
    }
    {������������������}
    {for i:=1 to CntStorageCount do
    begin
        if ( StorageInfo[i].Enable ) and (StorageInfo[i].Model <> CntAggregateStorage) then    //�ǹ��ϲ�
        begin
            if (StorageInfo[i].Model = CntWaterStorage) then    //ˮ��
            begin
                StorageLoadTarget[i] := StorageLoadRecipe[i] * ProdBatchAmount;
                StorageLoadTarget[i] := StorageLoadTarget[i] - WaterSumInAggr;
                if StorageLoadTarget[i] < 0 then StorageLoadTarget[i] := 0;
            end
            else    //������
            begin
                StorageLoadTarget[i] := StorageLoadRecipe[i] * ProdBatchAmount;
            end;
        end;
    end;}

    //----------------------------------------------------------------------------

    WaterSumInAggr := 0;

    {�����������Ŀ��ֵ}
    for i:=1 to CntStorageCount do
    begin
        if ( StorageInfo[i].Enable ) and (StorageInfo[i].Model = CntAggregateStorage) then    //�ϲ���Ч�����ǹ��ϲ�
        begin
            TmpStorageRecQueueRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i];
            TmpStorageRecipe := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][TmpStorageRecQueueRdPt].LoadRecipe;    //�ϲ����ֵ
            TempStorageTarget := TmpStorageRecipe * ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount;    //������ϵĸ�������

            TmpStorageMatWatFulWtPt := ProdNoticeInfo[ProdNoticeInfoWtPt].StorMatWatFulWtPt[i];
            ProdNoticeInfo[ProdNoticeInfoWtPt].StorageMaterialWatFul[i][TmpStorageMatWatFulWtPt].BeginBatchNumber := 1;
            ProdNoticeInfo[ProdNoticeInfoWtPt].StorageMaterialWatFul[i][TmpStorageMatWatFulWtPt].WatFul := StorageInfo[i].Moisture;

            TmpStorageMatWatFulRdPt := ProdNoticeInfo[ProdNoticeInfoWtPt].StorMatWatFulRdPt[i];    //�ϲ�ԭ�Ϻ�ˮ�ʶ��ж�ȡָ��
            TmpMatWatFul := ProdNoticeInfo[ProdNoticeInfoWtPt].StorageMaterialWatFul[i][TmpStorageMatWatFulRdPt].WatFul;    //ԭ�Ϻ�ˮ��ֵ
            WaterInAggr := TmpMatWatFul * TempStorageTarget / 100;
            WaterSumInAggr := WaterSumInAggr + WaterInAggr;

            TempStorageTarget := TempStorageTarget + WaterInAggr;

            TmpStorLdTargetQueueWtPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargWtPt[i];
            ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].EndBatchNumber := 1;
            ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].LoadTarget := TempStorageTarget;

        end;
    end;

    {������������������}
    for i:=1 to CntStorageCount do
    begin
        if ( StorageInfo[i].Enable ) and (StorageInfo[i].Model <> CntAggregateStorage) then    //�ǹ��ϲ�
        begin
            if (StorageInfo[i].Model = CntWaterStorage) then    //ˮ��
            begin
                TmpStorageRecQueueRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i];
                TmpStorageRecipe := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][TmpStorageRecQueueRdPt].LoadRecipe;    //�ϲ����ֵ
                TempStorageTarget := TmpStorageRecipe * ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount;    //��������

                TempStorageTarget := TempStorageTarget - WaterSumInAggr;

                TmpStorLdTargetQueueWtPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargWtPt[i];
                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].EndBatchNumber := 1;
                if TempStorageTarget < 0 then
                    ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].LoadTarget := 0
                else
                    ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].LoadTarget := TempStorageTarget;
            end
            else    //������
            begin
                TmpStorageRecQueueRdPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStoraLdRecRdPt[i];
                TmpStorageRecipe := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStoraLdRecipe[i][TmpStorageRecQueueRdPt].LoadRecipe;    //�ϲ����ֵ
                TempStorageTarget := TmpStorageRecipe * ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchAmount;    //��������

                TmpStorLdTargetQueueWtPt := ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTargWtPt[i];
                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].EndBatchNumber := 1;
                ProdNoticeInfo[ProdNoticeInfoRdPt].ProdStorageLdTarget[i][TmpStorLdTargetQueueWtPt].LoadTarget := TempStorageTarget;
            end;
        end;
    end;

    Result := 0;
end;

Function TFrmMain.DspProdBatchInfoOnFrmMain(ProdNoticeId : Integer) : Integer;  //����������ʾ����������Ϣ
var
    TempBatchCounter : Integer;
    NodRow : Integer;
    i : Integer;
    GrdRow : Integer;
    WghrDecimal : Integer;
begin
    //AdvStrGdProRd.ClearRows();
    //if AdvStrGdProRd.RowCount > 2 then AdvStrGdProRd.RemoveRows(1, AdvStrGdProRd.RowCount -2);
    //AdvStrGdProRd.ClearRows(1,1);

    AdvStrGdProRd.ClearAll;
    IniAdvStrGdProRd();
    
    AdvStrGdProRd.RowCount := ProdNoticeInfo[ProdNoticeId].ProdBatchsCount * (ProdNoticeInfo[ProdNoticeId].LdStorageCounter +1) +1;
    //for i:= 1 to AdvStrGdProRd.RowCount - 1 do
    //begin
    //    AdvStrGdProRd.Rows[i].Clear;
    //end;

    GrdRow := 1;
    TempBatchCounter := 1;
    while TempBatchCounter <= ProdNoticeInfo[ProdNoticeId].ProdBatchsCount do
    begin
        NodRow := GrdRow;
        GrdRow := GrdRow +1;
       
        for i:= 1 to CntStorageCount do
        begin
            if not ProdNoticeInfo[ProdNoticeId].SiloLoadEn[i] then Continue;

            WghrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value ;

            AdvStrGdProRd.Rows[GrdRow].Clear;

            AdvStrGdProRd.AllCells[1, GrdRow] := StorageInfo[i].MaterName;    //��������
            AdvStrGdProRd.AllCells[2, GrdRow] := Format( '%.' + inttostr(WghrDecimal) + 'f',
                                                      [ProdNoticeInfo[ProdNoticeId].ProdStoraLdRecipe[i][1].LoadRecipe] );   //���ֵ
            AdvStrGdProRd.AllCells[3, GrdRow] := Format( '%.' + inttostr(WghrDecimal) + 'f',
                                                      [ProdNoticeInfo[ProdNoticeId].ProdStorageLdTarget[i][1].LoadTarget] );   //����Ŀ��ֵ
            //AdvStrGdProRd.AllCells[4, GrdRow] := Format( '%.' + inttostr(WghrDecimal) + 'f', [0.0] );
            AdvStrGdProRd.AllCells[4, GrdRow] := '0';
            AdvStrGdProRd.AllCells[5, GrdRow] := '0';
            AdvStrGdProRd.AllCells[6, GrdRow] := inttostr(i);
            AdvStrGdProRd.AllCells[7, GrdRow] := '0';
            AdvStrGdProRd.AllCells[8, GrdRow] := inttostr(TempBatchCounter);

            GrdRow := GrdRow + 1;
        end;

        AdvStrGdProRd.Rows[GrdRow].Clear;
        AdvStrGdProRd.AddNode(NodRow, GrdRow - NodRow);
        AdvStrGdProRd.AllCells[1, NodRow] := '��' + inttostr(TempBatchCounter) + '��';

        TempBatchCounter := TempBatchCounter +1;
    end;

    AdvStrGdProRd.ContractAll;
end;

Function TFrmMain.DspStorageLoadTargetInFrmMainForProdStart() : Integer;        //������������ʾ�ϲ�����Ŀ��ֵ
var
    WgrDecimal : Integer;
    i : integer;
    TempLdTarget : double;
begin
    {Result := 0;

    for i:=1 to CntStorageCount do
    begin
        if StorageInfo[i].Enable then
        begin
            WgrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;
            StorageLoadTargetLab[i].Caption := format('%.' + inttostr(WgrDecimal) + 'f', [StorageLoadTarget[i]]) ;
        end;
    end;}

    Result := 0;

    for i:=1 to CntStorageCount do    //�ϲֱ��
    begin
        if StorageInfo[i].Enable then
        begin
            WgrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;
            TempLdTarget := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStorageLdTarget[i][1].LoadTarget;
            StorageLoadTargetLab[i].Caption := format('%.' + inttostr(WgrDecimal) + 'f', [ TempLdTarget ]) ;
        end;
    end;
end;

function TFrmMain.GetWeigherLoadTargetForProdStart() : integer;    //��ȡ�Ƶ�����Ŀ��ֵ
var
    i, k : Integer;
    WghrIdOfStorage : Integer;
    LoadNoInWgr     : Integer;
    WgrDecimal      : Integer;
    TmpLoadValue    : Double;
begin
    {Result := 0;

    for i:=1 to WeigherCount do
    begin
        for k:=1 to 4 do
        begin
            WeigherLoadTarget[i][k] := 0;
        end;
    end;

    for i:= 1 to CntStorageCount do
    begin
        if StorageInfo[i].Enable then
        begin
            WeigherId   := StorageInfo[i].InstrumentId;
            LoadNoInWgr := StorageInfo[i].LoadNo;
            if (WeigherId < 1) or (WeigherId > WeigherCount) then
            begin
                Result := 1;
                Showmessage(inttostr(i) + '#�ϲֵĳƱ�ŷǷ�');
                break;
            end
            else if ( LoadNoInWgr < 1 ) or ( LoadNoInWgr > 4 ) then
            begin
                Result := 2;
                Showmessage( inttostr(i) + '#�ϲֵ�������ŷǷ�');
                Showmessage(inttostr(LoadNoInWgr));
                break;
            end
            else
            begin
                WgrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;
                WeigherLoadTarget[WeigherId][LoadNoInWgr] := Trunc(RoundTo(StorageLoadTarget[i] * power(10, WgrDecimal), -0));
            end;
        end;
    end;}

    Result := 0;

    for i:= 1 to CntStorageCount do    //�ϲֱ��
    begin
        if StorageInfo[i].Enable then
        begin
            WghrIdOfStorage := StorageInfo[i].InstrumentId;
            LoadNoInWgr     := StorageInfo[i].LoadNo;
            if (WghrIdOfStorage < 1) or (WghrIdOfStorage > WeigherCount) then
            begin
                Result := 1;
                Showmessage(inttostr(i) + '#�ϲֵĳƱ�ŷǷ�');
                break;
            end
            else if ( LoadNoInWgr < 1 ) or ( LoadNoInWgr > 4 ) then
            begin
                Result := 2;
                Showmessage( inttostr(i) + '#�ϲֵ�������ŷǷ�');
                Showmessage(inttostr(LoadNoInWgr));
                break;
            end
            else
            begin
                WgrDecimal := WeigherPara[StorageInfo[i].InstrumentId][CntWeigherDecimalIndex].Value;
                TmpLoadValue := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdStorageLdTarget[i][1].LoadTarget;
                WeigherLoadInfo[WghrIdOfStorage].LoadTarget[LoadNoInWgr] := Trunc(RoundTo(TmpLoadValue * power(10, WgrDecimal), -0) );
            end;
        end;
    end;
end;

function TFrmMain.WriteWghrLoadTargetToInstruForProdStart() : INteger;    //д������Ŀ��ֵ���Ǳ�
var
    i,k : Integer;
    SendData : array[0..63] of Integer;
begin
    {for i:=1 to WeigherCount do
    begin
        for k:=1 to 4 do
        begin
            SendData[(i-1)*4 + (k-1)] := WeigherLoadTarget[i][k];
        end;
    end;

    if WtWordSToInstucment1MscommBuf( StartProdMscomWaitRevPt, $0800, SendData, 64 ) = 1 then    //д�������ͨѶ������
        Result := 0
    else
        Result := 1;
    }

    for i:=1 to WeigherCount do    //i=���ϳƺ�
    begin
        for k:=1 to 4 do
        begin
            SendData[(i-1)*4 + (k-1)] := WeigherLoadInfo[i].LoadTarget[k];
        end;
    end;

    if WtWordSToInstucment1MscommBuf( StartProdMscomWaitRevPt, $0800, SendData, 64 ) = 1 then    //д�������ͨѶ������
        Result := 0
    else
        Result := 1;
end;

procedure TFrmMain.cxButton2Click(Sender: TObject);
var
    SelRow : Integer;
    NoticeId : Integer;
begin
    if messagebox(getfocus, Pchar('ȷ��Ҫɾ��ѡ�е��ɳ�����?'), 'ȷ����Ϣ', MB_OKCANCEL ) = idOK then
    begin
        SelRow := AdvStrGdProdNotice.Row ;

        if Trim(AdvStrGdProdNotice.Cells[2, SelRow]) = '' then
        begin
            Showmessage('��Ч���ɵ�');
        end
        else
        begin
            NoticeId := StrToInt(Trim(AdvStrGdProdNotice.Cells[2, SelRow]));

            try
                ADOConnection.BeginTrans;
                ADOQuery1.Close;
                ADOQuery1.SQL.Clear;
                ADOQuery1.SQL.Text := 'delete * from ProdNotice where ID=' + IntToStr(NoticeId);
                ADOquery1.ExecSQL;
                ADOConnection.CommitTrans;
                AdvStrGdProdNotice.Rows[SelRow].Clear;
                AdvStrGdProdNotice.RemoveRows(SelRow, 1);
            except
                ADOConnection.RollbackTrans;
                Showmessage('ɾ��ʧ��')
            end;
            //showmessage(Inttostr( NoticeId ) );


        end;
    end;
end;

procedure TFrmMain.TmrStartProdTimer(Sender: TObject);
var
    WtDbResult : Integer;
begin
    TmrStartProd.Enabled := False;

    if Instruction1ReceiveBuf[StartProdMscomWaitRevPt].Active then
    begin
        Instruction1ReceiveBuf[StartProdMscomWaitRevPt].Active := False;

        case StartProdSteps of
            CtStartProdStepIsWtLdTarget :    //������������Ϊд����Ŀ��ֵ
            begin
                PresStartProd.Position := 30;
                WtAWordToInstument1MscommBuf(StartProdMscomWaitRevPt,
                  $0840,
                  ProdNoticeInfo[ProdNoticeInfoWtPt].ProdBatchsCount
                );     //д����Ŀ������
                StartProdSteps := CtStartProdStepIsWtProdBatchCount;
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := True;
            end;

            CtStartProdStepIsWtProdBatchCount :
            begin
                PresStartProd.Position := 40;
                WtAWordToInstument1MscommBuf( StartProdMscomWaitRevPt,
                  $0844,
                  //Trunc(RoundTo( *100, -0))
                  Trunc( RoundTo(ProdNoticeInfo[ProdNOticeInfoWtPt].ProdBatchAmount * 100 , -0) )
                );     //д������������
                StartProdSteps := CtStartProdStepIsWtBatchAmount;    //д���̷������Ǳ�
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := True;
            end;

            CtStartProdStepIsWtBatchAmount :
            begin
                PresStartProd.Position := 50;
                WtAWordToInstument1MscommBuf( StartProdMscomWaitRevPt,
                  $0845,
                  //Trunc(RoundTo(ProdAmount *100, -0) )
                  Trunc(RoundTo(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount *100, -0) )
                );     //д������
                StartProdSteps := CtStartProdStepIsWtProdAmount;    //д���������Ǳ�
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := True;
            end;

            CtStartProdStepIsWtProdAmount :
            begin
               PresStartProd.Position := 60;
                WtStorageReplaceInfo();
                StartProdSteps := CtStartProdStepIsWtStorageReplace;    //д�ϲ��滻��Ϣ
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := True;
            end;

            CtStartProdStepIsWtStorageReplace :
            begin
                PresStartProd.Position := 70;
                WtAWordToInstument1MscommBuf( StartProdMscomWaitRevPt, $0200, $0001 );     //дһ���ֵ�ͨѶ������
                StartProdSteps := CtStartProdStepIsWtStartCmdI;    //д��������I
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := true;
            end;

            CtStartProdStepIsWtStartCmdI :
            begin
                PresStartProd.Position := 80;
                WtAWordToInstument1MscommBuf( StartProdMscomWaitRevPt, $0200, $0004 );     //дһ���ֵ�ͨѶ������
                StartProdSteps := CtStartProdStepIsWtStartCmdII;    //д��������I
                StartProdCmdLng := 0;
                TmrStartProd.Enabled := true;
            end;

            CtStartProdStepIsWtStartCmdII :
            begin
                PresStartProd.Position := 90;
                //д���ݿ�
                WtDbResult := WtProduceTbForProdStart();
                case WtDbResult of
                    0:
                    begin
                        PresStartProd.Position := 100;
                        PresStartProd.Visible := False;
                        TmrStartProd.Enabled := False;
                    end;

                    else
                    begin
                        Showmessage('д����������������������ݼ�¼����');
                    end;
                end;

                if CkFrstBatchPrtDevl.Checked then
                begin
                    //FrmDeliveryPreview.sEdtProdId.Text := Format('%.d', [ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_IdInDb]);
                    FrmDeliveryPreview.Show;
                end;
            end;
        end;

    end
    else
    begin
        StartProdCmdLng := TmrStartProd.Interval;
        if StartProdCmdLng >= 30000 then
        begin
            TmrStartProd.Enabled := False;
            Showmessage('�������ʱ!');
        end
        else
        begin
            TmrStartProd.Enabled :=  True;
        end;
    end; 
end;

procedure TFrmMain.WtStorageReplaceInfo();    //д�ϲ��滻��Ϣ���Ǳ�
var
    i : Integer;
    SendData : array[0..15] of Integer;
begin
    for i:=0 to 15 do
    begin
        SendData[i] := 0;
    end;
    WtWordSToInstucment1MscommBuf( StartProdMscomWaitRevPt, $07A0, SendData, 16);     //д�������ͨѶ������
end;

function TFrmMain.WtProduceTbForProdStart() : Integer;
var
    TmpTaskCode : String;
begin
    TmpTaskCode := ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_Code ;

    try
        ADOConnection.BeginTrans;

        ADOQuery1.Close ;
        ADOQuery1.SQL.Clear;

        if TmpTaskCode <> '' then
        begin
            ADOQuery1.SQL.Text := 'insert into Produce (Code'
                                + ',ContractNO'
                                + ',DatTim'
                                + ',Characters'
                                + ',Customer'
                                + ',ProjName'
                                + ',ProjType'
                                + ',ProjGrade'
                                + ',ProjAdr'
                                + ',Distance'
                                + ',ConsPos'
                                + ',Pour'
                                + ',Variety'
                                + ',BetLev'
                                + ',Filter'
                                + ',Freeze'
                                + ',Lands'    //̮���
                                + ',Cement'   //ˮ��Ʒ��
                                + ',Stone'    //
                                + ',BnSize'
                                + ',AddLiq'
                                + ',Request'
                                + ',Recipe'
                                + ',MixLast'
                                + ',Operator'
                                + ',ProdTimB'    //������ʼʱ��
                                + ',ProdMete'    //��������
                                + ',TotVehs'     //�ۼƳ���
                                + ',TotMete'     //�ۼƷ���
                                + ',Vehicle'
                                + ',Driver'      //��ʻԱ

                                + ') select [Code]'
                                + ',[ContractNO]'
                                + ',' + FloatToStr(Now())    //������ʼʱ��
                                + ',[Characters]'
                                + ',Customer'
                                + ',ProjNm'
                                + ',ProjVariety'
                                + ',ProjGrade'
                                + ',ProjAddr'
                                + ',Distance'
                                + ',CastPart'
                                + ',PourMethod'
                                + ',ConcrVariety'
                                + ',ConcrStrength'
                                + ',ConcrSeepage'
                                + ',ConcrFrost'
                                + ',ConcrSlump'    //̮���
                                + ',CementSpec'    //ˮ��Ʒ��
                                + ',StoneSpec'
                                + ',StoneSize'
                                + ',AddLiq'
                                + ',TecReq'
                                + ',RecipeCode'
                                + ',MixLast'
                                + ',' + '''' + LoginNm + ''''
                                + ',' + FloatToStr(Now())    //������ʼʱ��
                                + ',' + FloatToStr(Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 ))    //��������
                                + ',' + '[TolVehs] +1'    //�ۼƳ���
                                + ',' + '[TolAmount]' + '+' + floattostr( Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 ) )   //+ Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 )'
                                + ',( select ProdTruckCode from ProdNotice where ProdNotice.Id=' + inttostr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID) + ')'
                                + ',( select Driver from ProdNotice where ProdNotice.Id=' + inttostr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID) + ')'
                                + ' from ProdTask where ProdTask.Code=:ProdTaskCode ' ;
            ADOQuery1.Parameters.ParamByName('ProdTaskCode').Value := TmpTaskCode;
        end
        else
        begin
            ADOQuery1.SQL.Text := 'insert into Produce ('
                                + 'DatTim'      //����ʱ��
                                + ',Recipe'      //��ȱ��
                                + ',Operator'
                                + ',ProdTimB'
                                + ',ProdMete'    //��������
                                + ',TotVehs'     //�ۼƳ���
                                + ',TotMete'     //�ۼƷ���
                                + ',Vehicle'
                                + ',Driver'     //��ʻԱ
                                + ') select '
                                + FloatToStr(Now())    //������ʼʱ��
                                + ',ProdRecCode'
                                + ',' + '''' + LoginNm + ''''
                                + ',' + FloatToStr(Now())    //��ʼʱ��
                                + ',' + FloatToStr(Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 ))    //��������
                                + ',' + '1'
                                + ',' + FloatToStr(Roundto(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdAmount, -1 ))    //��������
                                + ',ProdTruckCode'
                                + ',Driver'
                                + ' from ProdNotice where ID=' + inttostr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdNotice_ID);
        end;

        ADOQuery1.ExecSQL;
        ADOConnection.CommitTrans;

        ADOQuery1.Close;
        ADOQuery1.SQL.Text := 'select @@identity as lastId from Produce';
        ADOQuery1.Open;
        if not ADOQuery1.Eof then
        begin
            ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_IdInDb := ADOQuery1.FieldByName('lastId').AsInteger;
             Result := 0;
        end
        else
        begin
            Result := 2;
        end;
    except
        ADOConnection.RollbackTrans;
        ADOQuery1.Close;
        Result := 1;
    end;

    if TmpTaskCode <> '' then
    begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        try
            ADOConnection.BeginTrans;
            ADOQuery1.SQL.Text := 'update ProdTask set TolVehs=TolVehs+1 where Code=' + '''' + TmpTaskCode + '''';
            ADOquery1.ExecSQL;
            ADOConnection.CommitTrans;
        except
            ADOConnection.RollbackTrans;
            Showmessage('�������������ۻ�����ʧ�ܣ�');
            Result := 3;
        end;
        ADOQuery1.Close;
    end;
end;

function TFrmMain.UpdateDbForProdEnd() : Integer;                               //������ɣ��������ݿ�
var
    TotalVehs : Integer;
    TotalMete : Double;
begin
    //��ȡ�ۼƳ��Ρ��ۼƷ���
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select TolAmount from ProdTask where Code =' + '''' + ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_Code + '''';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        //TotalVehs := ADOQuery1.FieldByName('TolVehs').AsInteger ;
        TotalMete := RoundTo(ADOQuery1.FieldByName('TolAmount').AsFloat, -2); ;
    end
    else
    begin
        //TotalVehs := 1 ;
        TotalMete := RoundTo(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchAmount * ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId, -2) ;
    end;

    //����Produce��
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    try
        ADOConnection.BeginTrans;
        ADOQuery1.SQL.Text := 'update Produce set ProdTimE=' + FloatToStr(Now())    //��������ʱ��
                            + ', ProdMete=' + FloatToStr(RoundTo(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchAmount * ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId, -2))  //����������
                            + ', PieCnt=' + inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].WtDbPieceId) //����
                            //+ ', TotVehs=' + inttostr(TotalVehs)
                            + ', TotMete=' + FloatToStr(TotalMete)
                            + ' where ID=' + Inttostr(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdTask_IdInDb);
        ADOQuery1.ExecSQL;
        ADOConnection.CommitTrans;
        Result := 0;
    except
        ADOconnection.RollbackTrans;
        Result := 1;
        Showmessage('�����ɵ������Ϣ����ʧ��!');
    end;

    //ɾ�������ɳ���
    Try
        ADOConnection.BeginTrans;
        ADOquery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'delete from ProdNotice where ID=' + IntToStr(ProdNoticeInfo[ProdNoticeInfoRdPt].ProdNotice_ID);
        ADOQuery1.ExecSQL;
        ADOConnection.CommitTrans;
    except
        ADOConnection.RollbackTrans;
        Showmessage('���ɳ�������ɾ����¼ʧ��!');
    end;


end;

Function TFrmMain.DelProdedNoticeFromDspTab( ProdNoticeId : Integer ) : Integer;    //���ɵ��б���ɾ����������ɵ��ɵ�
//����ɾ���ɵ�������
var
    i : Integer;
    SearchOk : Boolean;
begin
    i := 1;
    SearchOk := False;
    while (i <= AdvStrGdProdNotice.RowCount - 2) do
    begin
        if Trim(AdvStrGdProdNotice.Cells[2, i]) = inttostr( ProdNoticeId ) then
        begin
            SearchOk := True;
            Break;
        end;
        i := i+1;
    end;

    if i > 0 then
    begin
        if SearchOk then
        begin
            AdvStrGdProdNotice.RemoveRows(i,1);
            Result := i;
        end
        else
        begin
            Result := 0;
            Showmessage('ɾ�������ɵ�ʧ��');
        end;
    end
    else
    begin
         Result := 0;
         Showmessage('ɾ�������ɵ�ʧ��');
    end;
end;

procedure TFrmMain.AdvStrGdProRdClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
    LdNum  : Integer;
    i      : Integer;
    EdtLft : Integer;
begin
    if ( ARow >1 ) and ( Trim(AdvStrGdProRd.Cells[7, ARow]) <> '' ) then
    begin
        try
            LdNum := StrToInt(Trim(AdvStrGdProRd.Cells[7, ARow]));
        except
            LdNum := -1;
        end;
    end
    else
    begin
        LdNum  := -1;
    end;

    if ( (Acol =2) or (Acol =3)) and ( (LdNum >=0) and (LdNum < 10) ) then
    begin
        EtNewLdTarg.Top := ( ARow - AdvStrGdProRd.TopRow +1) * AdvStrGdProRd.DefaultRowHeight;

        EdtLft := 0;
        for i:= AdvStrGdProRd.LeftCol to ACol - 1 do
        begin
            EdtLft := EdtLft + AdvStrGdProRd.ColWidths[i];
        end;

        EtNewLdTarg.Left := EdtLft;
        EtNewLdTarg.Width:= AdvStrGdProRd.ColWidths[ACol] -1;

        EtNewLdTarg.Text := AdvStrGdProRd.Cells[ACol, ARow];

        EtNewLdTarg.SelectAll;
        EtNewLdTarg.Visible := True;
        EtNewLdTarg.SetFocus;

        GrdLdInfoEdtRow  := Arow;
        GrdLdInfoEdtCol  := Acol;
        GrdLdInfoEditing := True;

    end;
end;

procedure TFrmMain.EtNewLdTargExit(Sender: TObject);
begin
    EtNewLdTarg.Visible := False;
end;

procedure TFrmMain.AdvStrGdProRdMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
    if EtNewLdTarg.Visible then EtNewLdTarg.Visible := False;
end;

procedure TFrmMain.AdvStrGdProRdMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
    if EtNewLdTarg.Visible then EtNewLdTarg.Visible := False;
end;

procedure TFrmMain.EtNewLdTargKeyPress(Sender: TObject; var Key: Char);
var
    BatchNum   : Integer;
    WgrDecimal : Integer;
    StoraNum   : Integer;
    TempTarget : double;
    i : Integer;
    OperRow    : Integer;
    StorLdState: Integer;
begin
     if not (Key in ['0'..'9', '.', #8, #13,#27 ]) then Key := #0;

     if Key = #27 then
     begin
         EtNewLdTarg.Visible := False;
         GrdLdInfoEditing    := False;
     end
     else if key = #13 then
     begin
         if Trim(AdvStrGdProRd.Cells[8, GrdLdInfoEdtRow]) <> '' then
         begin
             try
                 BatchNum := StrToInt( Trim(AdvStrGdProRd.Cells[8, GrdLdInfoEdtRow]) );
             except
                 BatchNum := 0;
             end;
         end
         else
         begin
             BatchNum := 0;
             Showmessage('��������Ϣ����!');
         end;

         if Trim( AdvStrGdProRd.Cells[6, GrdLdInfoEdtRow] ) <> '' then
         begin
             try
                 StoraNum := StrToInt( Trim( AdvStrGdProRd.Cells[6, GrdLdInfoEdtRow] ) );
             except
                 StoraNum := 0;
             end;
         end
         else
         begin
             StoraNum := 0;
             Showmessage('�ϲ���Ϣ����');
         end;

         if ( BatchNum > 0 ) and ( StoraNum > 0 ) then
         begin
             WgrDecimal := WeigherPara[StorageInfo[StoraNum].InstrumentId][CntWeigherDecimalIndex].Value;

             if (GrdLdInfoEdtCol = 2) then
             begin

             end
             else
             begin
                 try
                     TempTarget := StrToFloat(EtNewLdTarg.Text);
                 except
                     TempTarget := -0.1;
                     Showmessage('�µ�Ŀ��ֵ����');
                 end;

                 if TempTarget >= 0 then
                 begin
                     TempTarget := RoundTo(TempTarget, -WgrDecimal);
                 end;

                 //�·�����
                 WtAWordToInstument1MscommBuf(StoraLdTgtModiInfo.RevBufPt,
                                              $0300 + (StorageInfo[StoraNum].InstrumentId -1) *4 + (StorageInfo[StoraNum].LoadNo -1),
                                              Trunc(RoundTo(TempTarget * Power(10, WgrDecimal), -0))
                                             );                //дһ���ֵ�ͨѶ������
                 StoraLdTgtModiInfo.Tmr := 0;
                 StoraLdTgtModiInfo.Ena := True;
                 //��¼
                 StoraLdTgtModiInfo.ModiStorId := StoraNum ;
                 StoraLdTgtModiInfo.NewTarget  := TempTarget;
             end;
         end;
     end;
end;

procedure TFrmMain.BtnIncProdSetCountClick(Sender: TObject);
var
    i      : Integer;
    IncEna : Boolean;
begin
    IncEna := True;

    for i:=1 to WeigherCount do
    begin
        if not WeigherInfo[i].Enable then Continue;

        if ( WeigherLoadCounterInInstu[i] > ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount )
          or
           ( ( WeigherLoadCounterInInstu[i] = ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount ) and  ( (WeigherStateInInstru[i] and (1 shl 6)) <> 0 ) )
          or
           (WeigherLoadInfo[i].RecordBatchCount >= ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount)
          then
        begin
            IncEna := false;
            Break;
        end;
    end;

    if IncEna then
    begin
        ProdBatchsModiInfo.Tmr    := 0;
        ProdBatchsModiInfo.ModiTp := CtProdBatchsModiIsInc;
        WtAWordToInstument1MscommBuf( ProdBatchsModiInfo.RevBufPt, $0841, ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount +1 );              //дһ���ֵ�ͨѶ������
        ProdBatchsModiInfo.Ena := True;

        //���һ�� ��ť
        BtnIncProdSetCount.Enabled := False;
        BtnIncProdSetCountState := BtnProdSetCountStIsDisable;
        //����һ�� ��ť
        BtnDecProdSetCount.Enabled := False;
        BtnDecProdSetCountState := BtnProdSetCountStIsDisable;
    end
    else
    begin
        MessageBox(GetFocus, Pchar('����ĩ�����г�������ϣ�������������'), 'ϵͳ֪ͨ', MB_OK);
    end;
end;

procedure TFrmMain.BtnDecProdSetCountClick(Sender: TObject);
var
    i : integer;
    DecEna : Boolean;
begin
    DecEna := True;

    for i:=1 to WeigherCount do
    begin
        if not WeigherInfo[i].Enable then Continue;

        if ( WeigherLoadCounterInInstu[i] >= ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount ) then
        begin
            DecEna := False;
            Break;
        end;
    end;

    if DecEna then
    begin
        ProdBatchsModiInfo.Tmr    := 0;
        ProdBatchsModiInfo.ModiTp := CtProdBatchsModiIsDec;
        WtAWordToInstument1MscommBuf( ProdBatchsModiInfo.RevBufPt, $0841, ProdNoticeInfo[ProdNoticeInfoRdPt].ProdBatchsCount -1 );              //дһ���ֵ�ͨѶ������
        ProdBatchsModiInfo.Ena := True;

        //���һ�� ��ť
        BtnIncProdSetCount.Enabled := False;
        BtnIncProdSetCountState := BtnProdSetCountStIsDisable;
        //����һ�� ��ť
        BtnDecProdSetCount.Enabled := False;
        BtnDecProdSetCountState := BtnProdSetCountStIsDisable;
    end
    else
    begin
        MessageBox(GetFocus, Pchar('����ĩ���ѿ�ʼ���������ܼ���'), 'ϵͳ֪ͨ', MB_OK);
    end;
end;

procedure TFrmMain.BtnProdContinueClick(Sender: TObject);
begin
    if ProdMode = CtProdIsSingle then
    begin
        ProdMode := CtProdIsContinue ;
        BtnProdContinue.Glyph := Nil;
        ImageList1.GetBitmap(1,BtnProdContinue.Glyph) ;
    end
    else
    begin
        ProdMode := CtProdIsSingle ;
        BtnProdContinue.Glyph := Nil;
        ImageList1.GetBitmap(0,BtnProdContinue.Glyph) ;
    end;
end;

procedure TFrmMain.CkFrstBatchPrtDevlClick(Sender: TObject);
var
    Flags     : String;
    RdResult  : Boolean;
    SubStrPos : Integer;
begin
    if not CkFrstBatchPrtDevl.Focused then Exit;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select Flag from Equipment where ID=1';
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        Flags := ADOQuery1.FieldByName('Flag').AsString;
    end
    else
    begin
        RdResult := False;
        Showmessage('��ȡ��ӡ����ʧ��!');
    end;

    if CkFrstBatchPrtDevl.Checked then
    begin
        CkLastBatchPrtDevl.Checked := False;
        SubStrPos := pos('lpt', Flags) ;
        if SubStrPos > 0 then
        begin
            delete(Flags, SubStrPos, 3);
        end;
        SubStrPos := pos('fpt', Flags) ;
        if SubStrPos <= 0 then
        begin
            Flags := Flags + 'fpt';
        end;
    end
    else
    begin
        SubStrPos := pos('fpt', Flags) ;
        if SubStrPos > 0 then
        begin
            delete(Flags, SubStrPos, 3);
        end;
    end;

    case WtFlagIntoEquipTb(Flags, 1) of            //д��ʶ���Ե�Equipment����
        0: begin

        end;
        1: begin
            Showmessage('���Ĵ�ӡ��ʽ ��¼ʧ��!')
        end;
    end;

    if CkFrstBatchPrtDevl.Checked then
        DeliveryPrtMode := CtDeliveryPrtMdIsFst
    else if CkLastBatchPrtDevl.Checked then
        DeliveryPrtMode := XtDeliveryPrtMdIsLat
    else
        DeliveryPrtMode := CtDeliveryPtrtMdIsNonAuto;
end;

procedure TFrmMain.CkLastBatchPrtDevlClick(Sender: TObject);
var
    Flags     : String;
    RdResult  : Integer;
    SubStrPos : Integer;
begin
    if not CkLastBatchPrtDevl.Focused then Exit;

    RdResult := RdFlagFromEquipTb(Flags, 1) ;

    if CkLastBatchPrtDevl.Checked then
    begin
        CkFrstBatchPrtDevl.Checked := False;

        if RdResult = 0 then
        begin
            SubStrPos := pos('fpt', Flags) ;
            if SubStrPos > 0 then
            begin
                delete(Flags, SubStrPos, 3);
            end;

            SubStrPos := pos('lpt', Flags) ;
            if SubStrPos <= 0 then
            begin
                Flags := Flags + 'lpt';
            end
        end;
    end
    else
    begin
        if RdResult = 0 then
        begin
            SubStrPos := pos('lpt', Flags) ;
            if SubStrPos <= 0 then
            begin
                Flags := Flags + 'lpt';
            end
        end;
    end;

    case WtFlagIntoEquipTb(Flags, 1) of            //д��ʶ���Ե�Equipment����
        0: begin

        end;
        1: begin
            Showmessage('���Ĵ�ӡ��ʽ ��¼ʧ��!')
        end;
    end;

    if CkFrstBatchPrtDevl.Checked then
        DeliveryPrtMode := CtDeliveryPrtMdIsFst
    else if CkLastBatchPrtDevl.Checked then
        DeliveryPrtMode := XtDeliveryPrtMdIsLat
    else
        DeliveryPrtMode := CtDeliveryPtrtMdIsNonAuto;
end;

procedure TFrmMain.cBtnManulPrtDelClick(Sender: TObject);
begin
    //FrmDeliveryPreview.sEdtProdId.Text := IntToStr(ProdNoticeInfo[ProdNoticeInfoWtPt].ProdTask_IdInDb);
    FrmDeliveryPreview.Show;
end;

procedure TFrmMain.NCommunicateClick(Sender: TObject);
begin
    if not FrmCommunicationSetCrt then
    begin
        FrmCommunicationSet := TFrmCommunicationSet.Create(FrmMain);
        FrmCommunicationSetCrt := True;
    end;
    FrmCommunicationSet.Show;
end;

procedure TFrmMain.NSingleDefineClick(Sender: TObject);
begin
    if not FrmSignalDefineCrt then
    begin
        FrmSignalDefine    := TFrmSignalDefine.Create(FrmMain);
        FrmSignalDefineCrt := True;
    end;
    FrmSignalDefine.Show;
end;

procedure TFrmMain.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    releasecapture;
    Panel2.Perform(wm_syscommand,$f012,0);
end;

procedure TFrmMain.N18Click(Sender: TObject);
begin
    if not FrmSysUnlockCrt then
    begin
        FrmSysUnlock    := TFrmSysUnlock.Create(FrmMain);
        FrmSysUnlockCrt := True;
    end;
    FrmSysUnlock.Show;
end;

procedure TFrmMain.s3Click(Sender: TObject);
begin
    if not FrmLftHopperCrt then
    begin
        FrmLftHopper    := TFrmLftHopper.Create(Nil);
        FrmLftHopperCrt := True;
    end;
    FrmLftHopper.Show;
end;

procedure TFrmMain.N19Click(Sender: TObject);
begin
    if not FrmSysAboutCrt then
    begin
        FrmAbout := TFrmAbout.Create(Nil);
        FrmSysAboutCrt := True;
    end;
    FrmAbout.Show;
end;

procedure TFrmMain.NSysConfigClick(Sender: TObject);
begin
    if not FrmConfigCrt then
    begin
        FrmConfig    := TFrmConfig.Create(Nil);
        FrmConfigCrt := True;
    end;
    FrmConfig.show;
end;

procedure TFrmMain.NProdDataClick(Sender: TObject);
begin
   if not FileExists(ExtractFilePath(application.ExeName) +'.\ProReport.exe') then
    begin
        MessageBox(Handle, '���ݱ���ģ�鱻����ɾ��������ϵϵͳ���ҡ�',
          'ϵͳ����', MB_OK + MB_ICONSTOP + MB_TOPMOST);
        Exit;
    end;
    ShellExecute(Handle,'open','ProReport.exe',nil,nil,SW_SHOWNORMAL);
end;

procedure TFrmMain.N20Click(Sender: TObject);
begin
    if not FrmMaterialStorageCrt then
    begin
        FrmMaterialStorage := TFrmMaterialStorage.Create(Self);
        FrmMaterialStorageCrt := True;
    end;
    FrmMaterialStorage.ShowModal;
end;

procedure TFrmMain.N21Click(Sender: TObject);
begin
    if not FrmModifyStocksCrt then
    begin
        FrmModifyStocks := TFrmModifyStocks.Create(Self);
        FrmModifyStocksCrt := True;
    end;
    FrmModifyStocks.ShowModal;
    
end;

procedure TFrmMain.N22Click(Sender: TObject);
begin
   if not FrmStocksCrt then
   begin
       FrmStocks    := TFrmStocks.Create(Self);
       FrmStocksCrt := True;
   end;
   FrmStocks.Show;
end;

procedure TFrmMain.N11Click(Sender: TObject);
begin
    Application.Terminate;
end;

end.
