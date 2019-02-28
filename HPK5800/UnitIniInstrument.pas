unit UnitIniInstrument;

interface
  procedure Instruction1Init();    //��������ʼ��
    Function Instruction1MscommReadForIni(var Instrument1IniEnable : Boolean) : integer;    //��ȡ����������
    function InstrumentSetFstDschForIni(var Instrument1IniEnable : Boolean) : Integer ;    //���������ж������
    function InstrumentSetWeigherNoForIni(var Instrument1IniEnable : Boolean) : Integer;   //���ó��Ǳ��
    function Instrument1SetWeigherCloseLmtForIni(var Instrument1IniEnable : Boolean) : Integer ;    //���óƹ���
    Function InstrumentSetWorkStateForIni(var Instrument1IniEnable : Boolean) : Integer ;    //��ʼ������������״̬


  function IniInstrument1MixerPara(var Instrument1IniEnable : Boolean) : Integer;    //��ʼ�����������



  function IniInstrument1MixerDischMode( var Instrument1IniEnable : Boolean ) : Integer;    //��ʼ�������ж�Ϸ�ʽ
  function IniInstrument1Address070E( var Instrument1IniEnable : Boolean ) : Integer;     //δ����
  function IniInstrument1Address071A( var Instrument1IniEnable : Boolean ) : Integer;     //δ����
  function IniInstrument1Address071B( var Instrument1IniEnable : Boolean ) : Integer;     //δ����
  function IniInstrument1AggregateConveyorMode( var Instrument1IniEnable : Boolean ) : Integer;    //��������ģʽ
  function IniAdditiveDischIntoWater( var Instrument1IniEnable : Boolean ) : Integer;    //��ʼ�����ж�Ϸ�ʽ
  function IniInstrument1Address03D5( var Instrument1IniEnable : Boolean ) : Integer;    //δ����
  //---------------------һ��������
  {}
  //----------------------------------

  function IniInstrument1WeigherPara( var Instrument1IniEnable : Boolean ) : Integer;    //��ʼ���������Ǳ����
    function IniWeigherStorageCount( var Instrument1IniEnable : Boolean;
      WeigherId : Integer; StorageCount : Integer ) : Integer;                             //�������Ǳ���ϲ�����
    function IniReadWeigherParaFromInstrument1(var Instrument1IniEnable : Boolean;
       var WaitReceiveBufPt : Integer ; IniWeigherId : Integer ) : Integer;                //��ȡ�Ǳ�Ĳ�������
    function IniWtWeigherDschVibratorSetting(var Instrument1IniEnable : Boolean;
      IniWeigherId : Integer) : Integer;                                                   //���ó�ж����������
    function IniWtWeigherOffset0012H(var Instrument1IniEnable : Boolean;
      IniWeigherId : Integer) : Integer;                                                   //���óƻ���������ƫ�Ƶ�ַΪ0012H�Ĳ���
    procedure IniWtStorageVibraStart(WeigherId : Integer; LoadIndex : Integer);            //��ʼ��д�ϲֱ߼�������
    procedure IniWtStorageVibraSet(var Instrument1IniEnable : Boolean;
      WeigherId : Integer; LoadIndex : Integer);              //��ʼ��д�ϲ���������

  function IniWtAggregateMidBin(var Instrument1IniEnable : boolean) : Integer;           //��ʼ�������м��

  function IniRingToInstrument(var Instrument1IniEnable : Boolean) : Integer;     //��ʼ������

  function IniAddr0747ToInstrument(var Instrument1IniEnable : Boolean) : Integer;    //��ʼ����ַ0747H

  function IniWeighersDschDesignToInstrument(var Instrument1IniEnable : Boolean) : Integer;     //��ʼ����Ͷ��˳��

  function IniStorageRepToInstrument(var Instrument1IniEnable : Boolean) : Integer;    //���û���Ŀ���



  function IniWriteAwordToInstrument( Const Caption: WideString ;  Address : Integer;
    WordValue : Integer) : Integer;                                                      //��ʼ������λ��д��һ����
  function IniWtWordsToInstrument(Caption : Pchar; WtAddress : Integer;
    WordsValue : array of Integer; WordsNumber : Integer) : Integer;                     //��ʼ������λ��д��������

  
implementation

uses UnitGlobeVar, UnitGlobeSub , UnitRWInstrument1MscommBuf, UnitSplash,
     Forms, Windows, ADODB,
     UnitMain ,
     UnitRWDb, 
     SysUtils,  math,
     Dialogs ;

//-------------------------��ʼ��������-----------------------------------------
procedure Instruction1Init();    //��������ʼ��
var
    Instruction1InitEnable : Boolean;
    i : integer;
    FunExcuteResult : Integer;
