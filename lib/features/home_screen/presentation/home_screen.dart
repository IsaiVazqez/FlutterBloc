import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/common/auth/auth.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:loginbloc/features/home_screen/bloc/fetch_bloc.dart';
import 'package:loginbloc/features/home_screen/presentation/details_screen.dart';
import 'package:loginbloc/features/home_screen/presentation/widgets/card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextStyle dropdownMenuItem =
      const TextStyle(color: Colors.black, fontSize: 18);

  bool selectedButton1 = true;

  bool selectedButton2 = false;

  final FetchBloc _bloc = FetchBloc(GetData());

  @override
  void initState() {
    super.initState();
    _bloc.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    final user = Auth();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .009,
          ),
          appBar(context, user),
          searchBar(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .09,
              ),
              AnimatedButton(
                isSelected: selectedButton1,
                onPress: () {
                  setState(() {
                    selectedButton1 = true;
                    selectedButton2 = false;
                  });
                },
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .42,
                text: 'SUBMIT',
                isReverse: selectedButton2,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 2,
              ),
              AnimatedButton(
                isSelected: selectedButton2,
                onPress: () {
                  setState(() {
                    selectedButton2 = true;
                    selectedButton1 = false;
                  });
                },
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .42,
                text: 'SUBMIT',
                isReverse: selectedButton1,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .009,
              ),
            ],
          ),
          BlocBuilder<FetchBloc, FetchState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is FetchSuccess) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: state.user.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  e: state.user[index],
                                ),
                              ),
                            );
                          },
                          child: Card1(
                              firstName: '${state.user[index].firstName} ',
                              lastName: '${state.user[index].lastName}',
                              imageUrl: '${state.user[index].avatar}'),
                        );
                      }),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ]),
      ),
    );
  }

  Row searchBar(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height * .08,
            padding:
                const EdgeInsets.only(left: 20, right: 18, top: 5, bottom: 5),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Search',
              ),
              readOnly: true,
              onTap: () {
                //Go to the next screen
              },
            ),
          ),
        ),
      ],
    );
  }

  Row appBar(BuildContext context, Auth user) {
    return Row(children: [
      SizedBox(
        width: MediaQuery.of(context).size.height * .026,
      ),
      const Text(
        'Bienvenido', //user.currentUser!.email!,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      IconButton(
        icon: const Icon(
          CupertinoIcons.bell,
          size: 30,
        ),
        onPressed: () {},
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 10),
        child: InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 17,
            backgroundImage: user.currentUser!.photoURL != null
                ? NetworkImage(user.currentUser!.photoURL!)
                : null,
            child: user.currentUser!.photoURL == null
                ? const Icon(Icons.person)
                : null,
          ),
        ),
      )
    ]);
  }
}
