import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_track_nex/bloc/person_bloc.dart';
import 'package:sales_track_nex/bloc/test_array_bloc.dart';
import 'package:sales_track_nex/model/test_model.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc personBloc = BlocProvider.of<PersonBloc>(context);

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: BlocBuilder<PersonBloc, PersonState>(
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          var person = personBloc.state.testModel?.person;
          var personTrait = personBloc.state.testModel?.personTrait;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Name : ${person?.firstName} ${person?.lastName}'),
              Text('Height : ${personTrait?.height}'),
              Text('WEIGTH : ${personTrait?.weight}'),
              RaisedButton(
                child: Text('Firstname Julian'),
                onPressed: () {
                  personBloc.add(SetTestModel(
                      testModel: TestModel(
                          person: Person(
                              firstName: 'Julian',
                              lastName: person?.lastName))));
                },
              ),
              RaisedButton(
                child: Text('Lastname Sakti'),
                onPressed: () {
                  personBloc.add(SetTestModel(
                      testModel: TestModel(
                          person: Person(
                              firstName: person?.firstName, lastName: 'Sakti'),
                          personTrait: PersonTrait(height: '167'))));
                },
              ),
              RaisedButton(
                child: Text('RESET'),
                onPressed: () {
                  personBloc.add(ResetPerson());
                },
              ),
              SizedBox(height: 10),
              Divider(),
              Column(
                children: <Widget>[
                  BlocBuilder<TestArrayBloc, TestArrayState>(
                    builder: (context, state) {
                      if (state is SetListComplete) {
                        print(state.list);
                        return Text('${state.list.length}');
                      }

                      return Text('0');
                    },
                  ),
                  RaisedButton(
                    child: Text('Increment'),
                    onPressed: () {
                      BlocProvider.of<TestArrayBloc>(context).add(SetList(
                          '${BlocProvider.of<TestArrayBloc>(context).state.list.length + 1}'));
                    },
                  ),
                  RaisedButton(
                    child: Text('RESET SYNC INFO'),
                    onPressed: () {
                      personBloc.add(ResetSyncInfo());
                    },
                  ),
                  RaisedButton(
                    child: Text('DATABASE'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/db');
                    },
                  ),
                ],
              ),
//              BlocBuilder<TestArrayBloc, TestArrayState>(
//                buildWhen: (previous, current) => true,
//                builder: (context, state) {
//                  List<String> list;
//
//                  if (state is SetListComplete) {
//                    list = state.list;
//                    return Column(
//                      children: <Widget>[
//                        Text('${state.list.length}'),
//                        RaisedButton(
//                          child: Text('Increment'),
//                          onPressed: () {
//                            list.add((list.length + 1).toString());
//                            BlocProvider.of<TestArrayBloc>(context)
//                                .add(SetList(list));
//                          },
//                        ),
//                      ],
//                    );
//                  } else {
//                    return Column(
//                      children: <Widget>[
//                        RaisedButton(
//                          child: Text('Increment'),
//                          onPressed: () {
//                            list.add((list.length + 1).toString());
//                            BlocProvider.of<TestArrayBloc>(context)
//                                .add(SetList(list));
//                          },
//                        ),
//                      ],
//                    );
//                  }
//                },
//              ),
            ],
          );
        },
      ),
    );
  }
}

//class DebugPage extends StatefulWidget {
//  @override
//  _DebugPageState createState() => _DebugPageState();
//}
//
//class _DebugPageState extends State<DebugPage> {
//  PersonBloc personBloc;
//
//  @override
//  void initState() {
//    personBloc = BlocProvider.of<PersonBloc>(context);
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: double.infinity,
//      width: double.infinity,
//      child: BlocBuilder<PersonBloc, PersonState>(
//        buildWhen: (previous, current) => true,
//        builder: (context, state) {
//          var person = personBloc.state.testModel?.person;
//          var personTrait = personBloc.state.testModel?.personTrait;
//
//          return Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text('Name : ${person?.firstName} ${person?.lastName}'),
//              Text('Height : ${personTrait?.height}'),
//              Text('WEIGTH : ${personTrait?.weight}'),
//              RaisedButton(
//                child: Text('Firstname Julian'),
//                onPressed: () {
//                  personBloc.add(SetTestModel(
//                      testModel: TestModel(
//                          person: Person(
//                              firstName: 'Julian',
//                              lastName: person?.lastName))));
//                },
//              ),
//              RaisedButton(
//                child: Text('Lastname Sakti'),
//                onPressed: () {
//                  personBloc.add(SetTestModel(
//                      testModel: TestModel(
//                          person: Person(
//                              firstName: person?.firstName, lastName: 'Sakti'),
//                          personTrait: PersonTrait(height: '167'))));
//                },
//              ),
//              RaisedButton(
//                child: Text('RESET'),
//                onPressed: () {
//                  personBloc.add(ResetPerson());
//                },
//              ),
//              SizedBox(height: 10),
//              Divider(),
//              Text(
//                  'Outside Builder ${BlocProvider.of<TestArrayBloc>(context).state.list.length}'),
//              BlocBuilder<TestArrayBloc, TestArrayState>(
//                buildWhen: (previous, current) => true,
//                builder: (context, state) {
//                  print(state.list);
//                  List<String> list = state.list;
//
//                  return Column(
//                    children: <Widget>[
//                      Text('${state.list.length}'),
//                      RaisedButton(
//                        child: Text('Increment'),
//                        onPressed: () {
//                          list.add((list.length + 1).toString());
//                          BlocProvider.of<TestArrayBloc>(context)
//                              .add(SetList(list));
//                        },
//                      ),
//                    ],
//                  );
//                },
//              ),
//            ],
//          );
//        },
//      ),
//    );
//  }
//}

//RaisedButton(
//            onPressed: () {
//              BlocProvider.of<SyncBloc>(context).add(Reset());
//            },
//            child: Text("Clear Database"),
//          ),
//          RaisedButton(
//            onPressed: () {
//              Navigator.of(context).pushNamed('/truck');
//            },
//            child: Text("Set Truck"),
//          ),
