import 'package:github_search/data/model/github_model.dart';

abstract class GithubRepository {
  Future<List<Github>> getGithubRepos(String query);
}
