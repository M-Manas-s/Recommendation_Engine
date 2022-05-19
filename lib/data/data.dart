import 'package:flutter/material.dart';

import '../assets.dart';
import '../models/models.dart';

Content casinoHeistContent = Content(
    name: 'Casino Heist',
    imageUrl: Assets.casinoHeist,
    videoUrl: Assets.casinoHeistVideo,
    titleImageUrl: Assets.casinoHeistTitle,
    color: Colors.red,
    rating: 4.7,
    description: "As a criminal mastermind manipulates the police to carry out his plot, twelve robbers kidnap and lock themselves up in the Royal Casino of Italy. The strategy has a national cost and ends up being an all-out conflict.",
    tags: [
      ContentTag(tagName: "Robbery", tagValue: 5.0),
      ContentTag(tagName: "Alan Mint", tagValue: 5.0),
      ContentTag(tagName: "Casino", tagValue: 4.0),
      ContentTag(tagName: "Mastermind", tagValue: 5.0),
      ContentTag(tagName: "Crime", tagValue: 4.0),
      ContentTag(tagName: "Guns", tagValue: 1.0),
    ]);

Content fishGamesContent = Content(
    name: 'Fish Games',
    imageUrl: Assets.fishGames,
    titleImageUrl: Assets.fishGamesTitle,
    color: Colors.pink,
    rating: 4.3,
    description: "A odd offer to compete in children's games is accepted by a large number of cash-strapped players. A enticing treasure with deadly high stakes awaits you inside. ",
    tags: [
      ContentTag(tagName: "Game", tagValue: 5.0),
      ContentTag(tagName: "Hwang Bong", tagValue: 5.0),
      ContentTag(tagName: "Trapped", tagValue: 3.0),
      ContentTag(tagName: "Survivor", tagValue: 5.0),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "Guns", tagValue: 2.0),
    ]);

Content hazlockShomesContent = Content(
    name: 'Hazlock Shomes',
    imageUrl: Assets.hazlockShomes,
    titleImageUrl: Assets.hazlockShomesTitle);

Content itComesContent = Content(
    name: 'It Follows',
    imageUrl: Assets.itFollows,
    titleImageUrl: Assets.itFollowsTitle);

Content nightMafiaContent = Content(
    name: 'Night Mafia',
    imageUrl: Assets.nightMafia,
    titleImageUrl: Assets.nightMafiaTitle);

Content underTheWaterContent = Content(
    name: 'Under The Water',
    imageUrl: Assets.underTheWater,
    titleImageUrl: Assets.underTheWaterTitle);

Content whereToContent = Content(
    name: 'Where To',
    imageUrl: Assets.whereTo,
    titleImageUrl: Assets.whereToTitle);

List<Content> trending = [
  nightMafiaContent,
  whereToContent,
  underTheWaterContent
];

List<Content> myList = [
  fishGamesContent,
];

List<Content> originals = [
  hazlockShomesContent,
  itComesContent,
  fishGamesContent,
  casinoHeistContent
];