import 'package:flutter/cupertino.dart';
import 'package:github_search/presentation/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return CupertinoApp(
      title: 'github_search',
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
