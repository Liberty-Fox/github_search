import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/logic/cubit/home_cubit.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _boxDecoration = BoxDecoration(
      border: Border.all(
        color: Color(0xFFDFDFDF),
      ),
      borderRadius: BorderRadius.circular(32.0),
    );

    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: _boxDecoration,
      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              controller: BlocProvider.of<HomeCubit>(context).searchController,
              padding: const EdgeInsets.only(left: 16.0),
              decoration: const BoxDecoration(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CupertinoButton(
              color: Color(0xFF58AFFF),
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
                vertical: 14.0,
              ),
              borderRadius: BorderRadius.circular(32.0),
              child: Text(
                'найти',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.05,
                ),
              ),
              onPressed: () => BlocProvider.of<HomeCubit>(context).search(),
            ),
          )
        ],
      ),
    );
  }
}