begin
    Instruction1InitEnable := True;

    {��ȡ��λ������ }
    FunExcuteResult := Instruction1MscommReadForIni(Instruction1InitEnable);
    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //���½�����

    {��������ж�Ͻ�ֹ����}
    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '��������ж��...' ;
        InstrumentSetFstDschForIni( Instruction1InitEnable ) ;
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //���½�����
    end;

    {���ó��Ǳ��}
    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '���óƵ��Ǳ���...' ;
        InstrumentSetWeigherNoForIni(Instruction1InitEnable) ;
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //���½�����
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '���ø�����λ...' ;
        Instrument1SetWeigherCloseLmtForIni(Instruction1InitEnable) ;
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //���½�����
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '���ÿ�����״̬...' ;
        InstrumentSetWorkStateForIni(Instruction1InitEnable);    //�����������ʼ״̬
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //���½�����
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '���ý��������...' ;
        IniInstrument1MixerPara(Instruction1InitEnable) ;
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 2;    //���½�����
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '���ù������ͷ�ʽ...' ;
        IniInstrument1AggregateConveyorMode( Instruction1InitEnable ) ;    //��������ģʽ
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //���½�����
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '����������Ƿ�ж��ˮ��...' ;
        IniAdditiveDischIntoWater( Instruction1InitEnable ) ;    //���ж�Ϸ�ʽ
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //���½�����
    end;

    if Instruction1InitEnable then    //д03D5
    begin
        FrmSplash.LbSplash.Caption := '����������Ƿ�ж��ˮ��...' ;
        IniInstrument1Address03D5( Instruction1InitEnable ) ;    //
        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;    //���½�����
    end;

    if Instruction1InitEnable then
    begin
        FrmSplash.LbIniInfo.Caption := '���óƲ�������...' ;
        IniInstrument1WeigherPara( Instruction1InitEnable ) ;    //������1�Ǳ����
    end;

    if Instruction1InitEnable then
    begin
        //��ʼ��ƽƤ��
        FrmSplash.LbIniInfo.Caption := '��ʼ��ƽƤ��';

    end;

    if Instruction1InitEnable then    //���ù����м��
    begin
        if AggregateConveyorMode = CntAggregateConveyorBelt then
        begin
            FrmSplash.LbIniInfo.Caption := '���ù����м��...' ;

            IniWtAggregateMidBin( Instruction1InitEnable );

            FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 2;
        end;
    end;

    if Instruction1InitEnable then    //���õ���
    begin
        IniRingToInstrument( Instruction1InitEnable );
    end;

    if Instruction1InitEnable then    //���ó�Ͷ��˳��
    begin
        IniWeighersDschDesignToInstrument( Instruction1InitEnable );
    end;

    if Instruction1InitEnable then    //0747H δ����
    begin
        IniAddr0747ToInstrument( Instruction1InitEnable ) ;
    end;

    if Instruction1InitEnable then
    begin
        IniStorageRepToInstrument(Instruction1InitEnable);    //���û���Ŀ���
    end;

//    if Instruction1InitEnable then
//    begin
        //while (true) do
        //begin
        //    Application.ProcessMessages;
        //end;
//    end;
end;
//------------------------------------------------------------------------------

//--------------------------��ȡ����������--------------------------------------
Function Instruction1MscommReadForIni(var Instrument1IniEnable : Boolean) : integer;    //��ȡ����������
var
    InitResult : Boolean ;
    Instruction1ReceiveWaitPt : integer ;
begin
    InitResult := False;

    while (not InitResult) do
    begin
        Instruction1WtMscommReadSetToBuf(Instruction1ReceiveWaitPt);
        SystemRunDelayTmr := 2000;    //2��ȴ�

        while (not Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].Active) do
        begin
            Application.ProcessMessages;
            if SystemRunDelayTmr <= 0 then
            begin
                case messagebox(getfocus, Pchar('�����Ƿ��������ӿ������ҿ�������ͨ��,�Ƿ������ȡ'), 'ѯ����Ϣ', MB_YESNOCANCEL) of
                    IDCANCEL :    //ȡ����ѡ
                    begin
                        InitResult := True ;    //���ٶ�ȡ���������ã�������һ������
                        Instrument1IniEnable := False;    //���ٳ�ʼ��������
                        Result := 1;
                        break;
                    end;
                    IDNO :    //��ѡ
                    begin
                        InitResult := True ;    //���ٶ�ȡ���������ã�������һ������
                        Result := 1;
                        break;
                    end;
                    IDYES :    //�Ǳ�ѡ�����·�����������ȴ�
                    begin
                        break;
                    end;
                end;
            end;
        end;

        //�����յ�������
        if Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].Active then
        begin
            if ( Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].ReceiveCmd and $80 ) <> 0 then    //���յ�Ӧ���������
            begin
                case messagebox(getfocus, Pchar('��ȡ����������ʧ�ܣ��Ƿ������ʼ��������'), 'ѯ����Ϣ', MB_YESNOCANCEL ) of
                    IDCANCEL :    //ȡ����ѡ,���ٳ�ʼ��������
                    begin
                        InitResult := True ;    //���ٶ�ȡ���������ã�������һ������
                        Instrument1IniEnable := False;    //���ٳ�ʼ��������
                        Result := 1 ;
                    end;
                    IDNO :    //��ѡ
                    begin
                        InitResult := True ;    //���ٶ�ȡ����������
                        Result := 1;
                    end;
                    IDYES :    //�Ǳ�ѡ,���¶�ȡ
                    begin
                        ;
                    end;
                end;
            end
            else
            begin
                //if (Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].ReceiveByte[0] <> $2C) or (Instruction1ReceiveBuf[Instruction1ReceiveWaitPt].ReceiveByte[1] <> $0C) then
                //begin
                //    if messagebox(getfocus, Pchar('��ȡ�������������¼��һ�£����ȷ������'), '��ʾ��Ϣ', MB_OK ) = idOK then
                //    begin
                //        ;
                //    end;
                //end;
                InitResult := True ;    //��ȡ���������óɹ�
                Result := 0;
            end;
        end;
    end;
