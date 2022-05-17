import '../assets.dart';
import '../models/models.dart';

const Content casinoHeistContent = Content(
    name: 'Casino Heist',
    imageUrl: Assets.casinoHeist,
    videoUrl: Assets.casinoHeistVideo,
    titleImageUrl: Assets.casinoHeistTitle);

const Content fishGamesContent = Content(
    name: 'Fish Games',
    imageUrl: Assets.fishGames,
    titleImageUrl: Assets.fishGamesTitle);

const Content hazlockShomesContent = Content(
    name: 'Hazlock Shomes',
    imageUrl: Assets.hazlockShomes,
    titleImageUrl: Assets.hazlockShomesTitle);

const Content itComesContent = Content(
    name: 'It Follows',
    imageUrl: Assets.itFollows,
    titleImageUrl: Assets.itFollowsTitle);

const Content nightMafiaContent = Content(
    name: 'Night Mafia',
    imageUrl: Assets.nightMafia,
    titleImageUrl: Assets.nightMafiaTitle);

const Content underTheWaterContent = Content(
    name: 'Under The Water',
    imageUrl: Assets.underTheWater,
    titleImageUrl: Assets.underTheWaterTitle);

const Content whereToContent = Content(
    name: 'Where To',
    imageUrl: Assets.whereTo,
    titleImageUrl: Assets.whereToTitle);

const List<Content> trending = [
  nightMafiaContent,
  whereToContent,
  underTheWaterContent
];

const List<Content> myList = [
  fishGamesContent,
];

const List<Content> originals = [
  hazlockShomesContent,
  itComesContent,
  casinoHeistContent
];