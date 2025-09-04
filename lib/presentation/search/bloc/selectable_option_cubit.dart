import 'package:flutter_bloc/flutter_bloc.dart';

enum SelectType { movie, tv }

class SelectableOptionCubit extends Cubit<SelectType> {
  SelectableOptionCubit() : super(SelectType.movie);

  void selectMovie() => emit(SelectType.movie);
  void selectTv() => emit(SelectType.tv);
}
