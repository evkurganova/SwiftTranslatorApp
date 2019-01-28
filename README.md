SwiftTranslatorApp — iOS
============

Приложение TranslatorApp для iOS, переписанное на Swift c использованием Realm вместо Core Data для хранения данных. Для перевода используется сервис Яндекса https://translate.yandex.ru/

### Запуск проекта

```
$ open SwiftTranslatorApp.xcworkspace # <-- НЕ SwiftTranslatorApp.xcodeproj
```

Поды удалены из репозитория, поэтому проект не собирается без загрузки подов. Для загрузки подов и добавления новых подов в проект нужно выполнить:

```
$ pod install
```

Чтобы обновить поды нужно сделать:

```
$ pod update
```

Если не установлен cocoapods:
```
sudo gem install cocoapods
```
https://guides.cocoapods.org/using/getting-started.html
