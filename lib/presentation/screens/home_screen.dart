import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/data/model/github_model.dart';
import 'package:github_search/logic/cubit/home_cubit.dart';
import 'package:github_search/presentation/widgets/github_card_widget.dart';
import 'package:github_search/presentation/widgets/search_button_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _navigationBarTextStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.05,
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        middle: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeResult) {
              return Text(
                'результат поиска',
                style: _navigationBarTextStyle,
              );
            }
            return Text(
              'поиск',
              style: _navigationBarTextStyle,
            );
          },
        ),
      ),
      child: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          cubit: BlocProvider.of<HomeCubit>(context),
          builder: (context, state) {
            if (state is HomeLoading) {
              return HomeScreenLoading();
            } else if (state is HomeResult) {
              return HomeScreenResult(state.result);
            }
            return HomeScreenSearch();
          },
        ),
      ),
    );
  }
}

class HomeScreenSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, -0.6),
      child: SearchButton(),
    );
  }
}

class HomeScreenLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, -0.6),
      child: CupertinoActivityIndicator(),
    );
  }
}

class HomeScreenResult extends StatelessWidget {
  HomeScreenResult(this.result);
  final List<Github> result;

  @override
  Widget build(BuildContext context) {
    final _headerTextStyle = TextStyle(
      color: Color(0xFFA6A6A6),
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.05,
    );

    final _headerActiveTextStyle = TextStyle(
      color: Color(0xFF58AFFF),
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.05,
    );

    final _header = SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 19.0,
          bottom: 16.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'по запросу: ',
                  style: _headerTextStyle,
                ),
                GestureDetector(
                  onTap: () => BlocProvider.of<HomeCubit>(context).pop(),
                  child: Text(
                    '"${BlocProvider.of<HomeCubit>(context).searchController.text}"',
                    style: _headerActiveTextStyle,
                  ),
                ),
              ],
            ),
            Text(
              'найдено: ${result.length}',
              style: _headerTextStyle,
            ),
          ],
        ),
      ),
    );

    final _list = SliverList(
      delegate: SliverChildListDelegate(
        List.generate(
          result.length,
          (i) => GithubCard(result[i]),
        ),
      ),
    );

    return CustomScrollView(
      slivers: [
        _header,
        _list,
      ],
    );
  }
}
