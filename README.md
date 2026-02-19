# Kreatriv Potok App V2

Новая Flutter-версия приложения с нуля: Material 3 UI, роли (`client/staff/admin`), Supabase Auth и role-based routing.

## Stack
- Flutter + Riverpod + GoRouter
- Supabase (Auth/Postgres/Storage)
- Freezed + json_serializable

## Setup
1. Скопируйте env:
   ```bash
   cp .env.example .env
   ```
2. Заполните `.env` значениями `SUPABASE_URL` и `SUPABASE_ANON_KEY`.
3. Установите зависимости:
   ```bash
   flutter pub get
   ```
4. Сгенерируйте модели:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
5. Запуск web:
   ```bash
   flutter run -d chrome
   ```

## Проверки
```bash
flutter analyze
flutter test
flutter build web
```

## Supabase
- Таблицы в коде: `profiles`, `projects`, `tasks`, `comments`.
- Если в вашей базе не хватает таблиц/полей: примените SQL из `supabase/migrations/20260219135000_roles_and_core_tables.sql`.
