import 'package:restaurant_management/generators/route_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

const String ROUTE_EXTENSION = '.route';

Builder routeFactory(BuilderOptions options) {
  return LibraryBuilder(
    RouteGenerator(),
    generatedExtension: ROUTE_EXTENSION,
    formatOutput: (code, languageVersion) => code,
  );  
}

Builder routeAssemblerFactory(BuilderOptions options) {
  return RouteAssembleBuilder();
}