end;
//------------------------------------------------------------------------------

//-----------------------------���������ж������-------------------------------
function InstrumentSetFstDschForIni(var Instrument1IniEnable : Boolean) : Integer ;
var
    WtCaption : WideString;
    WtData : Integer ;
    WtResult : Integer ;
begin
    WtCaption := ' ��������ж������/��ֹ ';

    if MixerInfo.FstDschEn then
        WtData := $0000
    else
        WtData := 0001;

    WtResult := IniWriteAwordToInstrument( WtCaption,  //��ʼ������λ��д��һ����
                  $0711,
                  WtData) ;
end;
//------------------------------------------------------------------------------

//-------------------------���ó��Ǳ��-----------------------------------------
function InstrumentSetWeigherNoForIni(var Instrument1IniEnable : Boolean) : Integer ;
var
    MessageText : String;
    WordsValue : array[1..16] of Integer ;
    WtResult : Integer ;
    i : Integer ;
begin
    for i:=1 to 16 do
    begin
        WordsValue[i] := WeigherInfo[i].InstrumentId ;
    end;

    MessageText := ' ���ϳӵ��Ǳ�� ' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $03F0,
                                        WordsValue,
                                        16) ;

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//------------------------------------------------------------------------------

//----------------------------���óƹ���----------------------------------------
function Instrument1SetWeigherCloseLmtForIni(var Instrument1IniEnable : Boolean) : Integer ;
var
    WtCaption : WideString;
    WtData : Integer ;
    WtResult : Integer ;
    i : Integer ;
begin
    for i:= 1 to 15 do
    begin

        WtCaption := WeigherInfo[i].Name +   ' ������λ���� ';

        if WeigherInfo[i].CloseLmt then
            WtData := $0100
        else
            WtData := 0000;

        WtResult := IniWriteAwordToInstrument( WtCaption,  //��ʼ������λ��д��һ����
                  $03C0 + (i-1),
                  WtData) ;
        case WtResult of
            0,    //д�ɹ�
            2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
            3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
            begin

            end;
            1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
            begin
                Instrument1IniEnable := False;
                break;
            end;
        end;
    end;
end;
//------------------------------------------------------------------------------

//------------------------��ʼ������������״̬----------------------------------
Function InstrumentSetWorkStateForIni(var Instrument1IniEnable : Boolean) : Integer ;
var
    WtCaption : String ;
    WtResult : Integer ;
begin
    WtCaption := ' ��ʼ��������״̬ ';

    WtResult := IniWriteAwordToInstrument( WtCaption, $0200, $0000) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
function IniInstrument1MixerPara(var Instrument1IniEnable : Boolean) : Integer;    //��ʼ�����������
type
    IniMixerParaInfoRd = Record
        WtFstIndex : Integer ;        //����������
        WtDataCount : Integer ;       //��������
    end;
Const
    CntIniCmdCount = 3;
Const
    IniParaInfo : array[1..CntIniCmdCount] of IniMixerParaInfoRd = (
        ( WtFstIndex  : CntIndexOfMixingSetLngInArray;
          WtDataCount : 2) ,    //��ʼ�������ʱ�����

        ( WtFstIndex  : CntIndexOfDschSetLngInArray;
          WtDataCount : 6) ,    //��ʼ�������ж�ϲ���

        ( WtFstIndex  : CntIndexOfMixingTmrStartInArray;
          WtDataCount : 1) //,    //��ʼ���������ʱ��ʽ����ֵ
      );
var
    IniWtPt : Integer ;
    MessageText : String;
    WordsValue : array[1..16] of Integer ;
    i : Integer ;
    WtDataCount : Integer ;
    WtFstIndex : Integer;
    WtResult : Integer ;
begin
    for IniWtPt := 1 to CntIniCmdCount do
    begin
        if Instrument1IniEnable then
        begin
            MessageText := ' ���������ʱ�� ' ;
            WtFstIndex := IniParaInfo[IniWtPt].WtFstIndex ;
            WtDataCount := IniParaInfo[IniWtPt].WtDataCount ;
            for i:= 1 to WtDataCount do
            begin
                WordsValue[i] := MixerPara[WtFstIndex + i -1].Value ;
            end;

            WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        CntMixerParaInfo[WtFstIndex].AddressInInstrument,
                                        WordsValue,
                                        WtDataCount) ;

            case WtResult of
                0,    //д�ɹ�
                2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
                3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
                begin

                end;
                1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
                begin
                    Instrument1IniEnable := False;
                end;
            end;
        end;
    end;

    //��ʼ�������ж�Ϸ�ʽ
    if Instrument1IniEnable then
    begin
        IniInstrument1MixerDischMode( Instrument1IniEnable ) ;    //��ʼ�������ж�Ϸ�ʽ
    end;

    //$070E
    if Instrument1IniEnable then
    begin
        IniInstrument1Address070E( Instrument1IniEnable );     //δ����
    end;
    //$071A
    if Instrument1IniEnable then
    begin
        IniInstrument1Address071A( Instrument1IniEnable );     //δ����
    end;
    //$071B
    if Instrument1IniEnable then
    begin
        IniInstrument1Address071B( Instrument1IniEnable );     //δ����
    end;

end;

