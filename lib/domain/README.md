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