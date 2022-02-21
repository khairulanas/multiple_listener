import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiple_listener/domain/entity/user_entity.dart';
import 'package:multiple_listener/domain/usecases/check_email_usecase.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final CheckEmailUsecase checkEmailUsecase;
  EmailBloc(this.checkEmailUsecase) : super(EmailInitial()) {
    on<CheckEmailEvent>((event, emit) async {
      emit(EmailLoading());
      final failurOrUser = await checkEmailUsecase.execute(event.email);
      failurOrUser.fold(
        (l) => emit(EmailError(l.message)),
        (r) => emit(EmailLoaded(r)),
      );
    });
  }
}
