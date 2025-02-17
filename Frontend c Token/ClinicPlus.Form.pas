unit ClinicPlus.Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.MultiView, FMX.Objects, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.TabControl, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON,
  FMX.Edit;

type
  TClinicPlusForm = class(TForm)
    TopRCT: TRectangle;
    MenuBTN: TButton;
    Label1: TLabel;
    AtualizarBTN: TButton;
    ButtonRCT: TRectangle;
    ScheduleLYT: TLayout;
    HomePTH: TPath;
    HomeLYT: TLayout;
    HistoryPTH: TPath;
    AnimeLYT: TLayout;
    HistoryLYT: TLayout;
    SchedulePTH: TPath;
    AnimeRCT: TRectangle;
    MultiView1: TMultiView;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ContentTBC: TTabControl;
    ScheduleTBC: TTabItem;
    HomeTBC: TTabItem;
    HistoryTBC: TTabItem;
    ScheduleLTV: TListView;
    HistoryLTV: TListView;
    Layout1: TLayout;
    Circle1: TCircle;
    CPFLBL: TLabel;
    Namelbl: TLabel;
    ClienteMTB: TFDMemTable;
    AgendamentoMTB: TFDMemTable;
    HistoricoMTB: TFDMemTable;
    ClienteMTBidcliente: TAutoIncField;
    ClienteMTBnome: TStringField;
    ClienteMTBcpf: TStringField;
    ClienteMTBnascimento: TDateTimeField;
    ClienteMTBfoto: TBlobField;
    AgendamentoMTBidagendamento: TAutoIncField;
    AgendamentoMTBidfuncionario: TIntegerField;
    AgendamentoMTBidcliente: TIntegerField;
    AgendamentoMTBidlocal: TIntegerField;
    AgendamentoMTBidadmin: TIntegerField;
    AgendamentoMTBdata_agendamento: TDateField;
    AgendamentoMTBhora_agendamento: TTimeField;
    AgendamentoMTBdata_atendimento: TDateField;
    AgendamentoMTBhora_atendimento: TTimeField;
    AgendamentoMTBdata_confirmacao: TDateTimeField;
    AgendamentoMTBdata_cadastro: TDateTimeField;
    AgendamentoMTBfg_status: TStringField;
    AgendamentoMTBprofissional: TStringField;
    AgendamentoMTBpaciente: TStringField;
    AgendamentoMTBlocal: TStringField;
    HistoricoMTBidagendamento: TAutoIncField;
    HistoricoMTBidfuncionario: TIntegerField;
    HistoricoMTBidcliente: TIntegerField;
    HistoricoMTBidlocal: TIntegerField;
    HistoricoMTBidadmin: TIntegerField;
    HistoricoMTBdata_confirmacao: TDateTimeField;
    HistoricoMTBdata_agendamento: TDateField;
    HistoricoMTBhora_agendamento: TTimeField;
    HistoricoMTBdata_atendimento: TDateField;
    HistoricoMTBhora_atendimento: TTimeField;
    HistoricoMTBdata_cadastro: TDateTimeField;
    HistoricoMTBfg_status: TStringField;
    HistoricoMTBprofissional: TStringField;
    HistoricoMTBpaciente: TStringField;
    HistoricoMTBlocal: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    Label3: TLabel;
    Label4: TLabel;
    idedt: TEdit;
    Label5: TLabel;
    Button1: TButton;
    ListBoxItem5: TListBoxItem;
    cpfedt: TEdit;
    LoginFotoCIR: TCircle;
    procedure ScheduleLYTClick(Sender: TObject);
    procedure HistoryLYTClick(Sender: TObject);
    procedure HomeLYTClick(Sender: TObject);
    procedure AtualizarBTNClick(Sender: TObject);
    procedure ScheduleLTVUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ScheduleLTVButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations}
    procedure GetAgendamentoAtivo (const AToken:String);//requisi��o de agendamento
    procedure GetHistorico (const AToken:String);//requisi��ode hitorico com todos agendamentos
    procedure GetCliente (const AToken:String);//requisi��o de nome. cpf e foto do usuario
    procedure LoadCliente (const AToken:String);//carrega nome, cpf e foto do usuario
    procedure ChangeSchedule (const AID: Integer; JSON: TJSONObject);
    procedure Login(const ID, CPF: String);


  end;

