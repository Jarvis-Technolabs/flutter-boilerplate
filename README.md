# Change log
Release notes:
- Flutter version update to 3.41.9
- Reusable module
  - Login
  - Forgot password with OTP verification
  - Register with OTP verification
  - Logout
  - Delete an account with OTP verification
  - Notification screen with pagination and pull to refresh
- ScreenUtil package update
- Text widget updates
- Mock response print
- Pagination widget with pull to refresh and error handling
- Internet checking improved and added a provision to call API when the internet is connected
# Clean Architecture

Architecture is divided into 3 layers:

A) Data: Takes care of how data will be fetched. 
- Data source
  - Entities/Data models
  - Repositories implementation

B) Domain: Takes care of core business logic and provides data repositories. It is unaware of core implementation of how data is fetched.
- Repositories
  - Usecases

C) Presentation: Takes care of presenting data using blocs.
- Bloc
  - Screen - UI
  - Widgets

```
Clean Architecture - https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/
```

## Flutter Compatibility

|                                                **Boilerplate version**                                                | **Flutter version** | **Dart version** | **Release date** |
|:---------------------------------------------------------------------------------------------------------------------:|:-------------------:|:----------------:|:----------------:|
| [3.22.3+6](https://dev.azure.com/jarvistechnolabs/JT%20Flutter/_git/Clean%20Pattern%20Boilerplate?version=GT3.22.3_6) |       3.22.3        |      3.4.0       |    23-11-2024    |
| [3.16.9+5](https://dev.azure.com/jarvistechnolabs/JT%20Flutter/_git/Clean%20Pattern%20Boilerplate?version=GT3.16.9_5) |       3.16.9        |      3.2.6       |    31-05-2024    |
| [3.16.9+4](https://dev.azure.com/jarvistechnolabs/JT%20Flutter/_git/Clean%20Pattern%20Boilerplate?version=GT3.16.9_4) |       3.16.9        |      3.2.6       |    06-05-2024    |
| [3.16.9+3](https://dev.azure.com/jarvistechnolabs/JT%20Flutter/_git/Clean%20Pattern%20Boilerplate?version=GT3.16.9_3) |       3.16.9        |      3.2.6       |    06-05-2024    |
| [3.16.9+2](https://dev.azure.com/jarvistechnolabs/JT%20Flutter/_git/Clean%20Pattern%20Boilerplate?version=GT3.16.9_2) |       3.16.9        |      3.2.6       |    30-04-2024    |
| [3.16.9+1](https://dev.azure.com/jarvistechnolabs/JT%20Flutter/_git/Clean%20Pattern%20Boilerplate?version=GT3.16.9_1) |       3.16.9        |      3.2.6       |    04-04-2024    |

**State management**
```
Bloc - https://bloclibrary.dev/#/gettingstarted
```

#### Generate files

```
flutter pub run build_runner build --delete-conflicting-outputs
```

#### Generate builds

**Build Android Staging Release**

```
flutter build apk --release --flavor staging -t lib/core/flavour/main_staging.dart
```

**Build iOS Staging Release**

```
flutter build ios --release --flavor staging -t lib/core/flavour/main_staging.dart
```

**Build Android Production Release**

For Firebase Release
```
flutter build apk --release --flavor prod -t lib/core/flavour/main_prod.dart
```
For Store Release
```
flutter build appbundle --release --flavor prod -t lib/core/flavour/main_prod.dart
```

**Build iOS Production Release**

```
flutter build ios --release --flavor prod -t ib/core/flavour/main_prod.dart
```

# Boilerplate API call flow diagram

## Login
![Login.svg](./assets/api_call_flow_diagram/login.svg)

```flowchart TD
    J[User] --> A(Login)
    A --> B{Check public token is available}
    B -->|No| C[Call Public Token API]
    B -->|Yes| D[Call Login API]
    C --> E{Is public token genrated?}
    E --> |No| F(Show Error)
    E --> |Yes| D
    D --> G{Is login Allowed?}
    G --> |No| H(Show Error)
    G --> |Yes| I(Go to Dashboard)
```

## Register
![Register.svg](./assets/api_call_flow_diagram/register.svg)

```flowchart TD
    A[User] --> B(Register user)
    B --> C{Is user valid?}
    C --> |No| D(Show Error)
    C --> |Yes| E(Send OTP)
    E --> F{Is OTP recivied}
    F --> |No| G{Check if time has passed and resend is allowed or not}
    G --> |Yes| I(Resend OTP)
    I --> F 
    F --> |Yes| H(Take input from User)
    H --> J(Call Verify OTP)
    J --> K{Is OTP valid?}
    K --> |YES| L(Go to dashboard)
    K --> |No| M(Show Error)
```

## Forgot Password
![Forgot Password.svg](./assets/api_call_flow_diagram/forgot_password.svg)

```flowchart TD
    A[User] --> B(Forgot Password)
    B --> C{Is user valid?}
    C --> |No| D(Show Error)
    C --> |Yes| E(Send OTP)
    E --> F{Is OTP recivied}
    F --> |No| G{Check if time has passed and resend is allowed or not}
    G --> |Yes| I(Resend OTP)
    I --> F 
    F --> |Yes| H(Take input from User)
    H --> J(Call Verify OTP)
    J --> K{Is OTP valid?}
    K --> |YES| L(Call reset password API)
    K --> |No| M(Show Error)
    L --> |No| N(Show Error)
    L --> |Yes| O(Go to login screen)
```

## Delete Account
![Delete Account.svg](./assets/api_call_flow_diagram/delete_account.svg)

```flowchart TD
    A[User] --> E(Send OTP)
    E --> F{Is OTP recivied}
    F --> |No| G{Check if time has passed and resend is allowed or not}
    G --> |Yes| I(Resend OTP)
    I --> F 
    F --> |Yes| H(Take input from User)
    H --> J(Call Verify OTP)
    J --> K{Is OTP valid?}
    K --> |YES| L(Go to Login screen)
    K --> |No| M(Show Error)
```

# Auto Project setup guide

## Mac users

To setup the project using boilerplate follow the below steps:

Step 1: Download the project [Auto project setup](https://dev.azure.com/jarvistechnolabs/JT%20Flutter/_git/auto_project_setup)

Step 2: Open the config.properties file and change the values for the appropriate keys.

Step 2: To run all the scripts:

Open the terminal.
Navigate to the directory containing your scripts.
Run the following command:

```
./run.sh
```

If you encounter an error like "zsh: operation not permitted: ./run.sh," then you need to give the permission to the script files. To give a permissions to script file run the following commands:

```
chmod u+x ./run.sh
```

Now, run again the below command

```
./run.sh
```

### To skip the specific script from running

If you don't want to execute specific shell script, then either
You can comment out script lines in the run.sh file by prefixing them with the # sign.

Or

You can comment out lines in the config.properties file by adding a # at the beginning of the line (make sure to comment out all key-value pairs of a particular script that are associated with #number.).

# **Introduction**

A command-line tool that simplifies auto-code generation. Allowing you to generate a
feature, widget, model, and API call code for your Flutter applications.

## **Features**

* Feature code generation (Basic structure with classes)
* Widget code generation
* Model code generation
* GET method API call code generation
* POST method API call code generation
* Multipart API call code generation
* Assets image generation from 3x to 1x and 2x

## **Flutter Compatibility**

| **Package version** | **Dart version** | **Flutter version** | **Boilerplate version** |
|:-------------------:|:----------------:|:-------------------:|:-----------------------:|
|    0.0.2 - 1.3.1    |      3.2.6       |   3.16.0 - 3.22.3   |        3.16.9+1         |


## **Getting Started**

To integrate the package into your Flutter project, follow these steps:

### **Add Dependency**

Add the following dependency to your pubspec.yaml file:

``` dart
    dev_dependencies:
      jt_flutter_cli: ^1.3.1

```

Then run:

``` dart
    flutter pub get

```

## **Rules**

#### Common Rules:
- All the files must contain only one class
- Wherever you use Name or any keyword it must be unique

#### API Rules:
- The feature must be created using the CLI tool
- The developer must not change any file name of the feature
- The API name must be in lowercase with an underscore (Valid Ex: get_profile, profile)

#### Multipart API Rules:
- All file parameters keys in request json must be postfix with _file. eg (xyzAbc_file="")
- File parameters value must be empty string. eg (xyzAbc_file="")
- All list of files parameters keys in request json must be postfix with _fileList. eg (xyzAbc_fileList="")
- List of files parameters value must be empty string. eg (xyzAbc_fileList="")

## **Usage**

####  Create new feature:

``` dart
    flutter pub run jt_flutter_cli create feature {name_of_feature}

```
##### In the above configuration, the package is creating a new feature that is available in the lib/feature/name_of_feature path.
It will generate the name_of_feature folder, which has the dart files and the domain, presentation, and data folders as shown below.

> **** 

    .
    ├── ...
    ├── name_of_feature                    
    │   ├── data          
    │   │   ├── data_source         
    │   │   │   └── name_of_feature_data_source.dart        
    │   │   │   └── name_of_feature_data_source_impl.dart  
    │   │   ├── repository         
    │   │   │   └── name_of_feature_repo_impl.dart        
    │   │   │   └── mock_name_of_feature_repo_impl.dart  
    │   ├── domain          
    │   │   ├── repositories         
    │   │   │   └── name_of_feature_repo.dart   
    │   ├── presentation          
    │   │   ├── bloc         
    │   │   │   └── name_of_feature_bloc.dart        
    │   │   │   └── name_of_feature_data_event.dart  
    │   │   │   └── name_of_feature_data_state.dart  
    │   │   ├── screen         
    │   │   │   └── name_of_feature_screen.dart        
    │   │   └── name_of_feature_page.dart  
    └── ...


####  Create new widget:

``` dart
    flutter pub run jt_flutter_cli create widget {name_of_widget}

```
##### CLI Tool will prompt the user with the following question in terminal:
* Do you want to create a common widget or a feature widget? (common/feature)
  * common: Widget will be created inside the folder lib/core/ui/widgets
  * feature: It will prompt the user to enter the feature name, and the widget will be created inside the respective feature's folder at lib/feature/name_of_feature/presentation/screen/widgets

####  Create new model:

``` dart
    flutter pub run jt_flutter_cli create model {model_name} {feature_name} {json_file_path}

```

####  Add GET API call:

``` dart
    flutter pub run jt_flutter_cli add get-api-call {API_end_point} {API_name}

```

##### CLI Tool will prompt the user with the following questions for GET API call in terminal:

* Enter feature name: <Enter feature name in answer> (If feature name have multiple words please use underscore)

* Does this API have request query parameters? (Y/N): <Enter Y for yes and N for No>
  * Y : It will ask for json file path
  * N : It will skip this question and move to next question

* Enter request json file path: <Enter path of the json file>

* Does this API have response body? (Y/N): <Enter Y for yes and N for No>
  * Y : It will ask for json file path
  * N : It will skip this question and move to next question

* Enter response json file path: <Enter path of the json file>

* Do you want to add shimmer to this API call? (Y/N): <Enter Y for yes and N for No>
  * Y : It will generate the bloc state for showing shimmer UI in screen
  * N : It will generate code to call base bloc event for showing progress indicator UI in dialog with no dismissible dialog

####  Add POST API call:

``` dart
    flutter pub run jt_flutter_cli add post-api-call {API_end_point} {API_name}

```

##### CLI Tool will prompt the user with the following questions for POST API call in terminal:

* Enter feature name: <Enter feature name in answer> (If feature name have multiple words please use underscore)

* Does this API have request body? (Y/N): <Enter Y for yes and N for No>
  * Y : It will ask for json file path
  * N : It will skip this question and move to next question

* Enter request json file path: <Enter path of the json file>

* Does this API have response body? (Y/N): <Enter Y for yes and N for No>
  * Y : It will ask for json file path
  * N : It will skip this question and move to next question

* Enter response json file path: <Enter path of the json file>

* Do you want to add shimmer to this API call? (Y/N): <Enter Y for yes and N for No>
  * Y : It will generate the bloc state for showing shimmer UI in screen
  * N : It will generate code to call base bloc event for showing progress indicator UI in dialog with no dismissible dialog


####  Add MULTIPART API call:

``` dart
    flutter pub run jt_flutter_cli add multipart-api-call {API_end_point} {API_name}

```
##### Request JSON guide for file parameter:
- For file parameters define key with _file postfix in request json. eg (xyzAbc_file="")
- Set the file parameters value to empty string. eg (xyzAbc_file="")
- For list of files parameters define key with _fileList postfix in request json. eg (xyzAbc_fileList="")
- Set the List of files parameters value to empty string. eg (xyzAbc_fileList="")

##### CLI Tool will prompt the user with the following questions for MULTIPART API call in terminal:

* Enter feature name: <Enter feature name in answer> (If feature name have multiple words please use underscore)

* Does this API have request body? (Y/N): <Enter Y for yes and N for No>
  * Y : It will ask for json file path
  * N : It will skip this question and move to next question

* Enter request json file path: <Enter path of the json file>

* Does this API have response body? (Y/N): <Enter Y for yes and N for No>
  * Y : It will ask for json file path
  * N : It will skip this question and move to next question

* Enter response json file path: <Enter path of the json file>

* Do you want to add shimmer to this API call? (Y/N): <Enter Y for yes and N for No>
  * Y : It will generate the bloc state for showing shimmer UI in screen
  * N : It will generate code to call base bloc event for showing progress indicator UI in dialog with no dismissible dialog

####  Assets image generation from 3x to 1x and 2x:

``` dart
    flutter pub run jt_flutter_cli create assets {3x image path} {directory name in assets/images/ (This is where image will be saved)} {image_const_name}

```

## **Follow below instruction to Auto add generated files to git**
- Go to Settings->Version control->Confirmation and Select “Add silently” for “When files are created” and also check the “Apply to files created outside of Android Studio”

## **Existing project upgrade guide to utilize CLI tool in existing project**

##### Below changes are required to utilize the CLI tool in the existing project
- Upgrade the Flutter version to `3.16.9`
- Rename `MasterBloc` to `ApiBaseBloc` and move a file to `core/base/bloc/api_base_bloc/api_base_bloc.dart`
- Rename `MasterApiEvents` to `ApiBaseBlocEvents` and move a file to `core/base/bloc/api_base_bloc/api_base_bloc_event.dart`
- Rename `MasterApiState` to `ApiBaseBlocState` and move a file to `core/base/bloc/api_base_bloc/api_base_bloc_state.dart`
- Move `/core/base/widget/base_bloc_widget.dart` to `/core/base/screen/base_bloc_widget.dart`
- Move `data_source` to `core/api`
- Move `base_api_repo.dart` to `core/api/repository`
- Move `/core/domain/commons/entities/api_response.dart` to `/core/api/model/api_response.dart`
- Move `/core/domain/commons/entities/no_request.dart` to `core/api/model/no_request.dart`
- Move `/core/domain/commons/entities/success.dart` to `core/api/model/success.dart`
- Move `/core/data/error/failure.dart` to `/core/api/model/failure.dart`
- Update `Failure` and `ServerFailure` classes from `failure.dart` file with the latest boilerplate `Failure` and `ServerFailure` classes from `failure.dart` file
- Move `/core/domain/commons/usecases/usecase.dart` to `/core/api/base_usecases/base_usecase.dart`
- Rename `UseCase` to `BaseUseCase`
- Create `/core/const/mock_api_constants.dart` file and move all const variable to this file from `/core/api/data_source/mock/mock_data_impl.dart`
- base_bloc change the name of `baseBlocObject` to `apiBaseBlocObject`
- Add `Failure` to `ErrorApiEvent` as a parameter and update the below lines with
```dart
  apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
  baseBlocObject.failureModel = failure;
  baseBlocObject.add(ErrorApiEvent());
```
- Remove `failureModel` parameter from `ApiBaseBloc` and use data from event
- Replace the `Success` class with the `Success` class from the boilerplate
- Move `/core/util/api_constant.dart` to `/core/const/api_constants.dart` and update the file name api_constants
- Copy `lib/core/api/model/file_upload_request_model.dart` file from boilerplate and Add the same file in your project at the same path
- Replace `IFileMultiRequest` model with `FileUploadRequestModel` in executeMultipart method from `remote_ds.dart` and `remote_ds_impl.dart` file
- Remove `IFileRequest` and `IFileMultiRequest` classes from `request.dart`


**Note**:
- Some features of CLI may require more changes than defined here depending on your project structure and version


# Android SDK Version Migration to 36

This guide walks you through updating your Android project to SDK version 36 with the recommended Gradle, Java, and Kotlin settings.

---

## ✅ Step 1: Update App-Level `build.gradle`

**File:**
```
android/app/build.gradle
```

### ➤ Add the following under the `android` block:

```gradle
android {
    compileSdkVersion 36
    targetSdkVersion 36
    namespace 'jarvis.architecture' // Replace with your actual package name

    compileOptions {
        coreLibraryDesugaringEnabled true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = '17'
    }
}
```

---

### ➤ Add this dependency under the `dependencies` block:

```gradle
dependencies {
    coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:2.0.4'
}
```

---

## ✅ Step 2: Update Project-Level `build.gradle`

**File:**
```
android/build.gradle
```

### ➤ Update the Gradle plugin version:

Replace the existing `classpath` dependency with:

```gradle
dependencies {
    classpath 'com.android.tools.build:gradle:8.6.0'
}
```

---

### ➤ Add the following `allprojects` block:

```gradle
allprojects {
    subprojects {
        afterEvaluate { project ->
            if (project.hasProperty('android')) {
                project.android {
                    if (namespace == null) {
                        namespace project.group
                    }
                }
            }
        }
    }
}
```

---

## ✅ Step 3: Update Gradle Wrapper Properties

**File:**
```
android/gradle/wrapper/gradle-wrapper.properties
```

### ➤ Update the `distributionUrl`:

```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.14-all.zip
```

---

## ✅ Optional: Update Kotlin Version (If Needed)

If you still encounter build errors, you may need to update your Kotlin version.

**File:**
```
android/build.gradle
```

### ➤ Add or update the Kotlin version in the `buildscript` block:

```gradle
buildscript {
    ext.kotlin_version = '2.1.0'
}
```

---

## 🏁 Done!

After completing these steps:

1. **Sync your Gradle files.**
2. **Clean and rebuild your project.**
3. Verify that the app builds successfully targeting SDK 35.

If you encounter any errors, review each step to ensure all changes have been applied correctly.

# Native Splash Changes

## Android

**Android 12 and newer versions**

- Navigate to the android/app/src/main/res directory.
- Navigate to the drawable folder and update the ic_splash_animated_logo.png file or the ic_splash_animated_logo.gif file if the splash screen has an animated logo for the light theme. The file should be 1024x1024 pixels, with a minimum of 30% padding around the logo.
- Navigate to the drawable-night folder and update the ic_splash_animated_logo_dark.png file or the ic_splash_animated_logo_dark.gif file if the splash screen has an animated logo for the dark theme. The file should be 1024x1024 pixels, with a minimum of 30% padding around the logo.
- To update the background color of the splash screen and to show an animated splash logo (.gif), uncomment the code in the values-v31 and values-night-v31 folders’ style.xml files.

**Pre-Android 12 versions:**

- Navigate to the android/app/src/main/res directory.
- Navigate to the drawable folder, where you can find the splash_bg_pre_android_12.xml file, which is responsible for showing the native splash screen for the light theme. In this file, the splash logo is loaded from the mipmap.
- Navigate to the drawable-night folder, where you can find the splash_bg_pre_android_12.xml file, which is responsible for showing the native splash screen for the dark theme. In this file, the splash logo is loaded from the mipmap.
- Animated splash logos (.gif) are not supported below Android 12 versions.
- Update the ic_splash_logo.png (light mode) and ic_splash_logo_dark.png (dark mode) files in all the mipmap directories with files of the same size (480x480 pixels).
- The style.xml files in the values and values-night folders are used for pre-Android 12 versions to load the native splash screen.

**Note**
- Currently, the Flutter splash screen is not used, but the splash feature is not removed. If Flutter splash–related customization is required, then change the initial route to splash in main.dart.
- The force update dialog method is implemented in the CommonUtilities class as showAppUpdateDialog. Please use the same method across the app.
- If the Flutter splash screen is not required, please update the initial route according to the user’s logged-in state.

# iOS Splash Update:

## 1). iOS Launch Screen Background Color Update (Light & Dark Mode)

This guide explains how to set the Launch Screen storyboard background color based on the device Light or Dark appearance in a Native iOS app.

## Objective
Automatically change the Launch Screen background color
When the device switches between Light Mode and Dark Mode.

## Steps to Use Custom Light & Dark Colors

* Open the project in Xcode
* Open Assets.xcassets
* Create a new color set
* Click + → New Color Set

### Rename it to:

* LaunchBackgroundColor
* Enable appearance variants
* Select LaunchBackgroundColor
```
Set: Appearances → Any, Dark
```
* Set colors:
```
Any (Light) → Choose a light color
Dark → Choose a dark color
```

### Open LaunchScreen.storyboard file

* Select the root View
* Apply background color
* Open Attributes Inspector
* Set:
```
Background → Named Color → LaunchBackgroundColor
```

## 2). iOS Launch Screen Logo-Image Update (Light & Dark Mode)

This guide explains how to set an image on the Launch Screen storyboard and update it based on the device Light or Dark appearance in a Native iOS app.

## Objective
Automatically change the Launch Screen image
When the device switches between Light Mode and Dark Mode.

## Steps to Use Custom Light & Dark Images

* Open the project in Xcode
* Open Assets.xcassets
* Create a new Image Set
* Click + → New Image Set

### Rename it to:

* LaunchImage
* Enable appearance variants

```
Set: Appearances → Any, Dark
```
* Select LaunchImage
* Set images:

```
Any (Light) → Select light mode image
Dark → Select dark mode image
```

### Open LaunchScreen.storyboard file

* Drag and drop an Image View on the storyboard
* Select the Image View
* Open Attributes Inspector

Set:
```
Image → LaunchImage
```
* Set Content Mode (recommended):

```
Aspect Fit or Aspect Fill
```

### Add constraints:

* Center Horizontally
* Center Vertically
* Width / Height as needed

### ✅ Testing

* Run the app
* Change device appearance:
  Light Mode & Dark Mode

## 3). Flutter Splash Screen Update (iOS)

This guide explains when and how to use Flutter Splash Screen and how to properly configure the **iOS Native Launch Screen for images, GIFs, or Lottie animations**.

## Objective
Decide whether Flutter Splash is required
and correctly configure the iOS Launch Screen to match the Flutter splash design.

## Splash Screen Rules
* If the application launch screen contains **only a static logo image**,
  then **Flutter Splash is NOT required**.

* If the application launch screen contains an **animated GIF or Lottie animation,
  then Flutter Splash MUST be enabled for iOS please update this flag isShowAnimatedSplashForIOS = true in main.dart**.

### iOS Launch Screen Setup (For GIF / Lottie)

#### If the splash uses GIF or Lottie:

* Add the first frame image of the GIF or Lottie file for native launch
* Use this image on the iOS Native Launch Screen
* Apply Flutter-specific constraints to this image

### Flutter Splash Screen Guidelines
* Do Not use **ScreenUtil** on the Flutter splash screen
* Always provide direct height and width values

### Image Size & Constraints Rules

#### For Lottie Animation:

**If a Lottie file is used in Flutter Splash:**

* Manage the iOS Launch Screen ImageView
* Set proportional height and width
* Match the size according to the Flutter splash screen layout
* Ensure it looks consistent across different devices

#### For GIF Animation

**If a GIF is used in Flutter Splash:**

* Use the same height and width in flutter splash without ScreenUtil
* Apply exact dimensions on the iOS Launch Screen
* Match the size defined in Flutter
* iOS Launch Screen does NOT support animations
* Only static images are allowed on iOS native Launch Screen
* Animated content must be handled in Flutter Splash Screen

# Summary

* ✔ Static logo → No Flutter Splash needed
* ✔ GIF / Lottie → Flutter Splash required
* ✔ iOS Launch Screen → Use first frame image only
* ✔ Do not use ScreenUtil on splash

## API logging with Chucker

This boilerplate uses `chucker_flutter` for API inspection instead of storing API logs in a text file.

### Current setup

- `chucker_flutter` is added in [pubspec.yaml](/Volumes/ExternalSSD_05092022/FlutterProject/CleanPatternBoilerPlate/pubspec.yaml).
- Chucker is configured in [lib/main.dart](/Volumes/ExternalSSD_05092022/FlutterProject/CleanPatternBoilerPlate/lib/main.dart) for `dev` and `staging` flavours.
- `ChuckerFlutter.navigatorKey` is attached to `MaterialApp`, which allows Chucker to open its internal screens.
- `ChuckerDioInterceptor()` is added to Dio in [lib/core/di/injection_container.dart](/Volumes/ExternalSSD_05092022/FlutterProject/CleanPatternBoilerPlate/lib/core/di/injection_container.dart), so request and response traffic is captured automatically.
- The Settings screen already exposes an entry to open the Chucker UI from [lib/features/settings/presentation/screen/setting_screen.dart](/Volumes/ExternalSSD_05092022/FlutterProject/CleanPatternBoilerPlate/lib/features/settings/presentation/screen/setting_screen.dart).

### How it works

- Every Dio API call passes through `ChuckerDioInterceptor`.
- Chucker records request URL, method, headers, payload, response body, status code, and error details.
- Logs are viewed inside the app, so there is no need to create or share a `.txt` log file for normal debugging.

### How to use

1. Run the app with a `dev` or `staging` flavour.
2. Perform the API flow you want to inspect.
3. Open the Settings screen.
4. Tap the `Chucker` option.
5. Review the request list and open any item for detailed request/response data.

### Notes

- Keep `ENABLE_STORING_LOGS_TO_FILE = false` in [lib/core/const/app_constants.dart](/Volumes/ExternalSSD_05092022/FlutterProject/CleanPatternBoilerPlate/lib/core/const/app_constants.dart) when Chucker is the preferred logging mechanism.
- `ApiCallLogPrinterInterceptors` still prints logs for local debugging through `printFullLog`, but Chucker is the primary tool for API inspection.
- If you want Chucker available in production, update the flavour check in `main.dart` deliberately and review the security impact before enabling it.

## Firebase Analytics Setup

This boilerplate already includes Firebase Analytics in [pubspec.yaml](/Volumes/ExternalSSD_05092022/FlutterProject/CleanPatternBoilerPlate/pubspec.yaml:29):

```yaml
firebase_core: ^4.11.0
firebase_analytics: ^12.4.3
```

To enable Analytics in a new project, complete the following setup:

1. Create Firebase apps for Android and iOS in the Firebase console.
2. Download the Firebase config files for each platform.
3. Run `flutter pub get`.

### Android

1. Place `google-services.json` in `android/app/`.
2. Keep the Google Services Gradle plugin enabled in `android/app/build.gradle`.
3. Keep `await Firebase.initializeApp();` in `lib/main.dart`.
4. Keep the Analytics observer in `MaterialApp.navigatorObservers` so Flutter routes are logged as screen views.
5. Keep `google_analytics_automatic_screen_reporting_enabled` set to `false` in `android/app/src/main/AndroidManifest.xml` to avoid duplicate `MainActivity` screen events.

### iOS

1. Place `GoogleService-Info.plist` inside the flavor-specific folders under `ios/Configurations/`.
2. Keep the Xcode build phase that copies the correct `GoogleService-Info.plist` based on the active flavor.
3. Keep `await Firebase.initializeApp();` in `lib/main.dart`.

### Current Project Behavior

- Firebase is initialized in `lib/main.dart`.
- Analytics collection is explicitly enabled with `FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true)`.
- Screen tracking is handled through `FirebaseAnalyticsObserver`.
- Android automatic activity tracking is disabled so Firebase reports Flutter screen names instead of `MainActivity`.
