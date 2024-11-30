import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyAnimatedButton extends StatelessWidget {
  const MyAnimatedButton({
    super.key,
    required bool animate,
    required String titlePrimary,
    required String titleSecondary,
    required void Function() onTap,
  })  : _animate = animate,
        _titlePrimary = titlePrimary,
        _titleSecondary = titleSecondary,
        _onTap = onTap;

  final bool _animate;
  final String _titlePrimary;
  final String _titleSecondary;
  final void Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).colorScheme.onPrimary,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: _animate
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitCircle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      _titleSecondary,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  ],
                )
              : Text(
                  _titlePrimary,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
