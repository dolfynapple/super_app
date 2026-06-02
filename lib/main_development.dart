import 'package:portfolio_super_app/app/app.dart';
import 'package:portfolio_super_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
