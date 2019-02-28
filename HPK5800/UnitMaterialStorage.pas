unit UnitMaterialStorage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzButton, Mask, RzEdit, ExtCtrls, RzLabel,
  RzPanel, DB, ADODB, DateUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TFrmMaterialStorage = class(TForm)
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    RzLabel1: TRzLabel;
    REtStorageNoteId: TRzEdit;
    Bevel1: TBevel;
    RzLabel2: TRzLabel;
    REtStuffId: TRzEdit;
    REtStuffNm: TRzEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    REtStuffType: TRzEdit;
    Bevel2: TBevel;
    RCmbSiloName: TRzComboBox;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    REdtStorageNum: TRzEdit;
    RzLabel7: TRzLabel;
    Bevel4: TBevel;
    RCmbUnit: TRzComboBox;
    RzEdit7: TRzEdit;
    REdtMan: TRzEdit;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    cBtnManulPrtDel: TcxButton;
    cxBtnMaSelForWarehousing: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure REdtStorageNumKeyPress(Sender: TObject; var Key: Char);
    procedure cxBtnMaSelForWarehousingClick(Sender: TObject);
    procedure cBtnManulPrtDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMaterialStorage: TFrmMaterialStorage;

  NoteIdDate : TDate;
  NoteCounter : Integer;
implementation

uses UnitMain, UnitGlobeVar, UnitMaterialLst;

{$R *.dfm}

procedure TFrmMaterialStorage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmMaterialStorageCrt := False;
    Action := caFree;
end;

procedure TFrmMaterialStorage.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;
end;

procedure TFrmMaterialStorage.FormShow(Sender: TObject);
var
    StorageNOteIdStr : String;
    i : Integer;
begin
    NoteIdDate := Date();

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select count(*) as RdCount from MaterialWarehousing where DtTm >= :EditDtTm';
    ADOQuery1.Parameters.ParamByName('EditDtTm').Value := DateToStr( NoteIdDate ) +' ' + '00:00:00';
    ADOQuery1.Open;
    if ADOQuery1.Eof then
    begin
        Showmessage('���ݴ������ʧ��');
        exit;
    end
    else
    begin
        StorageNOteIdStr := DateToStr(NoteIdDate) + '-' + Format('%.3d', [ADOQuery1.FieldByName('RdCount').AsInteger +1] );
    end;

    REtStorageNoteId.Text := StorageNOteIdStr ;
    


        {д���ݿ�}
{        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        try
            FrmMain.ADOConnection.BeginTrans;
            ADOQuery1.SQL.Text := 'insert into BasicInfo (ProductionNoticeIdDate, '
                            + 'ProductionNoticeIdCounter,NoteType ) values (:ProductionNoticeIdDate,'
                            + ':ProductionNoticeIdCounter,:NoteType)';
            ADOQuery1.Parameters.ParamByName('ProductionNoticeIdDate').Value := DateToStr(NoteIdDate);
            ADOQuery1.Parameters.ParamByName('ProductionNoticeIdCounter').Value := '0';
            ADOQuery1.Parameters.ParamByName('NoteType').Value := 'SiloStroageNote';
            ADOQuery1.ExecSQL;
            FrmMain.ADOConnection.CommitTrans;
        except
            FrmMain.ADOConnection.RollbackTrans;
            Showmessage('��ⵥ��Ϣ����ʧ��!');
            exit;
        end;
    end
    else
    begin
        if ADOQuery1.FieldByName('ProductionNoticeIdDate').AsDateTime >= NoteIdDate then
        begin
            NoteIdDate := Dateof(ADOQuery1.FieldByName('ProductionNoticeIdDate').AsDateTime);
            NoteCounter := ADOQuery1.FieldByName('ProductionNoticeIdCounter').AsInteger + 1;
        end
        else
        begin
            NoteCounter := 1;
        end;
    end;

    StorageNoteIdStr := DateToStr(NoteIdDate) + '-' + inttostr(NoteCounter);
    REtStorageNoteId.Text := StorageNoteIdStr; }

    RCmbSiloName.Items.Clear;
    for i:=0 to CntStorageCount -1 do
    begin
        if not StorageInfo[i].Enable then Continue;
        RCmbSiloName.Items.Add(StorageInfo[i].Name);
    end; 

    RCmbUnit.ItemIndex := 0;

    REdtMan.Text := LoginNm;

    RzEdit7.Text := DateTimeToStr(now()); //}
end;

