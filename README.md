# binhhoit.github.io

Personal profile site built with Flutter web — static, no backend.
Live: https://binhhoit.github.io

## Structure

- `ui_kit/` — shared design pieces: colors (`UIColor`), type scale (`AppTextStyle`), responsive frame, widgets (`AppCard`, `AppSection`, `AppChip`, `AppButton`, `AppTimelineItem`, `AppAvatar`…).
- `presentation/` — the app. All profile content lives in `presentation/lib/screen/profile/profile_data.dart`.

## Develop

```bash
flutter pub get
cd presentation
flutter run -d chrome
flutter test
```

## Deploy

Pushing to `main` runs `.github/workflows/deploy.yml`: analyze, test, `flutter build web`, publish to GitHub Pages.
