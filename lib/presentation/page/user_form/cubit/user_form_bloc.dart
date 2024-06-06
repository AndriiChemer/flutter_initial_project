import 'dart:async';

import 'package:iteo_libraries_example/core/extension/string_extensions.dart';
import 'package:iteo_libraries_example/domain/user/user_repository.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';

part 'user_form_action.dart';
part 'user_form_state.dart';

class UserFormBloc extends SafeActionCubit<UserFormState, UserFormAction> {
  UserFormBloc(this.userRepository) : super(UserFormLoading()) {
    _revalidationStreamController = StreamController.broadcast();
  }

  final UserRepository userRepository;

  NameValidationResult? _nameValidationResult;
  late final String? _nameInitValue;

  NameValidationResult? _surnameValidationResult;
  late final String? _surnameInitValue;

  EmailValidationResult? _emailValidationResult;
  late final String? _emailInitValue;

  late final StreamController _revalidationStreamController;
  bool _requestedRevalidation = false;

  Stream get revalidationRequestStream => _revalidationStreamController.stream;

  Future<void> init() async {
    final user = await userRepository.getUser();
    _nameInitValue = user?.name.nullOrValue;
    _surnameInitValue = user?.surname.nullOrValue;
    _emailInitValue = user?.email.nullOrValue;

    _emitValidatedState();
  }

  void updateName(NameValidationResult nameValidationResult) {
    _nameValidationResult = nameValidationResult;
    _emitValidatedState();
  }

  void updateSurname(NameValidationResult surnameValidationResult) {
    _surnameValidationResult = surnameValidationResult;
    _emitValidatedState();
  }

  void updateEmail(EmailValidationResult emailValidationResult) {
    _emailValidationResult = emailValidationResult;
    _emitValidatedState();
  }

  Future<void> onSubmitTap() async {
    try {
      final anyFieldChanged = _nameInitValue.nullOrValue !=
              _nameValidationResult?.name.nullOrValue ||
          _surnameInitValue.nullOrValue !=
              _surnameValidationResult?.name.nullOrValue ||
          _emailInitValue.nullOrValue !=
              _emailValidationResult?.email.nullOrValue;

      if (anyFieldChanged) {
        _requestRevalidation();
      } else {
        _emitValidatedState();
        await userRepository.saveUser(
          name: _nameInitValue ?? '',
          surname: _surnameInitValue ?? '',
          email: _emailInitValue ?? '',
        );
        dispatch(UserFormSaved());
      }
    } catch (e, _) {
      _emitValidatedState();
      dispatch(UserFormActionError());
    }
  }

  void _emitValidatedState() {
    final newState = UserFormValidated(
      nameValidationResult: _nameValidationResult,
      name: _nameInitValue,
      surnameValidationResult: _surnameValidationResult,
      surname: _surnameInitValue,
      emailValidationResult: _emailValidationResult,
      email: _emailInitValue,
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
      _surnameValidationResult,
      _emailValidationResult,
    ].every((fieldData) => fieldData != null);

    if (!revalidationFinished) return;

    dispatch(UserFormScrollToFirstFieldWithError());
    _requestedRevalidation = false;
  }

  void _submit() {
    if (state is UserFormValidated) {
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
        validatedState.surnameValidationResult,
        validatedState.emailValidationResult,
      ].any((result) => result == null);

      if (hasInvalidResults) return;
      // await _saveYourData(validatedState);
      dispatch(UserFormSaved());
    } catch (e, _) {
      _emitValidatedState();
      dispatch(UserFormActionError());
      // Log.e('$runtimeType - _save error', LogTag.cubit, e, s);
    }
  }

  void _requestRevalidation() {
    _nameValidationResult = null;
    _surnameValidationResult = null;
    _emailValidationResult = null;
    _requestedRevalidation = true;
    _revalidationStreamController.add(null);
  }
}
