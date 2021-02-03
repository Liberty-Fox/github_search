import 'package:dio/dio.dart';
import 'package:github_search/data/mapper/github_mapper.dart';
import 'package:github_search/data/model/github_model.dart';
import 'package:github_search/data/repository/github_repository.dart';

class DioGithubRepository extends GithubRepository {
  @override
  Future<List<Github>> getGithubRepos(String query) async {
    final githubApiURL = 'https://api.github.com/search/repositories';

    final dio = Dio();
    final response = await dio.get(
      githubApiURL,
      queryParameters: {'q': query.split(' ').join('+')},
    );

    final List<dynamic> data = response.data['items'];
    return data.map((data) => GithubMapper.fromData(data)).toList();
  }
}
