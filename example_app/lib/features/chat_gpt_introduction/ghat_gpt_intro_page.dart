import 'package:example_app/features/chat_gpt_introduction/screen/chat_gpt_intro_screen.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_page.dart';

class ChatGPTIntroPage extends BasePage {
  ChatGPTIntroPage({Key? key}) : super(key: key);

  @override
  _ChatGPTIntroPageState createState() => _ChatGPTIntroPageState();
}

class _ChatGPTIntroPageState extends BasePageState<ChatGPTIntroPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => ChatGPTIntroScreen();
}