const
  //EnderecoServidor= //http192.168.0.110:9000/';
  EnderecoServidor='http://localhost:9000/';
//  token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'+
//  '.eyJpYXQiOjE3MTg3MDg5ODksImV4cCI6MTcxODc5NTM4OSwiaXNzIjoibG9jYWxob3'+
//  'N0IiwiaWQiOiIxIiwibm9tZSI6IkRFTklMU09OIE1PUklMSU4iLCJjcGYiOiI0N'+
//  'DQuNDQ0LjQ0NC00NCIsIm5hc2NpbWVudG8iOiIxOFwvMTBcLzE5NzIifQ.'+
//  'MzgtP2pjkd-OSZc8rydHwsnr1JmJKp9sl66xgY7cCrE';

var
  ClinicPlusForm: TClinicPlusForm;
  userID: Integer; //usado para facilitar testes
  FotoStream: TMemoryStream;
  BrushBmp: TBrushBitmap;
  Token:String;

implementation

uses fmx.Ani, restrequest4d, dataset.serialize,DataSet.Serialize.Adapter.RESTRequest4D, system.threading;

{$R *.fmx}



procedure TClinicPlusForm.AtualizarBTNClick(Sender: TObject);
begin
//Atualiza registros em Thread separada
TTask.Run(procedure
begin
  GetAgendamentoAtivo(Token);
  GetHistorico(Token);
end);


end;

procedure TClinicPlusForm.Button1Click(Sender: TObject);
begin
//valida��o das informa��es
if(IDEDT.Text ='') or (CPFEDT.Text ='') then
raise Exception.Create('Informe o ID e o CPF');//falha se vazio
//executamos as requisicoes em thread separada
//TTask.Run(procedure
//begin
  Login(IDEDT.Text,CPFEDT.Text);//faz login primeiro
  LoadCliente(Token);//carrega info do usuario
  GetAgendamentoAtivo(token); //carrega agendamentos ativos
  GetHistorico(Token);//carrega historico de agendamentos
//  TThread.Synchronize(TThread.Current, procedure begin
  //copia foto do usuario
  LoginFotoCIR.Fill.Bitmap.Assign(Circle1.Fill.Bitmap);
  //esconde o painel
  MultiView1.HideMaster;

//  end);
//end);

end;

procedure TClinicPlusForm.ChangeSchedule(const AID: Integer; JSON: TJSONObject);
begin
TRequest.New.BaseURL(EnderecoServidor+'agendamento') //URL da API
.ResourceSuffix (AID.ToString) //ID do registro
.AddBody(JSON, False)//JSON com registro atualizado
.Accept('application/json')//tipo de dados da resposta que esperamos
.Put;





end;

procedure TClinicPlusForm.FormCreate(Sender: TObject);
begin
//configura DatasetSerialize para manter todos os nomes dos campos em minusculas
//data_confirma��o ao inv�s de dataConfirmacao
TDataSetSerializeConfig.GetInstance.CaseNameDefinition := TCaseNameDefinition.cndLower;
//Ajusta posicionamento do retangulo animado
AnimeRct.Position.X :=HomeLYT.Position.X;
//grava temporariamente nosso usuario de teste
//at� criarmos a aparte que identifica o usuario no APP
//UserID := 1;
TTask.Run(procedure
begin
  LoadCliente(Token);
  GetAgendamentoAtivo(Token);
  GetHistorico(Token);
end);
   userid:=1;
end;

procedure TClinicPlusForm.GetAgendamentoAtivo(const AToken:String);
begin
  TRequest.New.BaseURL (EnderecoServidor+ 'agendamento') //URL da API
  .AddHeader('Authorization', AToken, [poDoNotEncode])
  .AddParam ('fg_status', 'a')//queryParam-filtra apenas status ativo
  //.AddParam ('idcliente', User.ToString) //queryParam-filtra apenas pertence ao usuario
  .Accept ('application/json') //tipo de dados da resposta que esperamos
//  .DataSetAdapter (AgendamentoMTB) //convers�o de JSON para DATASET
  .Adapters(TDataSetSerializeAdapter.New(AgendamentoMTB))
  .Get;                                 //verbo da requisi��o
end;

