# project_dog_zizzi

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### ARCHITETTURA E COMPONENTI DELLA CATENA

VIEW - VIEWMODEL - USECASE - REPOSITORY - DATASOURCE - DATABASE.

1. VIEW:
   - Mosta i campi, validazioni UI e feedback (snack, errori).
   - Gestisce soltanto le presentazione e lo stato UI transitorio (ES. TextEditingController, obscureText, ...).
   - Raccoglie i dati dall'utente (attraverso i controller) e chiama il ViewModel.
   - Regola pratica: setState() va benissimo per lo stato UI locale (checkbox,  obscure toggle). Usare riverpod per stato condiviso o business.

2. VIEWMODEL:
   - Espone i metodi che la view chiama (ES. register(...)).
   - Tiene lo stato della schermata (loading, error, success) tramite provider.
   - Non contiene logica di accesso al DB o HTTP: delega agli usecase/repository.
   - Mantiene la view "pulita" (testabilità), coordina i flussi asincroni e trasforma i risultati in stati UI.

3. USECASE
    - Contiene la logia di cosa fare in termini di dominio (es. Registeruser).
    - Orchestra il repository ma non sa nulla di HTTP o DB.
    - E' testabile isolamente

4. REPOSITORY (interfaccia nel domain + implementazione nel data)
   - Interfaccia (abstract) definisce le operazioni che il dominio richiede (ES. Future<bool> register(UserEntity user);).
   - Implementazione (in data/repositories) usare i datasource per eseguire realmente le operazioni
   - Si usa abstract perchè esso è un contratto: il domain usa solo l'interfaccia, non l'implementazione concreta.
   - Permette di sostituire facilmente implementazioni (mock per test, remote/local diversi).

5. DATASOURCE (data layer) - Remote / Local
    - RemoteDataSource: si occupa delle chiamata HTTP al backend (serialize/deserialize JSON).
    - LocalDataSource: si occupa di storage locale (SQLite, Hive, SharedPreferences, SecureStorage)
    - Se la chiamata va al server --> data/datasourcers/remote
    - Se salva localmente (token, cache) --> data/datasources/local.

6. DATABASE / BACKEND
    - È il punto finale dove i dati vengono persistiti: in questo caso il tuo SQL Server raggiungibile tramite backend (.NET/Node).
    - La app Flutter non parla direttamente a SQL Server; comunica con un backend API che a sua volta fa le query nel DB.

FLUSSO COMPLETO
1. VIEW: utente preme "Registrati" → legge i controller → chiama viewModel.register(user).
2. VIEWMODEL: imposta loading, chiama il RegisterUser usecase.
3. USECASE: applica regole di dominio (es. normalizza dati), chiama AuthRepository.register(user).
4. REPOSITORYIMPL: costruisce payload e chiama AuthRemoteDataSource.register(payload) (o local se necessario).
5. REMOTEDATASOURCE: invia POST al backend .NET/Node (es. POST /api/register).
6. BACKEND: riceve, valida, fa hash della password, scrive su SQL Server.
7. REMOTEDATASOURCE: riceve risposta, la converte in risultato true/false.
8. REPOSITORY -> USECASE -> VIEWMODEL: ricevono il risultato e aggiornano lo stato (success/error).
9. VIEW: osserva lo stato (via Riverpod) e mostra success/error.

