import '../app/design/index.dart';
import '../shared/controllers/exports.dart';

class ScrollableColumn extends StatelessWidget {
  const ScrollableColumn({
    super.key,
    this.formKey,
    this.margin,
    this.padding,
    required this.children,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        padding: padding ??
            const EdgeInsets.only(
                top: AppValues.bodyMinSymetricVerticalPadding, left: AppValues.bodyMinSymetricHorizontalPadding),
        child: Form(
            key: formKey,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children)),
      ),
    );
  }
}
