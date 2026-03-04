Modelli dati (DTO) utilizzati per la serializzazione/deserializzazione tra API e app.
models = come viene salvato/trasmesso (JSON serializaion, API Parsing, FireBase conversion, DB mapping)
entity = cosa significa il business (non importa JSON, non importa Firebase, non importa Map)

- DATASOURCES/
Racchiude le sorgenti dati:
    remote/ – servizi remoti (API REST, Firebase, GraphQL…)
    local/ – database locali, SharedPreferences, storage, cache

- REPOSITORIES/
  Implementazioni concrete delle interfacce presenti nel layer domain.