import 'package:flutter/material.dart';
import 'package:loginbloc/common/models/users_model.dart';

class Detail2Screen extends StatelessWidget {
  const Detail2Screen({Key? key, required this.e}) : super(key: key);
  final Data e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage(e.picture!),
                  ),
                ),
                Text(
                  "${e.firstName!} ${e.lastName!}",
                ),
                Text(e.title!),
              ],
            ),
          ),
        ));
  }
}