function IniInstrument1MixerDischMode( var Instrument1IniEnable : Boolean ) : Integer;    //��ʼ�������ж�Ϸ�ʽ
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' ��ʼ��������״̬ ';

    if MixerInfo.DschMode = CntMixerDischTwo then
    begin
        WtData := $0001 ;
    end
    else
    begin
        WtData := $0000 ;
    end;

    WtResult := IniWriteAwordToInstrument( WtCaption, $03D0, WtData) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end; 

end;

function IniInstrument1Address070E( var Instrument1IniEnable : Boolean ) : Integer;     //δ����
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' ��ʼ��������״̬ ';

    WtData := $0000 ;

    WtResult := IniWriteAwordToInstrument( WtCaption, $070E, WtData) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;

function IniInstrument1Address071A( var Instrument1IniEnable : Boolean ) : Integer;     //δ����
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' ��ʼ��������״̬ ';

    WtData := $0000 ;

    WtResult := IniWriteAwordToInstrument( WtCaption, $071A, WtData) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;

function IniInstrument1Address071B( var Instrument1IniEnable : Boolean ) : Integer;     //δ����
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' ��ʼ��������״̬ ';

    WtData := $0000 ;

    WtResult := IniWriteAwordToInstrument( WtCaption, $071B, WtData) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//-------------------------�����������ʼ������---------------------------------

//--------------------------��������ģʽ��ʼ��----------------------------------
function IniInstrument1AggregateConveyorMode( var Instrument1IniEnable : Boolean ) : Integer;    //��������ģʽ
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' ��ʼ���������ͷ�ʽ ';

    if AggregateConveyorMode = CntAggregateConveyorBelt then
        WtData := $0000
    else
        WtData := $0001;

    WtResult := IniWriteAwordToInstrument( WtCaption, $03D1, WtData) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//------------------------------------------------------------------------------

//------------------------��ʼ�����ж�Ϸ�ʽ------------------------------------
function IniAdditiveDischIntoWater( var Instrument1IniEnable : Boolean ) : Integer;    //��ʼ�����ж�Ϸ�ʽ
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' ��ʼ����Ӽ�ж�Ϸ�ʽ ';

    if AdditiveDischIntoWater then
        WtData := $0001
    else
        WtData := $0000;

    WtResult := IniWriteAwordToInstrument( WtCaption, $03D4, WtData) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//----------------------=��ʼ�����ж�Ϸ�ʽ����---------------------------------


//--------------------------------$03D5-----------------------------------------
function IniInstrument1Address03D5( var Instrument1IniEnable : Boolean ) : Integer;    //δ����
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := ' ��ʼ�������� ';

    WtData := $0000;

    WtResult := IniWriteAwordToInstrument( WtCaption, $03D5, WtData) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//--------------------------------$03D5 End-------------------------------------

//---------------------һ��������
  {}
//----------------------------------

//----------------------------��ʼ�������Ǳ����--------------------------------
function IniInstrument1WeigherPara( var Instrument1IniEnable : Boolean ) : Integer;    //��ʼ��������1�Ǳ����
var
    IniWeigherId : Integer ;
    WaitReceiveBufPt : Integer;
    i : Integer ;
    ParaValueInInstrument ,
    ParaValueInMemory : Integer ;
    ParaDecimalDigit : Integer ;
    MessageText : String;
    WriteInstrumentResult : Integer;
