Cartella che Raccoglie tutti gli elementi comuni e riutilizzabili in tutta l’applicazione.

- CONSTANTS: Costanti globali come colori, stringhe, spaziature, valori fissi ecc.
- ERROR: Gestione degli errori come le eccezioni personalizzate, failure, error handlers
- UTILS: Utility generali come formattatori, funzioni helper, validatori
- EXTENSIONS: Estensioni su tipi Dart/Flutter (String, DateTime, BuildContext ecc)
- THEMES: Gestione dei temi come light/dark theme, stile dei testi, palette colore
- WIDGETS: Widget riutilizzabili e generici che possono essere usati ovunque nel progetto

# DIFFERENZE PRINCIPALI IN RIVERPOD:
- REF.READ() => serve per ottenere il valore di un provider UNA SOLA VOLTA. 
non ricostruisce il widget quando il valore cambia e si usa quando si deve eseguire un'azione.
ESEMPIO: onPressed: () {ref.read(addDogViewModelProvider.notifier).addDog(dog);}
si usa quando si vuole: chiamare funzioni, inviare dati, azioni su pulsanti.

- REF.WATCH() => serve per osservare lo stato di un provider. Quando lo stato cambia il widgt si ricostruisce automaticamente
ESEMPIO: final dogs = ref.watch(dogListViewModelProvider); se cambia la lista dei cani la UI si aggiorna automaticamente
si usa quando si vuole: UI reattiva, Loading state, mostrare dati

Widget build(BuildContext context, WidgetRef ref) {
final dogs = ref.watch(dogListViewModelProvider);

return dogs.when(
data: (list) => ListView(...),
loading: () => CircularProgressIndicator(),
error: (e, _) => Text("Errore"),
);
}

- REF.LISTER() => serve per ascolare cambiamenti senza ricostruire il widget
è molto utile per: snackbars, dialog, navigazione
ESEMPIO: 
ref.listen(addDogViewModelProvider, (previous, next) {
  next.whenOrNull(
  data: (_) {
  ScaffoldMessenger.of(context)
  .showSnackBar(SnackBar(content: Text("Dog added")));
  },
  );
  });

