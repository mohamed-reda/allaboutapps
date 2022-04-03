import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_localizations.dart';
import '../bloc/list_bloc.dart';
import '../common/common.dart';
import '../widgets/build_card.dart';
import '../widgets/build_loading.dart';

class ClubsListPage extends StatefulWidget {
  const ClubsListPage({Key? key}) : super(key: key);

  @override
  State<ClubsListPage> createState() => _ClubsListPageState();
}

class _ClubsListPageState extends State<ClubsListPage> {
  final ClubsListCubit _moviesListCubit = ClubsListCubit();

  @override
  void initState() {
    _moviesListCubit.getDataEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)?.translate('first_string') ?? ' '),
        backgroundColor: Common.greenColor,
      ),

      /// Here You should convert the response (responseHelper.data) to your model and use that model at the UI
      body: BlocProvider<ClubsListCubit>(
        create: (BuildContext context) => _moviesListCubit,
        child: BlocBuilder<ClubsListCubit, ClubState>(
          builder: (context, state) {
            if (state is WeHaveDataState) {
              if (_moviesListCubit.responseHelper.hasError) {
                return SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                              _moviesListCubit.responseHelper.errorMessage),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              _moviesListCubit.getDataEvent();
                            },
                            child: const Text('Get the Data Again'),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return BuildCard(
                // context: context,
                model: _moviesListCubit.responseHelper.data,
                // controller: _controller,
              );
            } else {
              return const BuildLoading();
            }
          },
        ),
      ),
    );
  }
}
