import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  LoadingOverlay({Key key, @required this.isLoading, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Builder(
          builder: (context) {
            if (isLoading) {
              return Container(
                color: Colors.black.withOpacity(0.8),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