begin
    for IniWeigherId := 1 to 16 do
    begin
        FrmSplash.LbIniInfo.Caption := '���� ' + WeigherInfo[IniWeigherId].Name;

        if not Instrument1IniEnable then break;

        IniWeigherStorageCount( Instrument1IniEnable , IniWeigherId, WeigherInfo[IniWeigherId].StorageNumber);    //���������Ǳ���ϲ�����
        if not Instrument1IniEnable then break;

        if ( WeigherInfo[IniWeigherId].StorageNumber > 0 )  and ( WeigherInfo[IniWeigherId].StorageNumber <= 4 ) then    //�Ƶ����ϲ���������ȷ
        begin
            IniReadWeigherParaFromInstrument1( Instrument1IniEnable , WaitReceiveBufPt, IniWeigherId) ;    //��ȡ�Ǳ�Ĳ�������

            if Instrument1IniEnable then
            begin
                for i:=1 to $0C do    //�����λ������ֵ�Ƿ�����λ����¼ֵ��ͬ
                begin
                    ParaValueInInstrument := Instruction1ReceiveBuf[WaitReceiveBufPt].ReceiveByte[ (i-1) *2 ] *256
                                             + Instruction1ReceiveBuf[WaitReceiveBufPt].ReceiveByte[ (i-1) *2 +1 ];    //��λ���ж�ȡ���Ĳ���ֵ
                    ParaValueInMemory := WeigherPara[IniWeigherId][i].Value;
                    ParaDecimalDigit := WeigherPara[IniWeigherId][i].Decimal;

                    if ParaValueInInstrument <> ParaValueInMemory then
                    begin
                        MessageText := WeigherInfo[IniWeigherId].Name + ' �� ' + CntWeigherParaInfo[i].ParaName + ' ��λ������λ��ֵ��һ��';
                        MessageText := MessageText + #10 ;
                        MessageText := MessageText + '��λ������ֵ��' + Format('%.' + IntToStr(ParaDecimalDigit) + 'f', [ParaValueInMemory / power(10,ParaDecimalDigit)] );
                        MessageText := MessageText + #10 ;
                        MessageText := MessageText + '��λ������ֵ��' + Format('%.' + IntToStr(ParaDecimalDigit) + 'f', [ParaValueInInstrument / power(10,ParaDecimalDigit)] );
                        MessageText := MessageText + #10 ;
                        MessageText := MessageText + '������ǡ��޸���λ������ֵ��' ;
                        MessageText := MessageText + '������񡯰�ť�����޸���λ������ֵ, ' ;
                        case messagebox( getfocus, Pchar(MessageText), '��ʾ��Ϣ', MB_YESNO ) of
                            IDNO :    //��ѡ
                            begin
                                //������λ���ڴ��еĲ���ֵΪ��λ���趨ֵ
                                WeigherPara[IniWeigherId][i].Value := ParaValueInInstrument ;
                            end;
                            IDYES :    //�Ǳ�ѡ,���¶�ȡ
                            begin
                                MessageText := WeigherInfo[IniWeigherId].Name + '��' + CntWeigherParaInfo[i].ParaName ;
                                WriteInstrumentResult := IniWriteAwordToInstrument( MessageText,
                                                               $0400 + $20 * (IniWeigherId -1) + CntWeigherParaInfo[i].AddrOffsetInInstrument,    //������ַ
                                                               ParaValueInMemory
                                                             );
                                if WriteInstrumentResult = 0 then    //д�ɹ�
                                begin

                                end
                                else
                                begin
                                    WeigherPara[IniWeigherId][i].Value := ParaValueInInstrument ;
                                end;
                            end;
                        end;
                    end;
                end;
            end;

            if Instrument1IniEnable then
            begin    //д���񶯲���
                IniWtWeigherDschVibratorSetting(Instrument1IniEnable, IniWeigherId);
            end;

            if Instrument1IniEnable then
            begin
                //д��״̬����
                IniWtWeigherOffset0012H(Instrument1IniEnable, IniWeigherId ) ;
            end;

            for i:=1 to WeigherInfo[IniWeigherId].StorageNumber do
            begin
                if Instrument1IniEnable then
                begin
                    IniWtStorageVibraStart(IniWeigherId, i);    //д���񶯱߼�����(��ģʽ)
                end;

                if Instrument1IniEnable then
                begin
                    IniWtStorageVibraSet(Instrument1IniEnable, IniWeigherId, i);    //����ʱ�����
                end;
            end;
        end;

        FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 5;

    end;
end;

function IniWeigherStorageCount( var Instrument1IniEnable : Boolean;
  WeigherId : Integer; StorageCount : Integer ) : Integer;    //�������Ǳ���ϲ�����
var
    WtCaption : String ;
    WtResult : Integer ;
    WtData : Integer;
begin
    WtCaption := WeigherInfo[WeigherId].Name +  ' ���� ';

    WtData := StorageCount;

    WtResult := IniWriteAwordToInstrument( WtCaption, $0340 + WeigherId -1, WtData) ;    //��ʼ��������Ϊ��ʼ״̬

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;

function IniReadWeigherParaFromInstrument1(var Instrument1IniEnable : Boolean;
  var WaitReceiveBufPt : Integer ; IniWeigherId : Integer ) : Integer;    //��ȡ�Ǳ�Ĳ�������
var
    IniResult : Boolean ;
    MessageText : String ;
begin
    IniResult := False ;

    while (not IniResult) do
    begin
        ReadWordsFromInstrument1( WaitReceiveBufPt, $0400 + (IniWeigherId -1) * $20,  $20 );    //���Ʋ���
        SystemRunDelayTmr := 2000;    //2��ȴ�
         while not (Instruction1ReceiveBuf[WaitReceiveBufPt].Active) do
        begin
            Application.ProcessMessages ;

            if SystemRunDelayTmr <= 0 then    //ͨѶ��ʱ
            begin
                case MessageBox(getfocus, Pchar('��ȡ����ʧ�ܣ�����������Ƿ��ͨ��Դ��ͨѶ��������ã�'), 'ѯ����Ϣ', MB_YESNOCANCEL) of
                    IDCANCEL :    //ȡ����ѡ
                    begin
                        IniResult := True ;    //���ٶ�ȡ���������ã�������һ������
                        Instrument1IniEnable := False;    //���ٳ�ʼ��������
                        Result := 1;
                        break;
                    end;
                    IDNO :    //��ѡ
                    begin
                        IniResult := True ;    //���ٶ�ȡ���������ã�������һ������
                        Result := 1;
                        break;
                    end;
                    IDYES :    //�Ǳ�ѡ�����·�����������ȴ�
                    begin
                        break;
                    end;
                end;
            end;

            if Instruction1ReceiveBuf[WaitReceiveBufPt].Active then
            begin
                if ( Instruction1ReceiveBuf[WaitReceiveBufPt].ReceiveCmd and $80 ) <> 0 then    //���յ�Ӧ���������
                begin
                    MessageText := '';
                    MessageText := MessageText + '           '+ WeigherInfo[IniWeigherId].Name + '����ʧ��!';
                    MessageText := MessageText + #10 + #10;
                    MessageText := MessageText + '        ������ǡ���ť�������ã�' ;
                    MessageText := MessageText + #10 + #10;
                    MessageText := MessageText + '        ������񡯰�ť����������, ' ;
                    MessageText := MessageText + #10 + #10;
                    MessageText := MessageText + '        �����ȡ������ť��ֹ��ʼ��������';

                    case messagebox(getfocus, Pchar(MessageText), '��ʾ��Ϣ', MB_YESNOCANCEL ) of
                        IDCANCEL :    //ȡ����ѡ,���ٳ�ʼ��������
                        begin
                            IniResult := True ;    //���ٶ�ȡ���������ã�������һ������
                            Instrument1IniEnable := False;    //���ٳ�ʼ��������
                            Result := 1 ;
                        end;
                        IDNO :    //��ѡ
                        begin
                            IniResult := True ;    //���ٶ�ȡ����������
                            Result := 1;
                        end;
                        IDYES :    //�Ǳ�ѡ,���¶�ȡ
                        begin
                            ;
                        end;
                    end;
                end
                else
                begin
                    IniResult := True ;    //��ȡ���������óɹ�
                    Result := 0;
                end;
            end;
        end;
    end;
