import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

/// Generates a single-line comment for each class
class DirlistGenerator extends GeneratorForAnnotation<Dirlist> {
  const DirlistGenerator();

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final output = <String>["foo"];

    return output.join('\n');
  }

  static builder(BuilderOptions options) =>
      SharedPartBuilder([DirlistGenerator()], "dirlist");
}

class Dirlist {
  final Object extendedClass;
  Dirlist(this.extendedClass);
}
