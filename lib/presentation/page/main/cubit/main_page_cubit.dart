import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_cubit.dart';

part 'main_page_cubit.freezed.dart';
part 'main_page_state.dart';

class MainPageCubit extends SafeCubit<MainPageState> {
  MainPageCubit() : super(MainPageState.initial());
}
