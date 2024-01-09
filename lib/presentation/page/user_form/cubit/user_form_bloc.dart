import 'dart:async';

import 'package:iteo_libraries_example/core/extension/string_extensions.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

part 'user_form_action.dart';
part 'user_form_state.dart';

class UserFormBloc extends SafeActionCubit<UserFormState, UserFormAction> {
  UserFormBloc() : super(UserFormLoading()) {
    _revalidationStreamController = StreamController.broadcast();
  }

  NameValidationResult? _nameValidationResult;
  late final String? _nameInitValue;

  late final StreamController _revalidationStreamController;
  bool _requestedRevalidation = false;

  Stream get revalidationRequestStream => _revalidationStreamController.stream;

  Future<void> init() async {
    try {
      // TODO 1 load data from cache
      // _yourData = await _getYourData();
      // _yourData ??= YourData.fromAddress(await _getDeliveryAddress());

      // _nameInitValue = _yourData?.firstName.nullOrValue;
      _nameInitValue = '';

      // final user = await _getUser();
      // _emailInitValue = user.email.nullOrValue;
      // _showEmail = beforeCheckout && _emailInitValue == null;

      _emitValidatedState();
    } catch (e, s) {
      // Log.e('$runtimeType - init error', LogTag.cubit, e, s);
      emit(UserFormError());
    }
  }

  void updateName(NameValidationResult nameValidationResult) {
    _nameValidationResult = nameValidationResult;
    _emitValidatedState();
  }

  Future<void> onSubmitTap() async {
    try {
      final anyFieldChanged = _nameInitValue.nullOrValue !=
          _nameValidationResult?.name.nullOrValue;

      if (anyFieldChanged) {
        _requestRevalidation();
      } else {
        _emitValidatedState();
        dispatch(UserFormSaved());
      }
    } catch (e, s) {
      // Log.e('$runtimeType - onSubmitTap error', LogTag.cubit, e, s);
      _emitValidatedState();
      dispatch(UserFormActionError());
    }
  }

  void _emitValidatedState() {
    final newState = UserFormValidated(
      nameValidationResult: _nameValidationResult,
      name: _nameInitValue,
    );

    emit(newState);
    if (_requestedRevalidation) {
      if (newState.isValid) {
        _requestedRevalidation = false;
        _submit();
      } else {
        _dispatchScrollToFirstFieldWithErrorIfReady();
      }
    }
  }

  void _dispatchScrollToFirstFieldWithErrorIfReady() {
    final revalidationFinished = [
      _nameValidationResult,
    ].every((fieldData) => fieldData != null);

    if (!revalidationFinished) return;

    dispatch(UserFormScrollToFirstFieldWithError());
    _requestedRevalidation = false;
  }

  void _submit() {
    if(state is UserFormValidated) {
      _save(state as UserFormValidated);
    } else {
      // Log.w('$runtimeType - submit called from wrong state', LogTag.cubit);
    }
  }

  Future<void> _save(UserFormValidated validatedState) async {
    try {
      // _emitValidatedState();
      final hasInvalidResults = [
        validatedState.nameValidationResult,
      ].any((result) => result == null);

      if (hasInvalidResults) return;
      // await _saveYourData(validatedState);
      dispatch(UserFormSaved());
    } catch (e, s) {
      _emitValidatedState();
      dispatch(UserFormActionError());
      // Log.e('$runtimeType - _save error', LogTag.cubit, e, s);
    }
  }

  void _requestRevalidation() {
    _nameValidationResult = null;
    _requestedRevalidation = true;
    _revalidationStreamController.add(null);
  }
}