end;

//----------------------------��ʼ�������Ǳ����--------------------------------
function IniWtWeigherDschVibratorSetting(var Instrument1IniEnable : Boolean; IniWeigherId : Integer) : Integer;
var
    i : integer;
    MessageText : String ;
    WordsValue : Array[1..5] of Integer;

    WtResult : Integer;
begin
    WordsValue[1] := WeigherPara[IniWeigherId][ CntWeigherINS_QIV_DLYIndex ].Value; //0A40H �ӳ���ʱ��
    WordsValue[2] := WeigherPara[IniWeigherId][ CntWeigherINS_QIV_LSTIndex ].Value; //0A41H ��ʱ��
    WordsValue[3] := WeigherPara[IniWeigherId][ CntWeigherINS_QIV_STPIndex ].Value; //0A42H �񶯼��ʱ��
    WordsValue[4] := $00;    //0A43H
    if (WeigherPara[IniWeigherId][CntWeigherINS_QIV_MDLIndex].Value = 0) then
        WordsValue[5] := 0
    else
        WordsValue[5] := WeigherPara[IniWeigherId][ CntWeigherINS_QIV_FLWIndex ].Value;//0A44H �񶯱߼�����

    MessageText := WeigherInfo[IniWeigherId].Name + ' �� ��ж����������' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $0A40 + (IniWeigherId -1) *6,
                                        WordsValue,
                                        5) ;
    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//--------------------------��ʼ�������Ǳ��������------------------------------

//---------------------------��ʼ��д�ֱ߼�������-----------------------------
procedure IniWtStorageVibraStart(WeigherId : Integer; LoadIndex : Integer);
var
    StorageId : Integer;

    WtResult : Integer;
    WtCaption : WideString ;

    WtData : Integer;
begin
    StorageId := WeigherInfo[WeigherId].StorageId[LoadIndex];

    WtCaption := StorageInfo[StorageId].Name + ' ����';

    if StoragePara[StorageId][CntVibraModeIndexInBuf].Value = 0 then    //��ģʽ
        WtData := 0
    else
        WtData := StoragePara[StorageId][CntVibraRunFlowIndexInBuf].Value;

    WtResult := IniWriteAwordToInstrument( WtCaption,                           //��ʼ������λ��д��һ����
                  $0900 + (WeigherId -1) *$14 + (LoadIndex -1) *$05 + CntVibraRunFlowOffsetInInstru,
                  WtData) ;
end;
//-------------------------��ʼ��д�ֱ߼�����������---------------------------

//-----------------------��ʼ��д�ϲ���������---------------------------------
procedure IniWtStorageVibraSet(var Instrument1IniEnable : Boolean;
  WeigherId : Integer; LoadIndex : Integer);
var
    StorageId : Integer;
    MessageText : String ;
    WordsValue : Array[0..3] of Integer;
    WtResult : Integer;
begin
    StorageId := WeigherInfo[WeigherId].StorageId[LoadIndex];

    WordsValue[0] := StoragePara[StorageId][CntVibraStartDelayIndexInBuf].Value; // �ӳ���ʱ��
    WordsValue[1] := StoragePara[StorageId][CntVibraRunLongIndexInBuf].Value;    // ��ʱ��
    WordsValue[2] := StoragePara[StorageId][CntVibraOffLongIndexInBuf].Value;    // �񶯼��ʱ��

    MessageText := StorageInfo[StorageId].Name + ' �� ��������' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $0AA0 + (WeigherId -1) *$10 + (LoadIndex -1) *$04,
                                        WordsValue,
                                        3) ;

    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//---------------------��ʼ��д�ϲ��������ý���-------------------------------

//-----------------------�ƻ�������������ƫ�Ƶ�ַ0012H����----------------------
function IniWtWeigherOffset0012H(var Instrument1IniEnable : Boolean;
    IniWeigherId : Integer) : Integer;                                          //���óƻ���������ƫ�Ƶ�ַΪ0012H�Ĳ���
var
    WtResult : Integer;

    WtCaption : WideString;
begin
    WtCaption := WeigherInfo[IniWeigherId].Name + ' ��������';

    WtResult := IniWriteAwordToInstrument( WtCaption,                           //��ʼ������λ��д��һ����
                  $0400 + (IniWeigherId -1) *$20 + $0012,
                  $00) ;
end;
//---------------------�ƻ�������������ƫ�Ƶ�ַ0012H��������--------------------

