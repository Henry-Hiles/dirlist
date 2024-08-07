import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

/// Generates a single-line comment for each class
class DirlistGenerator extends GeneratorForAnnotation<Dirlist> {
  const DirlistGenerator();

  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final library = LibraryReader(await buildStep.inputLibrary);
    final extendedClass = annotation.read("extendedClass").typeValue;

    return "final ${element.displayName}=[${library.classes.where((classElement) => classElement.thisType.extensionTypeErasure == extendedClass).join(",")}];";
  }

  static Builder builder(BuilderOptions options) =>
      SharedPartBuilder([DirlistGenerator()], "dirlist");
}

class Dirlist {
  final Type extendedClass;
  const Dirlist(this.extendedClass);
}
