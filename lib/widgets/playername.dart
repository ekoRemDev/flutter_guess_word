/*
 * Copyright (c) 2020 pinkfish
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
 * OR OTHER DEALINGS IN THE SOFTWARE.
 */

import 'package:flutter/material.dart';
import 'package:flutter_word_guesser/blocs/singleplayerbloc.dart';

import '../messages.dart';

///
/// Rendering the name of the player based on the current player state.
///
class PlayerName extends StatelessWidget {
  final SinglePlayerState playerState;
  final TextStyle style;

  PlayerName({@required this.playerState, this.style});

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (playerState is SinglePlayerUninitialized ||
        playerState is SinglePlayerDeleted) {
      widget = Text(Messages.of(context).unknown, style: style);
    }

    if (playerState is SinglePlayerLoaded) {
      widget = Text(playerState.player.name, style: style);
    }

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: widget,
    );
  }
}
