{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit UnitProceNotice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, ExtCtrls, sGroupBox, sSpinEdit, Mask,
  sMaskEdit, sCustomComboEdit, sToolEdit, sComboBox, Buttons, sBitBtn, DB,
  ADODB, DateUtils;

type
  TFrmProdNotice = class(TForm)
    sGroupBox1: TsGroupBox;
    Label2: TLabel;
    sEtFlowId: TsEdit;
    Shape1: TShape;
    Label1: TLabel;
    sCmbBxTaskCode: TsComboBox;
    Label4: TLabel;
    sCmbBxContract: TsComboBox;
    Label5: TLabel;
    sDtEdtPro: TsDateEdit;
    sTmPk: TsTimePicker;
    Shape3: TShape;
    Shape2: TShape;
    Label6: TLabel;
    sEdtCompany: TsEdit;
    Label7: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    sCmbBxClient: TsComboBox;
    Shape7: TShape;
    Shape8: TShape;
    Label8: TLabel;
    Shape9: TShape;
    Shape10: TShape;
    Label9: TLabel;
    sEtDistince: TsEdit;
    Label10: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    sCmbBxProjNm: TsComboBox;
    Label11: TLabel;
    sCmbBxCastPart: TsComboBox;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    sCmbBxPourMethod: TsComboBox;
    Label12: TLabel;
    sCmbBxProjAddr: TsComboBox;
    Label13: TLabel;
    Label14: TLabel;
    sCmbBxStrength: TsComboBox;
    Shape19: TShape;
    Shape20: TShape;
    Label15: TLabel;
    sCmbBxConcrSeepage: TsComboBox;
    Shape21: TShape;
    Shape22: TShape;
    Label16: TLabel;
    sCmbBxConcrFrost: TsComboBox;
    Shape23: TShape;
    Shape24: TShape;
    Label17: TLabel;
    Shape26: TShape;
    sBitBtn1: TsBitBtn;
    Label18: TLabel;
    Shape25: TShape;
    Shape27: TShape;
    sEtTecReq: TsEdit;
    Shape28: TShape;
    Label19: TLabel;
    sCmbBxRecipeCode: TsComboBox;
    Shape29: TShape;
    Label20: TLabel;
    sCmbBxTruck: TsComboBox;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    sCmbBxDispatcher: TsComboBox;
    Label21: TLabel;
    Label22: TLabel;
    sCmbBxDriver: TsComboBox;
    Shape34: TShape;
    Shape35: TShape;
    Label23: TLabel;
    Shape36: TShape;
    Shape37: TShape;
    Label24: TLabel;
    Label25: TLabel;
    Shape40: TShape;
    sEtTotalAmount: TsEdit;
    Shape41: TShape;
    Label26: TLabel;
    sEtProdCountere: TsEdit;
    Shape42: TShape;
    Shape43: TShape;
    Label27: TLabel;
    sCmbBxInspector: TsComboBox;
    Label28: TLabel;
    sEtOperator: TsEdit;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sBtBtnOk: TsBitBtn;
    sBitBtn5: TsBitBtn;
    Label29: TLabel;
    sEtProdAmount: TsEdit;
    Shape44: TShape;
    Shape45: TShape;
    Shape38: TShape;
    Shape39: TShape;
    ADOQry: TADOQuery;
    sCmbBxConcrSlump: TsComboBox;
    Label30: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure sCmbBxTaskCodeChange(Sender: TObject);
    procedure sCmbBxTruckChange(Sender: TObject);
    procedure sBtBtnOkClick(Sender: TObject);
    procedure sEtProdAmountKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    IsAddNotice : Boolean;

    procedure IniNoticeEdtInfo();          //��ʼ���ɳ����༭��Ϣ
    procedure IniProdNoticeForAddNew();    //�����µ��ɳ�����ʼ������
    procedure IniProdNoticeForModify();    //�޸��ɳ�����ʼ������
    procedure AddNewNoticeIntoDb();
    procedure ModifyANoticeInDb();
  public
    { Public declarations }
  end;

var
  FrmProdNotice: TFrmProdNotice;

implementation

uses UnitMain, UnitGlobeVar;

{$R *.dfm}

procedure TFrmProdNotice.FormCreate(Sender: TObject);
begin
    ADOQry.Connection := FrmMain.ADOConnection;
end;

procedure TFrmProdNotice.FormShow(Sender: TObject);
begin
    IniNoticeEdtInfo();          //��ʼ���ɳ����༭��Ϣ

    if (FrmMain.sBtnProdNotice.Caption <> '�����ɳ�') then
    begin
        if FrmMain.AdvStrGdProdNotice.Cells[0, FrmMain.AdvStrGdProdNotice.Row ] = '' then
            FrmMain.sBtnProdNotice.Caption := '�����ɳ�';
    end;

    if FrmMain.sBtnProdNotice.Caption = '�����ɳ�' then
    begin
        IniProdNoticeForAddNew();    //�����µ��ɳ�����ʼ������
    end
    else
    begin
        IniProdNoticeForModify();    //�޸��ɳ�����ʼ������
    end;
    
end;

procedure TFrmProdNotice.IniNoticeEdtInfo();          //��ʼ���ɳ����༭��Ϣ
begin
    sCmbBxTaskCode.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Text := 'select distinct(Code) as TaskCode from ProdTask where (Flag not like ' + '''' + '%a%' + '''' +') and (Flag not like ' + '''' + '%d%' + '''' + ') order by Code';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxTaskCode.Items.Add(ADOQry.FieldbyName('TaskCode').AsString);
        ADOQry.Next;
    end;
    
    {��ͬ���}
    //sCmbBxContract.Items.Clear;
    //ADOQry.Close;
    //ADOQry.SQL.Text := 'select distinct(

    {��������}
    sDtEdtPro.Date := Date();
    sTmPk.Time := Time();

    {��Ӧ������}
    sEdtCompany.Text := UserCompany ;

    {�ͻ�����}
    sCmbBxClient.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'TCu' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxClient.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;

    {��������}
    sCmbBxProjNm.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'PjNm' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxProjNm.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;

    {ʩ����λ}
    sCmbBxCastPart.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'PjCaPt' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxCastPart.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;
    
    {���̵�ַ}
    sCmbBxProjAddr.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'PjAdd' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxProjAddr.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;

    {������ʽ}
    sCmbBxPourMethod.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'PoMd' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxPourMethod.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;

    {ǿ�ȵȼ�}
    sCmbBxStrength.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'RSt' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxStrength.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;

    {�����ȼ�}
    sCmbBxConcrSeepage.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'Rse' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxConcrSeepage.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;

    {�����ȼ�}
    sCmbBxConcrFrost.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'RFr' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxConcrFrost.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;

    {̮���}
    sCmbBxConcrSlump.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select RdValues from BasiInfo where Code=' + '''' + 'RSl' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxConcrSlump.Items.Add(ADOQry.FieldByName('RdValues').AsString);
        ADOQry.Next;
    end;
    
    {��ȱ��}
    sCmbBxRecipeCode.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select distinct(Code) as Reccode from RecipeInfo where Flag like ' + '''' + '%0%' + '''';
    ADOQry.Open;
    ADOQry.First;
    while not ADOQry.Eof do
    begin
        sCmbBxRecipeCode.Items.Add(ADOQry.FieldByName('Reccode').AsString);
        ADOQry.Next;
    end;

    {���䳵��}
    sCmbBxTruck.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select Code from Truck';
    ADOQry.Open;
    while not ADOQry.Eof do
    begin
        sCmbBxTruck.Items.Add(ADOQry.FieldByName('Code').AsString);
        ADOQry.Next;
    end;

    {��ʻԱ}
    sCmbBxDriver.Items.Clear;
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select distinct(Driver1) as Driver from Truck';
    ADOQry.Open;
    while not ADOQry.Eof do
    begin
        sCmbBxDriver.Items.Add(ADOQry.FieldByName('Driver').AsString);
        ADOQry.Next;
    end;

    sEtOperator.Text := LoginNm;
end;

procedure TFrmProdNotice.IniProdNoticeForAddNew();    //�����µ��ɳ�����ʼ������
begin
    IsAddNotice             := True;

    sEtFlowId.Text          := '';        //�ɳ�����ˮ��
    sCmbBxTaskCode.Text     := '';        //���񵥺�
    sCmbBxContract.Text     := '';        //��ͬ���
    sCmbBxClient.Text       := '';        //�û�����
    sEtDistince.Text        := '0.0';     //�������
    sCmbBxProjNm.Text       := '';        //��������
    sCmbBxCastPart.Text     := '';        //ʩ����λ
    sCmbBxProjAddr.Text     := '';        //ʩ����ַ
    sCmbBxPourMethod.Text   := '';        //������ʽ
    sCmbBxStrength.Text     := '';        //ǿ�ȵȼ�
    sCmbBxConcrSeepage.Text := '';        //�����ȼ�
    sCmbBxConcrFrost.Text   := '';        //�����ȼ�
    sCmbBxConcrSlump.Text   := '';        //�����ȼ�
    sEtTecReq.Text          := '';        //����Ҫ��
    sCmbBxRecipeCode.Text   := '';        //��ȱ��
    sCmbBxTruck.Text        := '';        //���䳵��
    sCmbBxDriver.Text       := '';        //��ʻԱ
    sCmbBxDispatcher.Text   := '';        //����Ա
    sEtProdAmount.Text      := '0.0';     //��������
    sEtTotalAmount.Text     := '0.0';     //�ۼƷ���
    sEtProdCountere.Text    := '0';       //�ۼƳ���

    sBtBtnOk.Caption        := '�����ɳ���';
end;

procedure TFrmProdNotice.IniProdNoticeForModify();    //�޸��ɳ�����ʼ������
var
    SelRow : Integer;
    SelFlowID : String;
begin
    IsAddNotice := False;

    SelRow := FrmMain.AdvStrGdProdNotice.Row;
    SelFlowID := FrmMain.AdvStrGdProdNotice.Cells[0, SelRow];


    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select'
                     +  ' ' + 'A1.ID as FlowID'
                     + ',A1.ProdTaskCode as ProdTaskCode'
                     + ',A1.ProdRecCode as ProdRecCode'
                     + ',A1.Dispatcher as ProdDispatcher'
                     + ',A1.Inspector as ProdInspector'
                     + ',A1.ProdTruckCode as ProdTruckCode'
                     + ',A1.Driver as TruckDriver'
                     + ',A1.ProdAmount as ProdAmount'
                     + ',A1.NoticeDt as NoticeDt'

                     + ',A2.Customer as Customer'
                     + ',A2.ProjNm as ProjNm'
                     + ',A2.ProjAddr as ProjAddr'
                     + ',A2.Distance as ProjDistance'
                     + ',A2.CastPart as ProjCastPart'
                     + ',A2.PourMethod as ProjPourMethod'
                     + ',A2.ConcrStrength as ProjConcrStrength'
                     + ',A2.ConcrSeepage as ProjConcrSeepage'
                     + ',A2.ConcrFrost as ProjConcrFrost'
                     + ',A2.ConcrSlump as ProjConcrSlump'
                     + ',A2.TecReq as ProjTecReq'
                     + ',A2.TolAmount as ProjTolAmount'
                     + ',A2.TolVehs as ProjTolVehs'
                     + ' ' + 'from (ProdNotice A1 LEFT JOIN ProdTask A2 on A1.ProdTaskCode = A2.Code)'
                     + ' ' + 'where A1.ID =' + SelFlowID;

    ADOQry.Open;
    if not ADOQry.Eof then
    begin
        sEtFlowId.Text    := ADOQry.FieldByName('FlowID').AsString;
        sCmbBxTaskCode.Text := ADOQry.FieldByName('ProdTaskCode').AsString;     //���񵥱��';
        sCmbBxRecipeCode.Text := ADOQry.FieldByName('ProdRecCode').AsString;    //�������
        sCmbBxDispatcher.Text := ADOQry.FieldByName('ProdDispatcher').AsString; //����Ա
        sCmbBxInspector.Text := ADOQry.FieldByName('ProdInspector').AsString;//�ʼ�Ա
        sCmbBxTruck.Text := ADOQry.FieldByName('ProdTruckCode').AsString;//���䳵��
        sCmbBxDriver.Text := ADOQry.FieldByName('TruckDriver').AsString;//��ʻԱ
        sEtProdAmount.Text := ADOQry.FieldByName('ProdAmount').AsString;//��������
        sDtEdtPro.date := Dateof(ADOQry.FieldByName('NoticeDt').AsDateTime);
        sTmPk.Time := Timeof(ADOQry.FieldByName('NoticeDt').AsDateTime);
        sCmbBxProjNm.Text := ADOQry.FieldByName('ProjNm').AsString;
        sCmbBxProjAddr.Text := ADOQry.FieldByName('ProjAddr').AsString;
        sEtDistince.Text := ADOQry.FieldByName('ProjDistance').AsString;
        sCmbBxCastPart.Text := ADOQry.FieldByName('ProjCastPart').AsString;
        sCmbBxPourMethod.Text := ADOQry.FieldByName('ProjPourMethod').AsString;
        sCmbBxStrength.Text := ADOQry.FieldByName('ProjConcrStrength').AsString;
        sCmbBxConcrSeepage.Text := ADOQry.FieldByName('ProjConcrSeepage').AsString;
        sCmbBxConcrFrost.Text := ADOQry.FieldByName('ProjConcrFrost').AsString;
        sCmbBxConcrSlump.Text := ADOQry.FieldByName('ProjConcrSlump').AsString;
        sEtTecReq.Text := ADOQry.FieldByName('ProjTecReq').AsString;
        sEtTotalAmount.Text := ADOQry.FieldByName('ProjTolAmount').AsString;
        sEtProdCountere.Text:= ADOQry.FieldByName('ProjTolVehs').AsString;
        scmbBxClient.Text := ADOQry.FieldByName('Customer').AsString ;
    end;

    sBtBtnOk.Caption        := '�޸��ɳ���';

end;

procedure TFrmProdNotice.sBitBtn1Click(Sender: TObject);
begin
   sCmbBxConcrSlump.SetFocus;
   sCmbBxConcrSlump.SelText := sCmbBxConcrSlump.Text + '��' ;
end;

procedure TFrmProdNotice.sEtProdAmountKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in['0'..'9', '.', #8, #13]) then Key := #0;
end;


procedure TFrmProdNotice.sBitBtn5Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmProdNotice.sCmbBxTaskCodeChange(Sender: TObject);
begin
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select * from ProdTask where Code=' + '''' + Trim(sCmbBxTaskCode.Text) + '''';
    ADOQry.Open;
    if ADOQry.Eof then
    begin
        Showmessage('��Ч�����񵥺�!');
    end
    else
    begin
        sCmbBxClient.Text       := ADOQry.FieldByName('Customer').AsString;
        sCmbBxContract.Text     := ADOQry.FieldByName('ContractNO').AsString;
        sEtDistince.Text        := ADOQry.FieldByName('Distance').AsString;
        sCmbBxProjNm.Text       := ADOQry.FieldByName('ProjNm').AsString;
        sCmbBxCastPart.Text     := ADOQry.FieldByName('CastPart').AsString;
        sCmbBxProjAddr.Text     := ADOQry.FieldByName('ProjAddr').AsString;
        sCmbBxPourMethod.Text   := ADOQry.FieldByName('PourMethod').AsString;
        sCmbBxStrength.Text     := ADOQry.FieldByName('ConcrStrength').AsString;
        sCmbBxConcrSeepage.Text := ADOQry.FieldByName('ConcrSeepage').AsString;
        sCmbBxConcrFrost.Text   := ADOQry.FieldByName('ConcrFrost').AsString;
        sCmbBxConcrSlump.Text   := ADOQry.FieldByName('ConcrSlump').AsString;
        sEtTecReq.Text          := ADOQry.FieldByName('TecReq').AsString;
        sEtTotalAmount.Text     := ADOQry.FieldByName('TolAmount').AsString;
        sEtProdCountere.Text    := ADOQry.FieldByName('TolVehs').AsString;
        sCmbBxRecipeCode.Text   := ADOQry.FieldByName('RecipeCode').AsString;
    end;
end;

procedure TFrmProdNotice.sCmbBxTruckChange(Sender: TObject);
begin
    ADOQry.Close;
    ADOQry.SQL.Clear;
    ADOQry.SQL.Text := 'select * from Truck where Code=' + '''' + Trim(sCmbBxTruck.Text) + '''';
    ADOQry.Open;
    if not ADOQry.Eof then
    begin
        sCmbBxDriver.Text := ADOQry.FieldByName('Driver1').AsString;
        sEtProdAmount.Text := Format('%.1f', [ADOQry.FieldByName('Capacity').AsFloat]);
    end;
end;

procedure TFrmProdNotice.sBtBtnOkClick(Sender: TObject);
begin
    if IsAddNotice then    //�����µ��ɳ���
    begin
        AddNewNoticeIntoDb();
    end
    else                  //�޸����е��ɳ���
    begin
        ModifyANoticeInDb();
    end;
end;

procedure TFrmProdNotice.AddNewNoticeIntoDb();
var
    RecipeCode : String;
    ExResult : Boolean;
    RowCount : Integer;
begin
    RecipeCode := Trim(sCmbBxRecipeCode.Text);
    if RecipeCode = '' then
    begin
        Showmessage('��Ч�������䷽������ʧ��!');
        exit;
    end;

    {д�ɳ��������ݿ�}
    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQry.Close;
        ADOQry.SQL.Clear;
        ADOQry.SQL.Text := 'insert into ProdNotice '
                         + '('
                         + 'ProdTaskCode'
                         + ',ProdRecCode'
                         + ',ProdTruckCode'
                         + ',Driver'
                         + ',ProdAmount'
                         + ',NoticeDt'
                         + ',Dispatcher'
                         + ',Inspector'
                         + ') values '
                         + '('
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
    end;

    {���������������}
    if ExResult then
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
    end;
end;

procedure TFrmProdNotice.ModifyANoticeInDb();
var
    ExResult : Boolean;
    RecipeCode : String;
    ModifyRow : Integer;
begin
    RecipeCode := Trim(sCmbBxRecipeCode.Text);
    if RecipeCode = '' then
    begin
        Showmessage('��Ч�������䷽������ʧ��!');
        ExResult := False;
    end;

    {�����ɳ��������ݿ�}
    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQry.Close;
        ADOQry.SQL.Clear;
        ADOQry.SQL.Text := 'update ProdNotice set'
                         + ' ' + 'ProdTaskCode='  + '''' + Trim(sCmbBxTaskCode.Text) + ''''    //�������񵥱��
                         + ',' + 'ProdRecCode='   + '''' + Trim(sCmbBxRecipeCode.Text) + ''''   //�������
                         + ',' + 'ProdTruckCode=' + '''' + Trim(sCmbBxTruck.Text) + ''''        //���䳵��
                         + ',' + 'Driver='        + '''' + Trim(sCmbBxDriver.Text) + ''''       //˾��
                         + ',' + 'ProdAmount='    + Trim(sEtProdAmount.Text)                    //�ŷ���
                         + ',' + 'NoticeDt='      + '''' + Trim(sDtEdtPro.Text) + ' ' + Trim(sTmPk.Text) + ''''
                         + ',' + 'Dispatcher='    + '''' + Trim(sCmbBxDispatcher.Text) + ''''   //����Ա
                         + ',' + 'Inspector='     + '''' + Trim(sCmbBxInspector.Text) + ''''    //�ʼ�Ա
                         + ' ' + 'where ID=' + Trim(sEtFlowId.Text);
        ADOQry.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
        ExResult := True;
    except
        FrmMain.ADOConnection.RollbackTrans;
        ExResult := False;
    end;

    {���������������}
    if ExResult then
    begin
        ModifyRow := FrmMain.AdvStrGdProdNotice.Row;

        FrmMain.AdvStrGdProdNotice.cells[0, ModifyRow] := Trim(sEtFlowId.Text);
        FrmMain.AdvStrGdProdNotice.cells[2, ModifyRow] := Trim(sEtFlowId.Text);    //'��ˮ��';
        FrmMain.AdvStrGdProdNotice.cells[3, ModifyRow] := Trim(sCmbBxTaskCode.Text);    //���񵥱��';
        FrmMain.AdvStrGdProdNotice.cells[4, ModifyRow] := Trim(sCmbBxRecipeCode.Text);  //'�������';
        FrmMain.AdvStrGdProdNotice.cells[5, ModifyRow] := Trim(sCmbBxTruck.Text);       //'���ͳ���';
        FrmMain.AdvStrGdProdNotice.cells[6, ModifyRow] := Trim(sEtProdAmount.Text);     //'����';
        FrmMain.AdvStrGdProdNotice.cells[7, ModifyRow] := Trim(sCmbBxClient.Text)
                                                          + '-' + Trim(sCmbBxProjNm.Text)
                                                          + '-' + Trim(sCmbBxCastPart.Text) ;    //'������Ϣ';    //�ͻ�����  ��������  ������λ
        FrmMain.AdvStrGdProdNotice.cells[8, ModifyRow] := Trim(sCmbBxStrength.Text)
                                                          + '-' + Trim(sCmbBxConcrSlump.Text)
                                                          + '-' + Trim(sCmbBxConcrSeepage.Text)
                                                          + '-' + Trim(sEtTecReq.Text);    //'����Ҫ��';    //ǿ�ȵȼ�  ̮���  �����ȼ�  ����Ҫ��
    end; 

    if ExResult then
    begin
        Self.Close ;
    end;
end;


end.