procedure TClinicPlusForm.GetCliente(const AToken: String);
begin
Trequest.New.BaseURL(EnderecoServidor+'cliente')//URL da API
.AddHeader('Authorization', AToken, [poDoNotEncode])
//.ResourceSuffix(ID.ToString) // diciona /1 na url
.Accept('application/json') //tipo de dados da resposta que esperamos
//.DataSetAdapter(clienteMTB) //Convers�o de JSON para DATASET
.Adapters(TDataSetSerializeAdapter.New(clientemtb))
.Get; //verbo da requisi��o
end;

procedure TClinicPlusForm.GetHistorico(const AToken: String);
begin
Trequest.New.BaseURL(EnderecoServidor+'agendamento')//URL da API
.AddHeader('Authorization',AToken, [poDoNotEncode])
//AddParam('idcliente',User.ToString)//QueryParam -
.Accept('aplication/json')//tipo de dados da resposta que esperamos
.Adapters(TDataSetSerializeAdapter.New(historicomtb))
.Get; //verbo da requisi��o



end;

procedure TClinicPlusForm.HistoryLYTClick(Sender: TObject);
begin
//anima��o do retangulo de navega��o
TAnimator
.AnimateFloat(AnimeRCT, //componente do formulario a ser animado
'position.x', //propriedade do componente a ser animado
HistoryLYT.Position.X, //valor da prop. ao final da anima��o
0.5, //dura��o da anima��o
TAnimationType.Out, //tipo da anima��o (entrada/saida ou ambos)
TInterpolationType.Bounce //tipo da interpola��o da anima��o
);
//anima��o do tabcontrol
ContentTBC
.SetActiveTabWithTransitionAsync(
HistoryTBC,//Aba que ser� exibida
TTabTransition.Slide, // transi��o estilo escorrega
TTabTransitionDirection.Normal, // anima��o da direita para esquerda (normal)
nil // ponteiro para execu��o de fun��o ao terminar transi��o.
);


end;

procedure TClinicPlusForm.HomeLYTClick(Sender: TObject);
var
TabDirection: TTabTransitionDirection;
begin
// apenas para o bot�o do centro ser� necess�rio
// ajustar o sentido da anima��o de acordo com
// a pagina atual (direita p/ esquerda ou
// da esuqerda p/ direita)
if ContentTBC.ActiveTab.Index > HomeTBC.Index then
TabDirection :=TTabTransitionDirection.Reversed
else
TabDirection := TTabTransitionDirection.Normal;
//anima��o do retangulo de anima��o
TAnimator
.AnimateFloat ( AnimeRCT, //componente do formulario a ser animado
'position.x', //propriedade do componente a ser animado
HomeLYT.Position.X, //valor da prop. ao final da anima��o
0.5, //dura��o da anima��o
TAnimationType.Out, //tipo da anima��o (entrada?saida ou ambos)
TInterpolationType.Bounce //tipo da interpola��o da anima��o
);
//anima��o do tabcontrol
ContentTBC
.SetActiveTabWithTransitionAsync(
HomeTBC, //aba que ser� exibida
TTabTransition.Slide, //transi��o estilo escorrega
TabDirection, //anima��o normal ou reserva, depende do IF acima
nil //ponteiro para execu��o de fun��o ao terminar transi��o
);




end;

procedure TClinicPlusForm.LoadCliente(const AToken: String);
var
FotoStream: TmemoryStream;
BrushBmp: TBrushBitmap;
begin
//GetCliente(ID);//requisi��o na Backend (API)
GetCliente(AToken);//requisi��o no backend (API)
//usar synchronize apenas com a certeza de que LoadCliente ser� chamado dentro de
//uma thread diferente da thread principal.
TThread.Synchronize (TThread.CurrentThread, procedure
begin
  NameLBL.Text := ClienteMTBnome.AsString; //grava nome no formulario
  CPFLBL.Text := ClienteMTBCPF.AsString; //grava CPF no formulario
  FotoStream := TMemoryStream.Create;//cria stream para ler foto
  BrushBmp := Tbrushbitmap.Create;//cria brush para desenhar foto no TCircle

  try
    ClienteMTBFoto.SaveToStream(FotoStream);// l� a foto do campo
    BrushBmp.Bitmap.LoadFromStream(FotoStream);// Desenha a foto no brush
    BrushBmp.WrapMode :=TWrapMode.TileStretch;// ajusta imagem ao tamanho do componente
    Circle1.Fill.Bitmap.Assign(BrushBmp);//desenha imagem no componente.

  finally
  //libera vari�veis temporais utilizadas no processo de exibir a foto.
  FotoStream.Free;
  BrushBmp.Free;

  end;
end);




