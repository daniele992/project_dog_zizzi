Modelli dati (DTO) utilizzati per la serializzazione/deserializzazione tra API e app.

- DATASOURCES/
Racchiude le sorgenti dati:
    remote/ – servizi remoti (API REST, Firebase, GraphQL…)
    local/ – database locali, SharedPreferences, storage, cache

- REPOSITORIES/
  Implementazioni concrete delle interfacce presenti nel layer domain.