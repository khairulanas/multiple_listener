import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiple_listener/domain/entity/user_entity.dart';
import 'package:multiple_listener/domain/usecases/check_phone_usecase.dart';

part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  final CheckPhoneUsecase checkPhoneUsecase;
  PhoneBloc(this.checkPhoneUsecase) : super(PhoneInitial()) {
    on<CheckPhoneEvent>((event, emit) async {
      emit(PhoneLoading());
      final failurOrUser = await checkPhoneUsecase.execute(event.email);
      failurOrUser.fold(
        (l) => emit(PhoneError(l.message)),
        (r) => emit(PhoneLoaded(r)),
      );
    });
  }
}
