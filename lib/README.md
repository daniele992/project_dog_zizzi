# Contains everything the user sees → Views + ViewModels

VIEW = screen (UI only)

VIEWMODEL = logic, state, functions for the view
This is the core of MVVM in Flutter.

Each screen has:
home/
├── home_view.dart
├── home_viewmodel.dart
└── widgets/

# ARCHITETTURA LOGIN
VIEW (LoginPage)
↓
VIEWMODEL (LoginViewModel)
↓
USECASE (LoginUser)
↓
REPOSITORY (AuthRepository)
↓
DATASOURCE (AuthRemoteDataSource)
↓
API .NET → SQL Server


# ARCHITETTURA GENERALE

View
↓
ViewModel
↓
UseCase (GetUsers)
↓
Repository (UserRepository)
↓
RepositoryImpl
↓
UserRemoteDataSource
↓
API .NET



UI → ViewModel → UseCase → Repository → DataSource → API



la cartella DOMAIN contiene tutto ciò che riguarda la logica di business pura, indipendente da Flutter, da librerie esterne
e da come i dati vengono recuperati o mostrati.

- ENTITIES = Contiene i modelli di dominio puri. Sono classi semplici che rappresentano i dati fondamentali dell'app,
  senza dipendenze da API, database o UI.

- REPOSITORIES = Contiene:
  Interfacce dei repository (Domain), che definiscono le operazioni disponibili.
  Implementazioni concrete (Data), che gestiscono l’accesso alle sorgenti dati (API, database, cache).
  Questo permette di mantenere un forte disaccoppiamento tra logica di business e infrastruttura.
  ESEMPI:
  LoginUser
  UpdateCart
  GetUserProfile

- USECASES = Ogni Use Case rappresenta una singola operazione di business.
  Gli use case orchestrano la logica applicativa utilizzando le interfacce dei repository. Sono completamente indipendenti da UI e framework, quindi facilmente testabili.
  ESEMPI:
  UserRepository
  ProductRepository


microtask serve per eseguire del codice "subito dopo" il ciclo corrente, ma prima di altri eventi asincroni
In pratica non vieen eseguito immediatamente, viene messeo nel microtask queue, viene eseguito appena il thread è libero, prima di altri future
è utile per evitare errori durante il build, posticipare leggermente un'operazione, assicurarsi che il contesto sia già pronto


# DIFFERENZE TRA ref.read, ref.watch e ref.listen

- REF.READ => Legge il valore di un provider una sola volta e non ascolta cambiamenti. Non causa il rebuild del widget.
Si usa generalmente dentro onPressed e quando si vuole ottenere un valore o chiamare un metodo

- REF.LISTEN => Ascolta cambiamenti ma senza rebuild, permette di agire ma con effetti collaterali.
Si usa per mostrare una snackbar, per la navigazione e logica che non riguarda la UI direttamente

- REF.WATCH => Ascolta un provider, quando il valore cambia il widget si ricostruisce (rebuild)
si usa quando si vuole una UI reattiva, il dato deve aggiornarsi automaticamente
