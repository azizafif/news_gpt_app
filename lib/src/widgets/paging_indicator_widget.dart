import '../shared/screens/exports.dart';

class PagingIndicatorWidget extends StatelessWidget {
  const PagingIndicatorWidget({super.key, required this.visible});

  final bool visible;
  @override
  Widget build(BuildContext context) => Center(
        child: Visibility(
          visible: visible,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
