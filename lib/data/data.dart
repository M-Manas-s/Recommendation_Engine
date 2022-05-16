import '../assets.dart';
import '../models/models.dart';

const Content casinoHeistContent = Content(
    name: 'Casino Heist',
    imageUrl: Assets.casinoHeist,
    videoUrl: Assets.casinoHeistVideo,
    titleImageUrl: Assets.casinoHeistTitle);

const Content fishGamesContent = Content(
    name: 'Fish Games',
    imageUrl: Assets.fishGames);

const Content hazlockShomesContent = Content(
    name: 'Hazlock Shomes',
    imageUrl: Assets.hazlockShomes);

const Content itComesContent = Content(
    name: 'It Comes',
    imageUrl: Assets.itComes);

const Content nightMafiaContent = Content(
    name: 'Night Mafia',
    imageUrl: Assets.nightMafia);

const Content underTheWaterContent = Content(
    name: 'Under The Water',
    imageUrl: Assets.underTheWater);

const Content whereToContent = Content(
    name: 'Where To',
    imageUrl: Assets.whereTo);

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