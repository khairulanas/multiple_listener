import 'package:flutter/material.dart';

import 'package:multiple_listener/domain/entity/user_entity.dart';

class LastPage extends StatelessWidget {
  final bool isEmailData;
  final UserEntity userData;
  const LastPage({
    Key? key,
    required this.isEmailData,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Success with ' + (isEmailData ? 'email' : 'phone'),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text(userData.name),
              Text(isEmailData ? userData.email : userData.phone),
            ],
          ),
        ));
  }
}
