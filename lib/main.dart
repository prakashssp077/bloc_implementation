import 'package:bloc_implementation/CounterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
       body: BlocProvider(
         builder:(BuildContext context) => CounterBloc(),
         child: CounterWidget(),
       ),
      )
    );
  }
}

class CounterWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterWidgetState();
  }

}

class CounterWidgetState extends State<CounterWidget>{
  var counter =0;
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           BlocBuilder<CounterBloc, int>(
             builder: (BuildContext context, int State){
               return Text("Counter value is :$State", style: TextStyle(fontSize: 30),);
             },
           ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("increment"),
                onPressed: (){
                  _counterBloc.add(CounterEvents.increment);
                },
              ),
              RaisedButton(
                child: Text("decrement"),
                onPressed: (){
                  _counterBloc.add(CounterEvents.decrement);
                },
              )
            ],
          )

        ],
      ),

    );
  }

}