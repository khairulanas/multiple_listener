import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_listener/presentation/bloc/email/email_bloc.dart';
import 'package:multiple_listener/presentation/page/last_page.dart';

import '../bloc/phone/phone_bloc.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController tEmail;
  late TextEditingController tPhone;
  bool isEmail = false;

  @override
  void initState() {
    super.initState();
    tEmail = TextEditingController(text: 'konohamaru@konoha.com');
    tPhone = TextEditingController(text: '98376298375098235');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          //email bloc listener
          BlocListener<EmailBloc, EmailState>(listener: (_, state) {
            if (state is EmailError) {
              //showing error
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              //if error because already used, back to first page
              if (state.message.contains('already used')) {
                Navigator.of(context).pop();
              }
            } else if (state is EmailLoaded) {
              //if success, navigate to last page
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      LastPage(isEmailData: isEmail, userData: state.user)));
            }
          }),
          //phone bloc listener
          BlocListener<PhoneBloc, PhoneState>(listener: (_, state) {
            if (state is PhoneError) {
              //showing error
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              //if error because already used, back to first page
              if (state.message.contains('already used')) {
                Navigator.of(context).pop();
              }
            } else if (state is PhoneLoaded) {
              //if success, navigate to last page
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      LastPage(isEmailData: isEmail, userData: state.user)));
            }
          }),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Check email or phone'),
          ),
          body: Column(
            children: [
              Row(children: [
                const Text('using email or phone?'),
                Switch(
                    value: isEmail,
                    onChanged: (bool newValue) {
                      setState(() {
                        isEmail = newValue;
                      });
                    }),
                Text(isEmail ? 'email' : 'phone')
              ]),
              const SizedBox(
                height: 50,
              ),
              Text('input your ' + (isEmail ? 'email' : 'phone')),
              TextField(
                controller: isEmail ? tEmail : tPhone,
              ),
              //builder
              BlocBuilder<EmailBloc, EmailState>(
                builder: (_, emailState) {
                  return BlocBuilder<PhoneBloc, PhoneState>(
                      builder: (_, phoneState) {
                    return MaterialButton(
                        //loading
                        child: (emailState is EmailLoading ||
                                phoneState is PhoneLoading)
                            ? const CircularProgressIndicator()
                            : const Text('check'),
                        onPressed: () {
                          if (isEmail) {
                            context
                                .read<EmailBloc>()
                                .add(CheckEmailEvent(tEmail.text));
                          } else {
                            context
                                .read<PhoneBloc>()
                                .add(CheckPhoneEvent(tPhone.text));
                          }
                        });
                  });
                },
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    tEmail.dispose();
    tPhone.dispose();
    super.dispose();
  }
}
