# RIASSUNTO GERARCHICO
UI -> VIEWMODEL -> USECASE -> REPOSITORY (INTERFACE) -> REPOSITORYIMPL -> DATASOURCE (API, DB, CACHE)

# DIFFERENZE CONCETTUALI CHIAVE
- VIEWMODEL (non sa cosa fare, non sa come farlo, e non sa dove prendere i dati);
- USECASE (Sa cosa fare, contiene logica di business, ma non sa come farlo e dove prendere i dati)
- REPOSITORY (non sa cosa fare, sa come farlo quindi imposta la strategia, non sa dove prendere i dati)
- DATASOURCE (non sa cosa fare, sa come farlo quindi usa la parte tecnica, sa dove prendere i dati)

METAFORA SEMPLICE:
 - VIEWMODEL --> Cameriere (porta i piatti al cliente)
 - USECASE --> Chef (decide come preparare il piatto)
 - REPOSITORY --> Responsabile di magazzino (decide da dove prendere ingredienti)
 - DATASOURCE --> Fornitore reale (mercato, supermercato, ecc.). esso lavora solo con i model e non con le entities

# CLEAN ARHITECTURE

- PRESENTATION LAYER: Gestisce l'interazione con l'utente ed include: View/Ui, Controller, ViewModel, Presenter
converte i dati del dominio in un formato adatto alla UI. Non contiene business logic.

- APPLICATION
Contiene i casi d'uso dell'applicazione ed include: UseCase, Logica applicativa, coordinamento tra repository.
Esso è il regista delle operazioni e non conosce dettagli tecnici (database, API, Framework)

- DOMAIN LAYER
Contiene il cuore del business ed include: Entities, Value objects, regole di business pure e interfacce dei repository.
E' indipendente da tutt e non dipende da framework o database, è il livello più stbile nel tempo
REGOLA D'ORO: il domain non deve mai importare Flutterse vedi: import 'package: flutter/...' dentro il domain significa che si sta rompendo la clean architecture
mai usare MODEL, tojson, fromJson, mai importare roba da altri layer. Se nel domain si ha un file con: MAP, toJson, jsonDecode, htpp si sta rompendo la clean architecture

- DATA LAYER
Gestisce i dettagli tecnici ed include: Repository implementation, Datasource (local, remote), API client, Database, Mapper DTO <-> Domain
Qui vivono le dipendenze esterne

# REGOLA FONDAMENTALE
PRESENTATION -> USECASE -> DOMAIN <- DATA (Il domain non sa nulla di altri livelli)


# FLUSSO COMPLETO
UI - USERNOTIFIER -> GETUSER (USECASE) -> USERREPOSITORY -> USERREPOSITORYIMPL -> USERREMOTEDATASOURCE -> API