import 'package:flutter_clean_architecture/core/const/string_constants.dart';

const int EXAMPLE_ONE_INT = 1;
const int EXAMPLE_TWO_INT = 2;
const String EXAMPLE_ONE_STRING = LABEL_EXAMPLE_ONE;
const String EXAMPLE_TWO_STRING = LABEL_EXAMPLE_TWO;

enum ExampleEnum {
  EXAMPLE_ONE,
  EXAMPLE_TWO,
}

extension enumExtensionsInt on ExampleEnum {
  int? getExampleIntValue() {
    switch (this) {
      case ExampleEnum.EXAMPLE_ONE:
        return EXAMPLE_ONE_INT;
      case ExampleEnum.EXAMPLE_TWO:
        return EXAMPLE_TWO_INT;
      default:
        return null;
    }
  }
}

extension enumExtensionsEnum on int {
  ExampleEnum? getExampleEnumValue() {
    switch (this) {
      case EXAMPLE_ONE_INT:
        return ExampleEnum.EXAMPLE_ONE;
      case EXAMPLE_TWO_INT:
        return ExampleEnum.EXAMPLE_TWO;
      default:
        return null;
    }
  }
}

extension enumExtensionsString on ExampleEnum {
  String getExampleStringValue() {
    switch (this) {
      case ExampleEnum.EXAMPLE_ONE:
        return EXAMPLE_ONE_STRING;
      case ExampleEnum.EXAMPLE_TWO:
        return EXAMPLE_TWO_STRING;
      default:
        return "";
    }
  }
}

extension enumExtensionsStringToEnum on String {
  ExampleEnum? getExampleEnumValueFromString() {
    switch (this) {
      case EXAMPLE_ONE_STRING:
        return ExampleEnum.EXAMPLE_ONE;
      case EXAMPLE_TWO_STRING:
        return ExampleEnum.EXAMPLE_TWO;
      default:
        return null;
    }
  }
}
