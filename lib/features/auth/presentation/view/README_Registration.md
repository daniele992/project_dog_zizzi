# PASSAGGI REGISTRAZIONE
FLUTTER
SignUpPage
↓
SignUpViewModel
↓ HTTP POST
API .NET
Controller
↓
UseCase / Service
↓
Repository
↓
Entity Framework Core
↓
SQL Server (SSMS)



[UI / View]
│
▼
SignUpViewModel (StateNotifier)
│   - Chiama `registerUser(user)`
▼
UseCase: RegisterUser
│   - Incapsula la logica di business
│   - Chiama il repository
▼
Repository: AuthRepositoryImpl
│   - Converte il modello UserRegistrationModel in JSON
│   - Gestisce eventuali errori
│   - Chiama il datasource
▼
Datasource: AuthRemoteDataSourceImpl
│   - Fa la richiesta HTTP POST al server
│   - Gestisce status code e possibili errori di rete
│   - Lancia `AuthException` in caso di problemi
▼
Server / API
│   - Riceve dati JSON
│   - Crea l’utente nel database
│   - Ritorna status code 200 se successo

# DETTAGLI DEL FLUSSO CON ERRORI
 - 1. L'utente compila il form nella UI e clicca "Registrati";
 - 2. SignUpViewModel.signUp(user) viene chiamato e imposta lo stato su loading. Chiama UseCase RegisterUser.call(user).
 - 3. Il UseCase chiama AuthRepositoryImpl.register (user).
      °Converte user.toJson();
      °Chiama dataSource.register(json);
 - 4. AuthRemoteDataSourceImpl.register(data) invia la richiesta HTTP
      °Se statusCode == 200, ritorna true.
      °Se c'è un errore o status diverso, lancia AuthException.
 - 5. Il Repository cattura eventuali eccezioni, logga l'errore e può ritornare false.
 - 6. Il ViewModel riceve il risultato (true/false) o l'eccezione, e aggiorna lo stato AsyncValue<bool>
 - 7. La UI reagisce aggiornando lo stato visivo (es. messaggio di successo o errore)


# IN DEFINITVA ECCO COSA SUCCEDE QUANDO PREMI “REGISTRATI”:

1️⃣ View crea il model
2️⃣ ViewModel riceve i dati
3️⃣ UseCase viene chiamato
4️⃣ Repository astratto inoltra
5️⃣ RemoteDataSource fa HTTP POST
6️⃣ API .NET riceve
7️⃣ Entity Framework salva su SQL Server
8️⃣ Risposta 200 OK
9️⃣ Flutter riceve true