procedure TFrmMaterialStorage.REdtStorageNumKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (key in ['0'..'9', '.', #8,#13]) then Key := #0;
end;


procedure TFrmMaterialStorage.cxBtnMaSelForWarehousingClick(
  Sender: TObject);
begin
    if not FrmMaterialLstCrt then
    begin
        FrmMaterialLst := TFrmMaterialLst.Create(Self);
        FrmMaterialLstCrt := True;
    end;
    FrmMaLstUseMode := CntFrmMaLstIsMaSelForHouse ;    //������� ;
    FrmMaterialLst.ShowModal;   
end;

procedure TFrmMaterialStorage.cBtnManulPrtDelClick(Sender: TObject);
var
    StorageSiloId : Integer;
    SearchOk      : Boolean;
    StockNow      : Double;
    i             : Integer;
    StorageNUm : Double;
begin
    {����ϲ��еĲ����Ƿ�����������}
    SearchOk := False;
    for i:=1 to CntStorageCount do
    begin
        if not StorageInfo[i].Enable then Continue;
        if Trim(RCmbSiloName.Text) = StorageInfo[i].Name then
        begin
            if Not SearchOk then
            begin
                StorageSiloId := i;
                SearchOk := True;
            end
            else
            begin
                Showmessage('��ͬ���Ƶ��ϲ���������1��');
                exit;
            end;
        end;
    end;

    if not SearchOk then
    begin
        Showmessage('��Ч���ϲ�ѡ��!');
        exit;
    end;

    {����ϲ�ԭ���Ƿ������ԭ����ͬ}
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text :='select * from Storage where ID=' + inttostr( StorageSiloId );
    ADOQuery1.Open;
    if not ADOQuery1.Eof then
    begin
        if ADOQuery1.FieldByName('Mater').AsString <> Trim(REtStuffId.Text) then
        begin
            Showmessage('�ϲ��ڲ�����ѡ����ϲ���ͬ��');
            exit;
        end;
        StockNow := ADOquery1.FieldByName('Stock').AsFloat;
    end
    else
    begin
        Showmessage('��ȡ�ϲ���Ϣʧ��!');
        exit;
    end;

    {�����������}
    try
        StorageNUm := StrToFloat( REdtStorageNum.Text );
    except
        Showmessage('����ȷ�����������');
        exit;
    end;
    if Trim(RCmbUnit.Text) = '��' then
        StorageNUm := StorageNUm *1000;

    {������ⵥ}
    Try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'insert into MaterialWarehousing ('
                            + 'ID'                                         //��ⵥ��
                            + ',MaId'                                      //ԭ�ϱ��
                            + ',MaNm'                                      //ԭ������
                            + ',MaSpec'                                    //ԭ�Ϲ��
                            + ',StorId'                                    //�ϲֺ�
                            + ',StorNm'                                    //�ϲ�����
                            + ',Amount'                                    //�������
                            + ',OldStocks'                                 //���ǰ���
                            + ',NewStosks'                                 //������
                            + ',SetMan'                                    //�Ƶ���
                            + ',DtTm'
                            + ') values ('
                            + '''' + Trim(REtStorageNoteId.Text) + ''''    //��ⵥ��
                            + ',' + Trim(REtStuffId.Text)                  //ԭ�ϱ��
                            + ',' + '''' + Trim(REtStuffNm.Text) + ''''    //ԭ������
                            + ',' + '''' + Trim(REtStuffType.Text) + ''''  //ԭ�Ϲ��
                            + ',' + inttostr(i)                            //�ϲֺ�
                            + ',' + '''' + Trim(RCmbSiloName.Text) + ''''  //�ϲ�����
                            + ',' + FloatToStr(StorageNUm)                 //�������
                            + ',' + FloatToStr(StockNow)                   //���ǰ���
                            + ',' + FloatToStr( StockNow + StorageNUm )    //������
                            + ',' + '''' + Trim(REdtMan.Text) + ''''     //�Ƶ���
                            + ',' + '''' + DateTimeToStr(Now()) + ''''
                            + ')';
        ADOQuery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Showmessage('�����ⵥʧ��');
        exit;
    end;

    {���¿��}
    try
        FrmMain.ADOConnection.BeginTrans;
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'update Storage set Stock=Stock + ' + Floattostr(StorageNUm) + ' where ID=' + inttostr( StorageSiloId );
        ADOquery1.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Showmessage('���ֵ����ʧ��');
        exit;
    end;

    Self.Close;
end;


end.
