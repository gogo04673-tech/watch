import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/bloc/generic_data_state.dart';
import 'package:watch/core/usecases/use_case.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T>(UseCase useCase, {dynamic params}) async {
    var data = await useCase.call(params: params);

    data.fold(
      (error) {
        emit(DataFailureLoad(errorMessage: error));
      },
      (data) {
        emit(DataLoaded<T>(data: data));
      },
    );
  }
}
