import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

class DirlistGenerator extends GeneratorForAnnotation<Dirlist> {
  const DirlistGenerator();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    // final library = LibraryReader();
    final extendedClass = annotation.read("extendedClass").typeValue;
    print((await buildStep.inputLibrary)
        .topLevelElements
        .map((e) => e.children.map((e) => e.children.map((e) => e.name))));
    final classes = []; // library.classes.where((classElement) {
    //   print("supertype: ${classElement.supertype}");
    //   print("class: $classElement");

    //   return TypeChecker.fromStatic(
    //     classElement.supertype!.extensionTypeErasure,
    //   ).isAssignableFromType(extendedClass);
    // });

    return "final ${element.displayName}=[${classes.join(",")}];";
  }

  static Builder builder(BuilderOptions options) =>
      SharedPartBuilder([DirlistGenerator()], "dirlist");
}

class Dirlist {
  final Type extendedClass;
  const Dirlist(this.extendedClass);
}
