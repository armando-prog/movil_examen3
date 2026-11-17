# FitTrack Pro

Aplicacion Flutter para registrar el peso corporal.

## Funcionalidad

- Agrega registros con fecha y peso en kilogramos.
- Valida que la fecha no este vacia y que el peso sea un numero mayor a cero.
- Mantiene los registros temporalmente en memoria mientras la pantalla esta abierta.
- No utiliza base de datos.

## Ejecutar

Desde la carpeta del proyecto:

```sh
flutter pub get
flutter run
```

Para ejecutar en el navegador:

```sh
flutter run -d web-server
```

## Pruebas

```sh
flutter test
flutter analyze
```
