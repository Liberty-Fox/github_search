import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_search/data/model/github_model.dart';

class GithubCard extends StatelessWidget {
  GithubCard(this.github);

  final Github github;

  @override
  Widget build(BuildContext context) {
    final _boxDecoration = BoxDecoration(
      border: Border.all(
        color: Color(0xFFDFDFDF),
      ),
      borderRadius: BorderRadius.circular(10.0),
    );

    final _stars = Container(
      padding: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Color(0xFFA6A6A6),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.star,
            color: Color(0xFFFFFFFF),
            size: 16.0,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(
            github.stargazersCount.toString(),
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );

    final _body = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                github.fullName,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(github.avatarUrl),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    github.login,
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _stars,
      ],
    );

    final _updateDate = DateTime.parse(github.updatedAt);

    final _footer = Row(
      children: [
        Text(
          'Обновленно: ',
          style: TextStyle(
            color: Color(0xFFA6A6A6),
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          '${_updateDate.day} ${_updateDate.month} ${_updateDate.year}',
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: _boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _body,
          Divider(
            height: 16.0,
            thickness: 1.0,
          ),
          _footer,
        ],
      ),
    );
  }
}
