import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:github_search/logic/api/dio_github_repository.dart';
import 'package:github_search/logic/cubit/home_cubit.dart';

import 'package:github_search/presentation/screens/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(
              githubRepository: DioGithubRepository(),
            ),
            child: HomeScreen(),
          ),
        );
        break;
      default:
        return CupertinoPageRoute(
          builder: (_) => Container(),
        );
    }
  }
}
