import 'package:dojo/homepage-stateless/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class MyHomePageStateless extends StatelessWidget {
  const MyHomePageStateless({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _state(),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(child: Text("Empty"), onPressed: () => _sendEvent(context, ButtonEnum.empty)),
                ElevatedButton(child: Text("Error"), onPressed: () => _sendEvent(context, ButtonEnum.error)),
                ElevatedButton(child: Text("Loading"), onPressed: () => _sendEvent(context, ButtonEnum.loading)),
                ElevatedButton(child: Text("Success"), onPressed: () => _sendEvent(context, ButtonEnum.success)),
              ],
            )
          ],
        ),
      ),
    );
  }

  _sendEvent(BuildContext context, ButtonEnum buttonEnum) {
    BlocProvider.of<HomepageBloc>(context)..add(HomepageClickEvent(buttonEnum));
  }

  _state() {
    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        if (state is HomepageEmptyState) return _empty();

        if (state is HomepageErrorState) return _error();

        if (state is HomepageLoadingState) return _loading();

        if (state is HomepageSuccessState) return _success();

        return Text("Unknow State");
      },
    );
  }

  _empty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Lottie.asset('assets/lotties/empty.json', width: 300)],
    );
  }

  _error() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Lottie.asset('assets/lotties/error.json', width: 300)],
    );
  }

  _loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Lottie.asset('assets/lotties/loading.json', width: 300)],
    );
  }

  _success() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Lottie.asset('assets/lotties/success.json', width: 300)],
    );
  }
}