//----------------------------��ʼ�������м��----------------------------------
function IniWtAggregateMidBin(var Instrument1IniEnable : boolean) : Integer;
Const
    CntWtCount = 3;
    CntWtDataCount : array[1..CntWtCount] of Integer = (1,6,6);
    CntWtFstAddr : Array[1..CntWtCount] of Integer = ($0750, $0741, $0748);
var
    WtPt : Integer;
    WtCounter : Integer ;
    WtDataBuf : array[1..10] of Integer;
    Addr : Integer;
    WtCaption : String ;
    WtResult : Integer ;
begin
    WtCaption := ' ��������ϵͳ���� ' ;
    for WtPt:=1 to CntWtCount do
    begin
        if Instrument1IniEnable then
        begin
            for WtCounter :=1 to CntWtDataCount[WtPt] do
            begin
                Addr := CntWtFstAddr[WtPt] + WtCounter -1;
                WtDataBuf[WtCounter] := AggregateConvPara[1][Addr -$0741 +1].Value ;
            end;
            IniWtWordsToInstrument( Pchar(WtCaption),
                                    CntWtFstAddr[WtPt],
                                    WtDataBuf,
                                    CntWtDataCount[WtPt]
                                  );
            case WtResult of
                0,    //д�ɹ�
                2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
                3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
                begin

                end;
                1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
                begin
                    Instrument1IniEnable := False;
                end;
            end;
        end;
    end;
end;
//--------------------------��ʼ�������м�ֽ���--------------------------------

//-----------------------------��ʼ������---------------------------------------
function IniRingToInstrument(var Instrument1IniEnable : Boolean) : Integer;
var
    WtResult : Integer;
    WtCaption : WideString;
    WtData : Integer;
begin
    FrmSplash.LbIniInfo.Caption := '���õ���...' ;

    WtCaption := ' ���� ';

    if AutoRing then
    begin
        WtData := $0001;
    end
    else
    begin
        WtData := $0000;
    end;

    WtResult := IniWriteAwordToInstrument( WtCaption,                           //��ʼ������λ��д��һ����
                  $0710,
                  WtData) ;

    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;
end;
//---------------------------ʼ���������---------------------------------------

//-------------------------��ʼ����Ͷ��˳��-------------------------------------
//�ð汾����֧���û��Զ���ƶ���Ͷ������
function IniWeighersDschDesignToInstrument(var Instrument1IniEnable : Boolean) : Integer;     //��ʼ����Ͷ��˳��
var
    MessageText : String ;
    WordsValue : Array[0..15] of Integer;
    WtResult : Integer;
    i : Integer;
begin
    for i:=0 to 15 do
    begin
        WordsValue[i] := $0000;    //�ƾ�Ϊһ��Ͷ��
    end;

    MessageText := '��Ͷ��˳�� ' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $0370,
                                        WordsValue,
                                        16) ;
    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;
end;
//-----------------------��ʼ����Ͷ��˳�����-----------------------------------

//-------------------------��ʼ����ַ0747H--------------------------------------
function IniAddr0747ToInstrument(var Instrument1IniEnable : Boolean) : Integer;    
var
    WtResult : Integer;
    WtCaption : WideString;
    WtData : Integer;
begin
    //FrmSplash.LbIniInfo.Caption := '���õ���...' ;

    WtCaption := ' 0747H ';

    WtData := $0000;

    WtResult := IniWriteAwordToInstrument( WtCaption,                           //��ʼ������λ��д��һ����
                  $0747,
                  WtData) ;

    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 1;

end;
//-----------------------��ʼ����ַ0747H����------------------------------------

//-------------------------���û���Ŀ���---------------------------------------
function IniStorageRepToInstrument(var Instrument1IniEnable : Boolean) : Integer;
var
    MessageText : String ;
    WordsValue : Array[0..15] of Integer;
    WtResult : Integer;
    i : Integer;
begin
    FrmSplash.LbIniInfo.Caption := '�ϲֻ�������...' ;

    for i:=0 to 15 do
    begin
        WordsValue[i] := $0000;    //�ƾ�Ϊһ��Ͷ��
    end;

    MessageText := '�����ϲֻ��� ' ;

    WtResult := IniWtWordsToInstrument( Pchar(MessageText),
                                        $07A0,
                                        WordsValue,
                                        16) ;
    case WtResult of
        0,    //д�ɹ�
        2,    //��λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3:    //��λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
        begin

        end;
        1:    //��λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        begin
            Instrument1IniEnable := False;
        end;
    end;

    FrmSplash.RzProgressBar1.Percent := FrmSplash.RzProgressBar1.Percent + 3;
end;
//-------------------------���û���Ŀ���---------------------------------------

//----------------------��ʼ��дһ���ֵ�������----------------------------------
{*******************************************************************************
    ����ֵ��
        0��д�ɹ�
        1����λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        2����λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3����λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
*******************************************************************************}
function IniWriteAwordToInstrument( Const Caption: WideString; Address : Integer; WordValue : Integer) : Integer;    //��ʼ������λ��д��һ����
var
    WtEnable : Boolean ;
    WaitReceiveBufPt : Integer ;
    MessageStr : String ;
