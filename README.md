This is a boilerplate for Flutter projects. It's included:

#### 1. Internationalization
- Install [flutter_gen](https://pub.dev/packages/flutter_gen)
```bash
dart pub global activate flutter_gen
```
- Languange template file is located at `lib/l10n/app_en.arb`
- [Tutorial](https://www.youtube.com/watch?v=Zw4KoorVxgg)

#### 2. Multiple Environments Support
- Depends on [flutter_flavorizr](https://pub.dev/packages/flutter_flavorizr) & [flutter_dot_env](https://pub.dev/packages/flutter_dotenv)
- Create your environments files in the root projects. eg `.production.env.` ==Refer to .example.env==
```env
app_name=Example App
domain=staging.something.com
base_url=https://$domain
api_v1=/api/v1
```

- Remember to exclude your environment files in .gitignore
- Configure your app environments in `pubspec.yaml`
```yaml
flavorizr:
  flavors:
    staging:
      app:
        name: "Staging App"
      android:
        applicationId: "com.staging.boilerplate"
      ios:
        bundleId: "com.staging.boilerplate"

    production:
      app:
        name: "Production App"
      android:
        applicationId: "com.production.boilerplate"
      ios:
        bundleId: "com.production.boilerplate"
```

- Run this command on terminal to generate environments
```bash
flutter pub run flutter_flavorizr
```

- Delete unused generated files:
	- pages/my_home_page.dart
	- app.dart
- Change code in this files according to your envs:
```dart
// main_production.dart
void main() {
	F.appFlavor = Flavor.PRODUCTION;
	mainCommon();
}

//main_staging.dart
void main() {
	F.appFlavor = Flavor.STAGING;
	mainCommon();
}

// main.dart
// ..
// ..
if (F.appFlavor == Flavor.STAGING) {
	await dotenv.load(
		fileName: '.staging.env',
	);
	} else {
	await dotenv.load(
	fileName: '.production.env',
	);
}
```

- You can access env variables from AppEnv class from `config/app_environments/app_env.dart`

#### 3. Clean architecture
### 4. Dependencies injection
- Depends on [get_it](https://pub.dev/packages/get_it)
- Inject your dependencies in `lib/core/injector.dart`
#### 5. Logging
- Depends on
#### 6. Routing
- Depends on [go_router]()
#### 7. Lints
- Depends on all_lints_rules.yaml
