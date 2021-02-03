import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_search/data/model/github_model.dart';
import 'package:github_search/data/repository/github_repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    @required this.githubRepository,
  }) : super(HomeSearch());

  final GithubRepository githubRepository;
  TextEditingController searchController = TextEditingController();

  void search() async {
    emit(HomeLoading());

    if (searchController.text.isEmpty) {
      return pop();
    }

    final query = searchController.text;
    githubRepository.getGithubRepos(query).then((r) {
      emit(HomeResult(
        query: query,
        result: r,
      ));
    });
  }

  void pop() {
    emit(HomeSearch());
  }
}