begin
    WtEnable := True ;

    while (WtEnable) do
    begin
        WtAWordToInstument1MscommBuf(WaitReceiveBufPt, Address, WordValue) ;              //дһ���ֵ�ͨѶ������
        SystemRunDelayTmr := 2000;    //2��ȴ�

        while not (Instruction1ReceiveBuf[WaitReceiveBufPt].Active) do
        begin
            Application.ProcessMessages ;

            if SystemRunDelayTmr <= 0 then    //ͨѶ��ʱ
            begin
                MessageStr := 'д' + Caption + '������δ��Ӧ�������������ҿ�������ͨ��';
                MessageStr := MessageStr + #10;
                MessageStr := MessageStr + '������ǡ�����д������������񡱲�д�������������������ȡ������ť����ֹ��ʼ��������';

                case MessageBox(getfocus, Pchar(MessageStr), 'ѯ����Ϣ', MB_YESNOCANCEL) of
                    IDCANCEL :    //ȡ����ѡ,���ٳ�ʼ��������
                    begin
                        WtEnable := False ;
                        Result := 1 ;
                        break ;
                    end;
                    IDNO :    //��ѡ
                    begin
                        Result := 2;
                        WtEnable := False ;
                        break;
                    end;
                    IDYES :    //�Ǳ�ѡ�����·�����������ȴ�
                    begin
                        ;
                    end;
                end;
            end;

            if Instruction1ReceiveBuf[WaitReceiveBufPt].Active then
            begin
                if ( Instruction1ReceiveBuf[WaitReceiveBufPt].ReceiveCmd and $80 ) <> 0 then    //���յ�Ӧ���������
                begin
                    MessageStr := 'д ' + Caption + ' ������ʧ��';
                    MessageStr := MessageStr + #10;
                    MessageStr := MessageStr + '������ǡ�����д������������񡱲�д������������';

                    case messagebox(getfocus, Pchar(MessageStr), '��ʾ��Ϣ', MB_YESNO ) of
                    IDNO :    //��ѡ
                        begin
                            WtEnable := False ;    //���ٶ�ȡ����������
                            Result := 3;
                        end;
                        IDYES :    //�Ǳ�ѡ,����д
                        begin
                            ;
                        end;
                    end;
                end
                else
                begin
                    WtEnable := False ;    //��ȡ���������óɹ�
                    Result := 0;
                end;
            end;
        end;
    end;
end;
//----------------------��ʼ��дһ���ֵ�����������------------------------------







//----------------------------------------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//----------------------��ʼ��д����ֵ�������----------------------------------
{*******************************************************************************
    ����ֵ��
        0��д�ɹ�
        1����λ��û��Ӧ�𣬵����ȡ������ť����ֹ��ʼ����������
        2����λ��û��Ӧ�𣬵�����񡱰�ť�����Ա���д����
        3����λ��Ӧ��д���󣬵�����񡱰�ť�����Ա���д����
*******************************************************************************}
function IniWtWordsToInstrument( Caption : Pchar; WtAddress : Integer;
  WordsValue : array of Integer; WordsNumber : Integer) : Integer;
var
    WtEnable : Boolean ;
    WaitMscommReceiveBufPt : Integer;
    MessageStr : String ;
begin
    WtEnable := True ;

    while ( WtEnable ) do
    begin
        WtWordSToInstucment1MscommBuf( WaitMscommReceiveBufPt, WtAddress, WordsValue, WordsNumber );    //д�������ͨѶ������
        SystemRunDelayTmr := 2000;    //2��ȴ�

        while not (Instruction1ReceiveBuf[WaitMscommReceiveBufPt].Active) do
        begin
            Application.ProcessMessages ;

            if SystemRunDelayTmr <= 0 then    //ͨѶ��ʱ
            begin
                MessageStr := 'д ' + Caption + ' ������δ��Ӧ�������������ҿ�������ͨ��';
                MessageStr := MessageStr + #10;
                MessageStr := MessageStr + '������ǡ�����д������������񡱲�д�������������������ȡ������ť����ֹ��ʼ��������';

                case MessageBox(getfocus, Pchar(MessageStr), 'ѯ����Ϣ', MB_YESNOCANCEL) of
                    IDCANCEL :    //ȡ����ѡ,���ٳ�ʼ��������
                    begin
                        WtEnable := False ;
                        Result := 1 ;
                        break ;
                    end;
                    IDNO :    //��ѡ
                    begin
                        WtEnable := False ;
                        Result := 2;
                        break ;
                    end;
                    IDYES :    //�Ǳ�ѡ�����·�����������ȴ�
                    begin
                        ;
                    end;
                end;
            end;

            if Instruction1ReceiveBuf[WaitMscommReceiveBufPt].Active then
            begin
                if ( Instruction1ReceiveBuf[WaitMscommReceiveBufPt].ReceiveCmd and $80 ) <> 0 then    //���յ�Ӧ���������
                begin
                    MessageStr := 'д ' + Caption + ' ��������ʧ��';
                    MessageStr := MessageStr + #10;
                    MessageStr := MessageStr + '������ǡ�����д������������񡱲�д������������';

                    case messagebox(getfocus, Pchar(MessageStr), '��ʾ��Ϣ', MB_YESNO ) of
                        IDNO :    //��ѡ
                        begin
                            WtEnable := False ;
                            Result := 3;
                        end;
                        IDYES :    //�Ǳ�ѡ,����д
                        begin
                            ;
                        end;
                    end;
                end
                else
                begin
                    WtEnable := False ;    
                    Result := 0;
                end;
            end;
        end;
    end;
end;
//-------------------��ʼ��д����ֵ�����������---------------------------------
end.