end;

procedure TClinicPlusForm.Login(const ID, CPF: String);
var
JSON: TJSONObject;
Resposta: IResponse;
begin
JSON := TJSONObject.Create;
try
  //cria json com informa��es para requisi��o
  JSON.AddPair('idcliente', ID);
  JSON.AddPair('cpf', cpf);
  try
    Resposta := TRequest.New
    .BaseURL(EnderecoServidor+'token')//URL da API
    .AddBody(JSON, False)//JSON com registro atualizado
    .Accept('application/json')//tipo de dados da resposta que esperamos
    .Post; //Verbo da requisi��o
    if Resposta.StatusCode = 200  then begin //token recebido com sucesso
    ShowMessage('Sucesso: '+Resposta.Content);
    Token := 'Bearer'+Resposta.Content; //Concatena 'Bearer' com token recebido.
    end
    else begin //falha ao pegar o token
    ShowMessage('Falha na autentica��o:'+Resposta.Content); //falha de id ou cpf invalido
    end;
    except
    on E:Exception do begin
      ShowMessage('Flha no login:'+E.Message); //falhas de rede, etc.
    end;
    end;


  finally
  JSON.Free; //libera memoria da variavel

  end;
  end;



procedure TClinicPlusForm.ScheduleLTVButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
  var
  JSON: TJSONObject;
  begin
    if AObject.Name.ToLower = 'confirmabutton' then

begin
  AgendamentoMTB.Edit;//muda dataset para modo de edi��o
  AgendamentoMTBfg_status.AsString := 'C'; //altera valor do status
  AgendamentoMTBdata_confirmacao.Value :=Now;//altera para data/hora atual
  AgendamentoMTB.Post;//salva dados no dataset local
  JSON := AgendamentoMTB.ToJSONObject();//converte registro para JSON
  ChangeSchedule(AgendamentoMTBidagendamento.Value, JSON); //envia mudan�as para back-end
  JSON.Free;//libera memoria
end;
if AObject.Name.ToLower = 'cancelabutton' then
begin
  AgendamentoMTB.Edit;//muda dataset para modo edi��o
  AgendamentoMTBfg_status.AsString := 'I';//altera valor do status
  AgendamentoMTBdata_confirmacao.Value := Now;//altera para data/hora
  AgendamentoMTB.Post;//salva dados no dataset local
  JSON := AgendamentoMTB.ToJSONObject();//converte registro para JSON
  ChangeSchedule(AgendamentoMTBidagendamento.Value, JSON);//envia mudan�as para back-end
  JSON.Free;//libera memoria
end;
//Atualiza os registos em thread separadas.
TTask.Run(procedure
begin
  Sleep(50);
  AgendamentoMTB.EmptyDataSet;//limpa dataset
  HistoricoMTB.EmptyDataSet;//limpa dataset
  GetAgendamentoAtivo(Token);//carrega dados atualizados do back-end
  GetHistorico(Token);
end);



end;

procedure TClinicPlusForm.ScheduleLTVUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
//Ajusta altura dos bot�es no item do listview
AItem.Objects.DrawableByName('ConfirmaButton').Height :=37;
AItem.Objects.DrawableByName('CancelaButton').Height :=37;

end;

procedure TClinicPlusForm.ScheduleLYTClick(Sender: TObject);
begin
//Anima��o do retangulo de navega��o
Tanimator
.AnimateFloat(AnimeRCT, //Componente de formul�rio a ser animado
'position.x', // propriedade de componente a ser animado
scheduleLYT.Position.X, //valor da prop. ao final da anima��o
0.5, // Dura��o da anima��o
TAnimationType.Out, //tipo da anima��o (entrada/saida ou ambos)
TInterpolationType.Bounce //tipo da interpola��o da anima��o
);
// Anima��o do Tabcontrol
 ContentTBC
.SetActiveTabWithTransitionAsync(
ScheduleTBC, //aba que ser� exibida
TTabTransition.Slide, //transi��o estilo escorrega
TTabTransitionDirection.Reversed, //anima��o da esquerda para a direita (reserva)
nil //ponteiro para execu��o da fun��o ao terminar transi��o
);



end;



end.
