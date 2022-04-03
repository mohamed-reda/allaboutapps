import 'package:bloc/bloc.dart';

import '../models/model.dart';
import '../models/repository_helper.dart';
import '../repository/club_repository.dart';

class ClubsListCubit extends Cubit<ClubState> {
  bool _isLoadMoreRunning = false;

  ClubsListCubit() : super(InitState());
  ResponseHelper<List<Clubs>> _responseHelper = ResponseHelper(
      hasError: true,
      errorMessage: 'An Error occurred',
      isLoading: false,
      data: []);

  ResponseHelper<List<Clubs>> get responseHelper => _responseHelper;

  Future<void> getDataEvent() async {
    _isLoadMoreRunning = true;
    emit(GettingDataState());

    _responseHelper = await ClubsRepository.getClubsList();

    emit(WeHaveDataState());
    _isLoadMoreRunning = false;
  }
}

class ClubState {}

class InitState extends ClubState {}

class GettingDataState extends ClubState {}

class WeHaveDataState extends ClubState {}
