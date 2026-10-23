# binhhoit.github.io — personal profile (Flutter web)

Static profile site, no server/backend. Cloned and trimmed from the CRM Horeca project (`../crm-horeca`): only `ui_kit` + `presentation` remain; no data layer, DI, router, bloc, Supabase or Cloudinary.

- `ui_kit/` — `UIColor`, `AppTextStyle` (Inter bundled, `package: 'ui_kit'`), `ResponsiveCenter`/`isWide` (>= 900 → two columns), widgets `App*`.
- `presentation/lib/screen/profile/profile_data.dart` — the single source of profile content. Other files only render it.

## Rules
- Reply to the user in Vietnamese. **Code comments in English.**
- Colors only from `UIColor`, text only from `AppTextStyle`; no hex in `presentation`.
- Never commit secrets (API keys, tokens, `.env`, keystores). Run a secret scan before pushing.
- Before reporting done: `flutter analyze` (root) + `cd presentation && flutter test`; for UI changes also `flutter build web --release` and check screenshots at phone and desktop widths.
- Push: `GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa4 -o IdentitiesOnly=yes" git push origin main` (account `binhhoit`). GitHub Actions deploys to https://binhhoit.github.io.
