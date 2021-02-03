import 'package:github_search/data/model/github_model.dart';

class GithubMapper {
  static Github fromData(Map<String, dynamic> data) {
    return Github(
      fullName: data['full_name'],
      stargazersCount: data['stargazers_count'],
      avatarUrl: data['owner']['avatar_url'],
      updatedAt: data['updated_at'],
      login: data['owner']['login'],
    );
  }
}
