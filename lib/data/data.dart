import 'package:flutter/material.dart';

import '../assets.dart';
import '../models/models.dart';

String dummyVideoUrl =  Assets.dummyVideo;

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
      ContentTag(tagName: "Casino", tagValue: 4.0),
      ContentTag(tagName: "Death", tagValue: 3.5),
      ContentTag(tagName: "Mastermind", tagValue: 5.0),
      ContentTag(tagName: "Plan", tagValue: 3.5),
      ContentTag(tagName: "Thriller", tagValue: 4.0),
      ContentTag(tagName: "Italy", tagValue: 3.5),
      ContentTag(tagName: "Italian", tagValue: 3.5),
      ContentTag(tagName: "Government", tagValue: 3.0),
      ContentTag(tagName: "Politics", tagValue: 4.0),
      ContentTag(tagName: "Greed", tagValue: 3.5),
      ContentTag(tagName: "Heist", tagValue: 3.0),
      ContentTag(tagName: "Originals", tagValue: 6.5),
      ContentTag(tagName: "Crime", tagValue: 4.0),
      ContentTag(tagName: "Guns", tagValue: 2.5),
      ContentTag(tagName: "Money", tagValue: 3.7),
    ]);

Content fishGamesContent = Content(
    name: 'Fish Games',
    imageUrl: Assets.fishGames,
    titleImageUrl: Assets.fishGamesTitle,
    color: Colors.pink,
    rating: 4.3,
    description:
        "A odd offer to compete in children's games is accepted by a large number of cash-strapped players. A enticing treasure with deadly high stakes awaits you inside. ",
    tags: [
      ContentTag(tagName: "Game", tagValue: 5.0),
      ContentTag(tagName: "Trapped", tagValue: 3.5),
      ContentTag(tagName: "Korea", tagValue: 4.5),
      ContentTag(tagName: "Korean", tagValue: 4.5),
      ContentTag(tagName: "Death", tagValue: 4.5),
      ContentTag(tagName: "Fish", tagValue: 3.0),
      ContentTag(tagName: "Survivor", tagValue: 5.0),
      ContentTag(tagName: "Thriller", tagValue: 4.0),
      ContentTag(tagName: "Battle Royale", tagValue: 4.5),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "Guns", tagValue: 2.0),
      ContentTag(tagName: "Action", tagValue: 3.5),
      ContentTag(tagName: "Horror", tagValue: 2.0),
      ContentTag(tagName: "Money", tagValue: 3.5),
      ContentTag(tagName: "Fiction", tagValue: 1.5),
      ContentTag(tagName: "Greed", tagValue: 3.5),
    ]);

Content underTheWaterContent = Content(
    name: 'Under The Water',
    imageUrl: Assets.underTheWater,
    titleImageUrl: Assets.underTheWaterTitle,
    color: Colors.blueAccent,
    rating: 4.0,
    description:
        "Milo Thatch, a young linguist, joins an adventurous gang of explorers on a quest to discover the mythical lost island of riches lost beneath the sea.",
    tags: [
      ContentTag(tagName: "Exploration", tagValue: 5.0),
      ContentTag(tagName: "Ocean", tagValue: 5.0),
      ContentTag(tagName: "Deep Sea", tagValue: 3.5),
      ContentTag(tagName: "Lost Island", tagValue: 5.0),
      ContentTag(tagName: "Search", tagValue: 4.0),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Maps", tagValue: 3.5),
      ContentTag(tagName: "Ship", tagValue: 1.5),
      ContentTag(tagName: "Cartography", tagValue: 3.0),
      ContentTag(tagName: "Water", tagValue: 3.0),
      ContentTag(tagName: "Under", tagValue: 3.0),
      ContentTag(tagName: "Navigation", tagValue: 2.5),
      ContentTag(tagName: "Atlantis", tagValue: 3.5),
      ContentTag(tagName: "Water", tagValue: 3.0),
      ContentTag(tagName: "Mythology", tagValue: 3.5),
      ContentTag(tagName: "Spain", tagValue: 2.5),
      ContentTag(tagName: "Spanish", tagValue: 2.5),
      ContentTag(tagName: "Quest", tagValue: 3.0),
      ContentTag(tagName: "Knowledge", tagValue: 4),
    ]);

Content whereToContent = Content(
    name: 'Where To',
    imageUrl: Assets.whereTo,
    titleImageUrl: Assets.whereToTitle,
    color: Colors.pinkAccent,
    rating: 2.6,
    description:
        "With nothing but a handful of souls and a lot of ambition, two buddies set off to travel the world.",
    tags: [
      ContentTag(tagName: "Adventure", tagValue: 5.0),
      ContentTag(tagName: "Friends", tagValue: 3.5),
      ContentTag(tagName: "Exploration", tagValue: 3.0),
      ContentTag(tagName: "Tourist", tagValue: 3.0),
      ContentTag(tagName: "Travel", tagValue: 3.5),
      ContentTag(tagName: "Spain", tagValue: 3.5),
      ContentTag(tagName: "Where", tagValue: 3.0),
      ContentTag(tagName: "To", tagValue: 3.0),
      ContentTag(tagName: "Spanish", tagValue: 3.5),
      ContentTag(tagName: "World Tour", tagValue: 4.5),
      ContentTag(tagName: "Tour", tagValue: 3.0),
      ContentTag(tagName: "Ship", tagValue: 1.0),
      ContentTag(tagName: "Vehicles", tagValue: 2.0),
    ]);

Content hazlockShomesContent = Content(
    name: 'Hazlock Shomes',
    imageUrl: Assets.hazlockShomes,
    titleImageUrl: Assets.hazlockShomesTitle,
    color: Colors.black45,
    rating: 3.6,
    description:
        "Detective Hazlock Shomes and his stalwart partner Watson face up against a villain whose plot threatens the entire United Kingdom.",
    tags: [
      ContentTag(tagName: "Thriller", tagValue: 5.0),
      ContentTag(tagName: "Detective", tagValue: 5.0),
      ContentTag(tagName: "Adventure", tagValue: 2.5),
      ContentTag(tagName: "Guns", tagValue: 3.0),
      ContentTag(tagName: "Crime", tagValue: 5.0),
      ContentTag(tagName: "Hazlock", tagValue: 3.0),
      ContentTag(tagName: "Shomes", tagValue: 3.0),
      ContentTag(tagName: "UK", tagValue: 3.0),
      ContentTag(tagName: "Britain", tagValue: 3.0),
      ContentTag(tagName: "British", tagValue: 3.0),
      ContentTag(tagName: "Mastermind", tagValue: 4.0),
      ContentTag(tagName: "Mystery", tagValue: 4.5),
      ContentTag(tagName: "Murder", tagValue: 2.5),
      ContentTag(tagName: "Killer", tagValue: 4.0),
      ContentTag(tagName: "Action", tagValue: 2.5),
      ContentTag(tagName: "Criminal", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 2.5),
    ]);

Content nightMafiaContent = Content(
    name: 'Night Mafia',
    imageUrl: Assets.nightMafia,
    titleImageUrl: Assets.nightMafiaTitle,
    color: Colors.redAccent,
    rating: 2.2,
    description:
        "When the son of a powerful Mafia don returns home from Vietnam, he wants to live his own life, but family tradition, intrigues, and powerplays involving his older brother prevent him from doing so.",
    tags: [
      ContentTag(tagName: "Crime", tagValue: 5.0),
      ContentTag(tagName: "Mafia", tagValue: 6.0),
      ContentTag(tagName: "Organized", tagValue: 4.5),
      ContentTag(tagName: "USA", tagValue: 3.5),
      ContentTag(tagName: "Underworld", tagValue: 4.0),
      ContentTag(tagName: "American", tagValue: 3.5),
      ContentTag(tagName: "Guns", tagValue: 4.0),
      ContentTag(tagName: "Thriller", tagValue: 3.0),
      ContentTag(tagName: "Action", tagValue: 2.5),
      ContentTag(tagName: "Gangster", tagValue: 4.5),
      ContentTag(tagName: "Politics", tagValue: 4.0),
      ContentTag(tagName: "Planning", tagValue: 2.5),
      ContentTag(tagName: "Murder", tagValue: 3.0),
      ContentTag(tagName: "Mastermind", tagValue: 3.5),
      ContentTag(tagName: "Power", tagValue: 3.5),
      ContentTag(tagName: "Power Hungry", tagValue: 2.5),
      ContentTag(tagName: "Fame", tagValue: 2.5),
      ContentTag(tagName: "Money", tagValue: 2.5),
    ]);

Content itFollowsContent = Content(
    name: 'It Follows',
    imageUrl: Assets.itFollows,
    titleImageUrl: Assets.itFollowsTitle,
    color: const Color(0xff800000),
    rating: 3.0,
    description:
        "In the summer of 1989, a group of bullied youngsters band together to stop a shape-shifting monster from posing as a clown and preying on the children of Derry, Maine.",
    tags: [
      ContentTag(tagName: "Horror", tagValue: 6.5),
      ContentTag(tagName: "Clown", tagValue: 5.5),
      ContentTag(tagName: "USA", tagValue: 3.0),
      ContentTag(tagName: "American", tagValue: 3.0),
      ContentTag(tagName: "Thriller", tagValue: 5.5),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Supernatural", tagValue: 4.5),
      ContentTag(tagName: "Fair", tagValue: 2.5),
      ContentTag(tagName: "Friends", tagValue: 3.5),
      ContentTag(tagName: "It", tagValue: 3.0),
      ContentTag(tagName: "Follows", tagValue: 3.0),
      ContentTag(tagName: "Children", tagValue: 3.5),
      ContentTag(tagName: "Bully", tagValue: 3.5),
      ContentTag(tagName: "Scary", tagValue: 4.0),
      ContentTag(tagName: "Ghost", tagValue: 2.0),
      ContentTag(tagName: "Death", tagValue: 1.7),
      ContentTag(tagName: "Action", tagValue: 1.5),
    ]);

Content ghostShipContent = Content(
    name: 'Ghost Ship',
    imageUrl: Assets.ghostShip,
    titleImageUrl: Assets.ghostShipTitle,
    color: Colors.brown,
    rating: 4.0,
    description:
        "A salvage crew uncovers a long-lost 1662 passenger ship floating lifeless in a remote Caribbean Sea location, and quickly realises that its long-dead passengers may still be on board.",
    tags: [
      ContentTag(tagName: "Horror", tagValue: 4.5),
      ContentTag(tagName: "Ship", tagValue: 5.5),
      ContentTag(tagName: "Caribbean", tagValue: 4.3),
      ContentTag(tagName: "Thriller", tagValue: 4.5),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Supernatural", tagValue: 4.5),
      ContentTag(tagName: "Ghost", tagValue: 4.0),
      ContentTag(tagName: "Historical", tagValue: 4.5),
      ContentTag(tagName: "War", tagValue: 2.3),
      ContentTag(tagName: "Pirates", tagValue: 4.0),
      ContentTag(tagName: "Sea", tagValue: 3.5),
      ContentTag(tagName: "Ocean", tagValue: 4.0),
      ContentTag(tagName: "Scary", tagValue: 4.0),
      ContentTag(tagName: "Death", tagValue: 3.5),
      ContentTag(tagName: "Action", tagValue: 3.5),
    ]);

Content independenceNightContent = Content(
    name: 'Independence Night',
    imageUrl: Assets.independenceNight,
    titleImageUrl: Assets.independenceNightTitle,
    color: Colors.yellowAccent,
    rating: 4.6,
    description:
        "The aliens are coming and their goal is to invade and destroy Earth. Fighting superior technology, mankind's best weapon is the will to survive.",
    tags: [
      ContentTag(tagName: "Alien", tagValue: 5.5),
      ContentTag(tagName: "Extinction", tagValue: 5.0),
      ContentTag(tagName: "Survival", tagValue: 4.0),
      ContentTag(tagName: "Invasion", tagValue: 5.3),
      ContentTag(tagName: "Spaceship", tagValue: 5.0),
      ContentTag(tagName: "War", tagValue: 4.5),
      ContentTag(tagName: "Battle", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 4.0),
      ContentTag(tagName: "Planning", tagValue: 3.0),
      ContentTag(tagName: "Organized", tagValue: 2.3),
      ContentTag(tagName: "Government", tagValue: 4.0),
      ContentTag(tagName: "Army", tagValue: 4.3),
      ContentTag(tagName: "Thriller", tagValue: 3.0),
      ContentTag(tagName: "Politics", tagValue: 4.0),
      ContentTag(tagName: "Science Fiction", tagValue: 4.5),
      ContentTag(tagName: "Disaster", tagValue: 3.7),
      ContentTag(tagName: "Action", tagValue: 4.5),
      ContentTag(tagName: "Independence", tagValue: 4.0),
      ContentTag(tagName: "Fantasy", tagValue: 3.7),
      ContentTag(tagName: "Futuristic", tagValue: 3.5),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "Guns", tagValue: 3.4),
    ]);

Content starTroopersContent = Content(
    name: 'Star Troopers',
    imageUrl: Assets.starTroopers,
    titleImageUrl: Assets.starTroopersTitle,
    color: Colors.blueAccent,
    rating: 3.1,
    description:
        "Johnny Rico, a Federation trooper, is assigned to work with a bunch of new recruits on a Mars satellite station where huge bugs have chosen to launch their next attack. Humans must now fight this futuristic battle in order to survive.",
    tags: [
      ContentTag(tagName: "Alien", tagValue: 5.5),
      ContentTag(tagName: "Extinction", tagValue: 5.0),
      ContentTag(tagName: "Survival", tagValue: 4.0),
      ContentTag(tagName: "Space", tagValue: 5.3),
      ContentTag(tagName: "Spaceship", tagValue: 5.0),
      ContentTag(tagName: "War", tagValue: 4.5),
      ContentTag(tagName: "Battle", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 4.0),
      ContentTag(tagName: "Star", tagValue: 3.0),
      ContentTag(tagName: "Planning", tagValue: 3.0),
      ContentTag(tagName: "Organized", tagValue: 2.3),
      ContentTag(tagName: "Satellite", tagValue: 4.0),
      ContentTag(tagName: "Troopers", tagValue: 3.0),
      ContentTag(tagName: "Army", tagValue: 4.3),
      ContentTag(tagName: "Thriller", tagValue: 3.0),
      ContentTag(tagName: "Science Fiction", tagValue: 4.5),
      ContentTag(tagName: "Disaster", tagValue: 3.7),
      ContentTag(tagName: "Action", tagValue: 5.0),
      ContentTag(tagName: "Futuristic", tagValue: 3.5),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "Guns", tagValue: 4.5),
    ]);

Content boultContent = Content(
    name: 'Boult',
    imageUrl: Assets.boult,
    titleImageUrl: Assets.boultTitle,
    color: Colors.red,
    rating: 2.5,
    description:
        "A canine star of a fictional sci-fi/action show who believes his abilities are real sets out on a cross-country journey to save his co-star from a threat he believes is equally real.",
    tags: [
      ContentTag(tagName: "Kids", tagValue: 6.0),
      ContentTag(tagName: "Animated", tagValue: 5.0),
      ContentTag(tagName: "Science Fiction", tagValue: 3.5),
      ContentTag(tagName: "Dog", tagValue: 3.5),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Comedy", tagValue: 3.5),
      ContentTag(tagName: "Boult", tagValue: 4.0),
    ]);

Content braveContent = Content(
    name: 'Brave',
    imageUrl: Assets.brave,
    titleImageUrl: Assets.braveTitle,
    color: Colors.red,
    rating: 4.1,
    description:
        "Princess Maria opposes a tradition that causes havoc in her realm, determined to forge her own path in life. Maria is given one wish and must use her bravery and aviation abilities to break a monstrous curse.",
    tags: [
      ContentTag(tagName: "Kids", tagValue: 6.0),
      ContentTag(tagName: "Animated", tagValue: 5.0),
      ContentTag(tagName: "Fantasy", tagValue: 4.0),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Comedy", tagValue: 3.5),
      ContentTag(tagName: "Action", tagValue: 2.5),
      ContentTag(tagName: "Curse", tagValue: 3.0),
      ContentTag(tagName: "Brave", tagValue: 4.0),
      ContentTag(tagName: "FLying", tagValue: 4.0),
    ]);

Content bravesoulContent = Content(
    name: 'Bravesoul',
    imageUrl: Assets.bravesoul,
    titleImageUrl: Assets.bravesoulTitle,
    color: Colors.red,
    rating: 2.7,
    description:
        "Following the death of Alexander III of Scotland, who died without an heir, King Edward invades and conquers Scotland. William Wallace, a Scottish warrior, launches a revolt against King Edward I of England to free his nation.",
    tags: [
      ContentTag(tagName: "Invasion", tagValue: 3.5),
      ContentTag(tagName: "Warrior", tagValue: 3.5),
      ContentTag(tagName: "Revolt", tagValue: 4.0),
      ContentTag(tagName: "Ship", tagValue: 5.5),
      ContentTag(tagName: "Scotland", tagValue: 3.0),
      ContentTag(tagName: "Britain", tagValue: 3.0),
      ContentTag(tagName: "Scottish", tagValue: 3.0),
      ContentTag(tagName: "British", tagValue: 3.0),
      ContentTag(tagName: "Politics", tagValue: 4.0),
      ContentTag(tagName: "Bravesoul", tagValue: 3.0),
      ContentTag(tagName: "Real Account", tagValue: 3.5),
      ContentTag(tagName: "Historical", tagValue: 4.5),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "War", tagValue: 6.5),
      ContentTag(tagName: "Kings", tagValue: 4.0),
      ContentTag(tagName: "Kingdom", tagValue: 3.5),
      ContentTag(tagName: "Army", tagValue: 4.5),
      ContentTag(tagName: "Death", tagValue: 4.0),
      ContentTag(tagName: "Action", tagValue: 5.0),
    ]);

Content captainMathewContent = Content(
    name: 'Captain Mathew',
    imageUrl: Assets.captainMathew,
    titleImageUrl: Assets.captainMathewTitle,
    color: Colors.black,
    rating: 3.5,
    description:
        "The actual account of Captain Richard Phillips and the 2009 seizure of the US-flagged MV Maersk Alabama by Somali pirates, the first hijacking of an American cargo ship in two centuries.",
    tags: [
      ContentTag(tagName: "Adventure", tagValue: 5.0),
      ContentTag(tagName: "Cargo", tagValue: 3.5),
      ContentTag(tagName: "Shipment", tagValue: 3.5),
      ContentTag(tagName: "US", tagValue: 3.5),
      ContentTag(tagName: "American", tagValue: 3.5),
      ContentTag(tagName: "Ship", tagValue: 5.0),
      ContentTag(tagName: "Pirates", tagValue: 4.0),
      ContentTag(tagName: "Hijacking", tagValue: 4.5),
      ContentTag(tagName: "Mathew", tagValue: 3.0),
      ContentTag(tagName: "Captain", tagValue: 3.0),
      ContentTag(tagName: "Somalia", tagValue: 3.0),
      ContentTag(tagName: "Action", tagValue: 3.0),
      ContentTag(tagName: "Strategy", tagValue: 2.5),
      ContentTag(tagName: "Greed", tagValue: 3.5),
      ContentTag(tagName: "Money", tagValue: 3.5),
      ContentTag(tagName: "Real Account", tagValue: 3.5),
      ContentTag(tagName: "Guns", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 2.0),
    ]);

Content cyberMatrixContent = Content(
    name: 'Cyber Matrix',
    imageUrl: Assets.cyberMatrix,
    titleImageUrl: Assets.cyberMatrixTitle,
    color: Colors.green,
    rating: 4.4,
    description:
        "When Neo is led to a foreboding underworld by a gorgeous stranger, he discovers the horrifying truth: the life he knows is a complex lie perpetrated by an evil cyber-intelligence.",
    tags: [
      ContentTag(tagName: "Matrix", tagValue: 5.5),
      ContentTag(tagName: "Cyber", tagValue: 4.0),
      ContentTag(tagName: "Underworld", tagValue: 5.5),
      ContentTag(tagName: "Survival", tagValue: 2.0),
      ContentTag(tagName: "Martial Arts", tagValue: 4.3),
      ContentTag(tagName: "Hand Combat", tagValue: 4.3),
      ContentTag(tagName: "Battle", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 1.0),
      ContentTag(tagName: "Thriller", tagValue: 2.0),
      ContentTag(tagName: "Science Fiction", tagValue: 3.5),
      ContentTag(tagName: "Action", tagValue: 5.5),
      ContentTag(tagName: "Fantasy", tagValue: 3.7),
      ContentTag(tagName: "Futuristic", tagValue: 4.5),
      ContentTag(tagName: "Guns", tagValue: 2.4),
    ]);

Content excaliburContent = Content(
    name: 'Excalibur',
    imageUrl: Assets.excalibur,
    titleImageUrl: Assets.excaliburTitle,
    color: Colors.red,
    rating: 4.0,
    description:
        "Even as dark powers attempt to break the Round Table of Camelot apart, Morin the magician aids Arakan Pendragon in uniting the Britons around it.",
    tags: [
      ContentTag(tagName: "Adventure", tagValue: 5.0),
      ContentTag(tagName: "Historical", tagValue: 5.0),
      ContentTag(tagName: "Battle", tagValue: 5.0),
      ContentTag(tagName: "War", tagValue: 5.0),
      ContentTag(tagName: "British", tagValue: 3.0),
      ContentTag(tagName: "American", tagValue: 3.0),
      ContentTag(tagName: "US", tagValue: 3.0),
      ContentTag(tagName: "Britain", tagValue: 3.0),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "Death", tagValue: 3.5),
      ContentTag(tagName: "Army", tagValue: 3.0),
      ContentTag(tagName: "Magic", tagValue: 3.0),
      ContentTag(tagName: "Kingdom", tagValue: 4.0),
      ContentTag(tagName: "King", tagValue: 4.0),
      ContentTag(tagName: "Thriller", tagValue: 1.5),
      ContentTag(tagName: "Power Hungry", tagValue: 3.5),
      ContentTag(tagName: "Fantasy", tagValue: 3.0),
      ContentTag(tagName: "Excalibur", tagValue: 4.0),
      ContentTag(tagName: "Action", tagValue: 4.5),
    ]);

Content extinctionContent = Content(
    name: 'Extinction',
    imageUrl: Assets.extinction,
    titleImageUrl: Assets.extinctionTitle,
    color: Colors.red,
    rating: 4.3,
    description:
        "A father has a frequent dream about his family being separated from him. When the Earth is attacked by a power bent on destruction, his dread becomes a reality.",
    tags: [
      ContentTag(tagName: "Alien", tagValue: 6.5),
      ContentTag(tagName: "Extinction", tagValue: 6.0),
      ContentTag(tagName: "Survival", tagValue: 4.0),
      ContentTag(tagName: "Invasion", tagValue: 5.3),
      ContentTag(tagName: "Spaceship", tagValue: 5.0),
      ContentTag(tagName: "War", tagValue: 4.5),
      ContentTag(tagName: "Family", tagValue: 4.5),
      ContentTag(tagName: "Death", tagValue: 4.0),
      ContentTag(tagName: "Planning", tagValue: 3.0),
      ContentTag(tagName: "Organized", tagValue: 2.3),
      ContentTag(tagName: "Government", tagValue: 4.0),
      ContentTag(tagName: "Army", tagValue: 4.3),
      ContentTag(tagName: "Thriller", tagValue: 4.0),
      ContentTag(tagName: "Science Fiction", tagValue: 4.5),
      ContentTag(tagName: "Disaster", tagValue: 3.7),
      ContentTag(tagName: "Action", tagValue: 3.5),
      ContentTag(tagName: "Fantasy", tagValue: 3.7),
      ContentTag(tagName: "Futuristic", tagValue: 3.5),
      ContentTag(tagName: "Originals", tagValue: 6.5),
      ContentTag(tagName: "Strategy", tagValue: 2.0),
      ContentTag(tagName: "Guns", tagValue: 3.4),
    ]);

Content lastRideContent = Content(
    name: 'Last Ride',
    imageUrl: Assets.lastRide,
    titleImageUrl: Assets.lastRideTitle,
    color: Colors.red,
    rating: 3.3,
    description:
        "After their 1962 high school graduation, a group of youngsters from California's central valley spend one final night cruising the strip with their friends before pursuing their various objectives.",
    tags: [
      ContentTag(tagName: "Friends", tagValue: 6.5),
      ContentTag(tagName: "High School", tagValue: 5.0),
      ContentTag(tagName: "Adventure", tagValue: 6.5),
      ContentTag(tagName: "Night", tagValue: 3.5),
      ContentTag(tagName: "Life", tagValue: 6.5),
      ContentTag(tagName: "Valley", tagValue: 2.5),
      ContentTag(tagName: "California", tagValue: 3.0),
      ContentTag(tagName: "American", tagValue: 3.0),
      ContentTag(tagName: "US", tagValue: 3.0),
      ContentTag(tagName: "Teen", tagValue: 5.5),
      ContentTag(tagName: "Graduation", tagValue: 3.5),
      ContentTag(tagName: "Life", tagValue: 4.5),
      ContentTag(tagName: "Comedy", tagValue: 3.0),
      ContentTag(tagName: "Last", tagValue: 3.0),
      ContentTag(tagName: "Ride", tagValue: 3.0),
    ]);

Content maggieAndFriendsContent = Content(
    name: 'Maggie And Friends',
    imageUrl: Assets.maggieAndFriends,
    titleImageUrl: Assets.maggieAndFriendsTitle,
    color: Colors.red,
    rating: 2.5,
    description:
        "Maggie, an introvert, is introduced to  new set of friends in a new neighbourhood. She must learn to live with those new friends now.",
    tags: [
      ContentTag(tagName: "Friends", tagValue: 7.5),
      ContentTag(tagName: "Neighbourhood", tagValue: 5.0),
      ContentTag(tagName: "Life", tagValue: 6.5),
      ContentTag(tagName: "American", tagValue: 3.0),
      ContentTag(tagName: "US", tagValue: 3.0),
      ContentTag(tagName: "Comedy", tagValue: 2.0),
      ContentTag(tagName: "Maggie", tagValue: 3.0),
      ContentTag(tagName: "Teen", tagValue: 5.5),
    ]);

Content maryInWonderlandContent = Content(
    name: 'Mary In Wonderland',
    imageUrl: Assets.maryInWonderland,
    titleImageUrl: Assets.maryInWonderlandTitle,
    color: Colors.red,
    rating: 4.6,
    description:
        "Mary, nineteen, returns to the magical realm after a childhood adventure, where she reunites with old friends and discovers her true destiny: to put an end to the Red Queen's reign of terror.",
    tags: [
      ContentTag(tagName: "Kids", tagValue: 6.0),
      ContentTag(tagName: "Animated", tagValue: 5.0),
      ContentTag(tagName: "Fantasy", tagValue: 6.0),
      ContentTag(tagName: "Adventure", tagValue: 5.5),
      ContentTag(tagName: "Mary", tagValue: 3.0),
      ContentTag(tagName: "Wonderland", tagValue: 3.0),
    ]);

Content misterDynamiteContent = Content(
    name: 'Mister Dynamite',
    imageUrl: Assets.misterDynamite,
    titleImageUrl: Assets.misterDynamiteTitle,
    color: Colors.red,
    rating: 2.5,
    description:
        "While dealing with his weird family situation back home, a listless and alienated adolescent resolves to help his new acquaintance win the class presidency in his small western high school.",
    tags: [
      ContentTag(tagName: "Life", tagValue: 4.5),
      ContentTag(tagName: "Family", tagValue: 4.5),
      ContentTag(tagName: "Comedy", tagValue: 5.5),
      ContentTag(tagName: "Friends", tagValue: 4.5),
      ContentTag(tagName: "Politics", tagValue: 4.0),
      ContentTag(tagName: "American", tagValue: 4.0),
      ContentTag(tagName: "US", tagValue: 4.0),
      ContentTag(tagName: "High School", tagValue: 5.5),
      ContentTag(tagName: "Teen", tagValue: 5.5),
      ContentTag(tagName: "Mister", tagValue: 4.0),
      ContentTag(tagName: "Dynamite", tagValue: 2.0),
    ]);

Content oblivionContent = Content(
    name: 'Oblivion',
    imageUrl: Assets.oblivion,
    titleImageUrl: Assets.oblivionTitle,
    color: Colors.red,
    rating: 4.3,
    description:
        "A veteran tasked to collect Earth's last resources begins to doubt his own knowledge of the assignment and himself.",
    tags: [
      ContentTag(tagName: "Oblivion", tagValue: 3.0),
      ContentTag(tagName: "Extinction", tagValue: 5.5),
      ContentTag(tagName: "Apocalypse", tagValue: 6.0),
      ContentTag(tagName: "Survival", tagValue: 4.0),
      ContentTag(tagName: "Search", tagValue: 5.0),
      ContentTag(tagName: "Death", tagValue: 2.5),
      ContentTag(tagName: "Government", tagValue: 2.5),
      ContentTag(tagName: "Politics", tagValue: 2.5),
      ContentTag(tagName: "Adventure", tagValue: 5.0),
      ContentTag(tagName: "Mystery", tagValue: 5.0),
      ContentTag(tagName: "Thriller", tagValue: 4.5),
      ContentTag(tagName: "Action", tagValue: 1.5),
      ContentTag(tagName: "Guns", tagValue: 3.4),
    ]);

Content onwardContent = Content(
    name: 'Onward',
    imageUrl: Assets.onward,
    titleImageUrl: Assets.onwardTitle,
    color: Colors.red,
    rating: 3.4,
    description:
        "A couple sets off on a journey to discover their surroundings. The excursion that began as a short drive becomes a protracted experience.",
    tags: [
      ContentTag(tagName: "Adventure", tagValue: 6.0),
      ContentTag(tagName: "Couple", tagValue: 3.5),
      ContentTag(tagName: "Exploration", tagValue: 4.0),
      ContentTag(tagName: "Tourist", tagValue: 3.0),
      ContentTag(tagName: "Travel", tagValue: 4.5),
      ContentTag(tagName: "France", tagValue: 3.5),
      ContentTag(tagName: "Onward", tagValue: 3.0),
      ContentTag(tagName: "French", tagValue: 3.5),
      ContentTag(tagName: "Tour", tagValue: 3.0),
      ContentTag(tagName: "Ship", tagValue: 1.0),
      ContentTag(tagName: "Vehicles", tagValue: 2.0),
    ]);

Content prochantusContent = Content(
    name: 'Prochantus',
    imageUrl: Assets.prochantus,
    titleImageUrl: Assets.prochantusTitle,
    color: Colors.red,
    rating: 3.7,
    description:
        "A crew searching for clues to humanity's origins discovers a structure on a faraway moon, but they quickly discover they are not alone.",
    tags: [
      ContentTag(tagName: "Horror", tagValue: 6.5),
      ContentTag(tagName: "Alien", tagValue: 5.5),
      ContentTag(tagName: "Thriller", tagValue: 5.5),
      ContentTag(tagName: "Spaceship", tagValue: 4.5),
      ContentTag(tagName: "Mystery", tagValue: 4.0),
      ContentTag(tagName: "Search", tagValue: 3.5),
      ContentTag(tagName: "Prochantus", tagValue: 3.0),
      ContentTag(tagName: "Space", tagValue: 4.0),
      ContentTag(tagName: "Originals", tagValue: 6.5),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Science Fiction", tagValue: 4.5),
      ContentTag(tagName: "Futuristic", tagValue: 4.5),
      ContentTag(tagName: "Scary", tagValue: 4.0),
      ContentTag(tagName: "Death", tagValue: 4.5),
      ContentTag(tagName: "Action", tagValue: 4.0),
    ]);

Content rameshBakshiContent = Content(
    name: 'Ramesh Bakshi',
    imageUrl: Assets.rameshBakshi,
    titleImageUrl: Assets.rameshBakshiTitle,
    color: Colors.red,
    rating: 4.5,
    description:
        "Ramesh Bakshi has retired from active duty. When Vyom, an old buddy from the CBI, shows up seeking for assistance, Bakshi finds himself on the trail of a mysterious villain equipped with terrifying new technology.",
    tags: [
      ContentTag(tagName: "Thriller", tagValue: 5.0),
      ContentTag(tagName: "Detective", tagValue: 5.0),
      ContentTag(tagName: "Adventure", tagValue: 2.5),
      ContentTag(tagName: "Guns", tagValue: 3.0),
      ContentTag(tagName: "Crime", tagValue: 5.0),
      ContentTag(tagName: "India", tagValue: 3.0),
      ContentTag(tagName: "Indian", tagValue: 3.0),
      ContentTag(tagName: "Mastermind", tagValue: 4.0),
      ContentTag(tagName: "Mystery", tagValue: 4.5),
      ContentTag(tagName: "Murder", tagValue: 2.5),
      ContentTag(tagName: "Killer", tagValue: 4.0),
      ContentTag(tagName: "Ramesh", tagValue: 3.0),
      ContentTag(tagName: "Bakshi", tagValue: 3.0),
      ContentTag(tagName: "Criminal", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 2.5),
    ]);

Content rocketScienceContent = Content(
    name: 'Rocket Science',
    imageUrl: Assets.rocketScience,
    titleImageUrl: Assets.rocketScienceTitle,
    color: Colors.red,
    rating: 4.5,
    description:
        "A stuttering teen joins his high school debate team in search of answers to life's major issues.",
    tags: [
      ContentTag(tagName: "Life", tagValue: 4.5),
      ContentTag(tagName: "Friends", tagValue: 4.5),
      ContentTag(tagName: "Debate", tagValue: 4.0),
      ContentTag(tagName: "American", tagValue: 4.0),
      ContentTag(tagName: "US", tagValue: 4.0),
      ContentTag(tagName: "High School", tagValue: 5.5),
      ContentTag(tagName: "Teen", tagValue: 5.5),
      ContentTag(tagName: "Rocket", tagValue: 4.0),
      ContentTag(tagName: "Science", tagValue: 2.0),
    ]);

Content savingPrivateJonesContent = Content(
    name: 'Saving Private Jones',
    imageUrl: Assets.savingPrivateJones,
    titleImageUrl: Assets.savingPrivateJonesTitle,
    color: Colors.red,
    rating: 4.9,
    description:
        "Following the Normandy Landings, a group of American soldiers goes beyond enemy lines to rescue a paratrooper whose brothers were killed in fighting.",
    tags: [
      ContentTag(tagName: "World War", tagValue: 5.5),
      ContentTag(tagName: "Search", tagValue: 5.5),
      ContentTag(tagName: "France", tagValue: 3.0),
      ContentTag(tagName: "Jones", tagValue: 3.0),
      ContentTag(tagName: "Saving", tagValue: 3.0),
      ContentTag(tagName: "Private", tagValue: 3.0),
      ContentTag(tagName: "D-Day", tagValue: 3.0),
      ContentTag(tagName: "American", tagValue: 3.0),
      ContentTag(tagName: "US", tagValue: 3.0),
      ContentTag(tagName: "Historical", tagValue: 6.5),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "War", tagValue: 4.5),
      ContentTag(tagName: "Guns", tagValue: 4.5),
      ContentTag(tagName: "Army", tagValue: 5.5),
      ContentTag(tagName: "Death", tagValue: 4.5),
      ContentTag(tagName: "Action", tagValue: 5.0),
    ]);

Content gloryPathContent = Content(
    name: 'Glory Path',
    imageUrl: Assets.gloryPath,
    titleImageUrl: Assets.gloryPathTitle,
    color: Colors.red,
    rating: 4.0,
    description:
        "Coach Don Bravo of Texas Western leads the first all-black starting lineup in college basketball to the NCAA national championship in 1966.",
    tags: [
      ContentTag(tagName: "Sports", tagValue: 6.5),
      ContentTag(tagName: "Friends", tagValue: 4.0),
      ContentTag(tagName: "Basketball", tagValue: 4.0),
      ContentTag(tagName: "Manager", tagValue: 5.0),
      ContentTag(tagName: "Organized", tagValue: 4.0),
      ContentTag(tagName: "Strategy", tagValue: 4.5),
      ContentTag(tagName: "American", tagValue: 4.0),
      ContentTag(tagName: "US", tagValue: 4.0),
      ContentTag(tagName: "High School", tagValue: 5.5),
      ContentTag(tagName: "Teen", tagValue: 4.0),
      ContentTag(tagName: "Glory", tagValue: 3.0),
      ContentTag(tagName: "Path", tagValue: 3.0),
    ]);

Content gravityContent = Content(
    name: 'Gravity',
    imageUrl: Assets.gravity,
    titleImageUrl: Assets.gravityTitle,
    color: Colors.red,
    rating: 2.0,
    description:
        "After an accident leaves them stuck in space, two astronauts aboard a space station work together to survive.",
    tags: [
      ContentTag(tagName: "Survival", tagValue: 5.5),
      ContentTag(tagName: "Space", tagValue: 5.3),
      ContentTag(tagName: "Spaceship", tagValue: 4.0),
      ContentTag(tagName: "Planning", tagValue: 4.0),
      ContentTag(tagName: "Organized", tagValue: 2.3),
      ContentTag(tagName: "Gravity", tagValue: 3),
      ContentTag(tagName: "Satellite", tagValue: 4.0),
      ContentTag(tagName: "Thriller", tagValue: 2.0),
      ContentTag(tagName: "Trapped", tagValue: 4.0),
      ContentTag(tagName: "Science Fiction", tagValue: 4.5),
      ContentTag(tagName: "Disaster", tagValue: 5.5),
      ContentTag(tagName: "Futuristic", tagValue: 3.5),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
    ]);

Content heartOfTheSeaContent = Content(
    name: 'Heart Of The Sea',
    imageUrl: Assets.heartOfTheSea,
    titleImageUrl: Assets.heartOfTheSeaTitle,
    color: Colors.red,
    rating: 2.6,
    description:
        "A story about the sinking of a New England whaling ship by a gigantic whale in 1820, which inspired the renowned novel Moby-Dick.",
    tags: [
      ContentTag(tagName: "Historical", tagValue: 5.5),
      ContentTag(tagName: "British", tagValue: 4.5),
      ContentTag(tagName: "Ship", tagValue: 5.5),
      ContentTag(tagName: "Thriller", tagValue: 4.0),
      ContentTag(tagName: "Heart", tagValue: 3.0),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Real Account", tagValue: 4.0),
      ContentTag(tagName: "Disaster", tagValue: 4.7),
      ContentTag(tagName: "Sea", tagValue: 3.5),
      ContentTag(tagName: "Originals", tagValue: 6.5),
      ContentTag(tagName: "Ocean", tagValue: 4.0),
      ContentTag(tagName: "Death", tagValue: 4.0),
      ContentTag(tagName: "Scary", tagValue: 3.0),
      ContentTag(tagName: "Action", tagValue: 3.5),
    ]);

Content helloJaceContent = Content(
    name: 'Hello Jace',
    imageUrl: Assets.helloJace,
    titleImageUrl: Assets.helloJaceTitle,
    color: Colors.red,
    rating: 2.5,
    description:
        "Jace, a well-known comedian, is faced with a difficult decision between his friends and his career.",
    tags: [
      ContentTag(tagName: "Comedy", tagValue: 6.5),
      ContentTag(tagName: "Life", tagValue: 5.0),
      ContentTag(tagName: "Comedian", tagValue: 4.5),
      ContentTag(tagName: "Hello", tagValue: 3),
      ContentTag(tagName: "Jace", tagValue: 3),
      ContentTag(tagName: "Career", tagValue: 3.5),
      ContentTag(tagName: "Friends", tagValue: 4.5),
      ContentTag(tagName: "Family", tagValue: 3.5),
      ContentTag(tagName: "Planning", tagValue: 3.5),
    ]);

Content hideyoshiIyeshuContent = Content(
    name: 'Hideyoshi Iyeshu',
    imageUrl: Assets.hideyoshiIyeshu,
    titleImageUrl: Assets.hideyoshiIyeshuTitle,
    color: Colors.red,
    rating: 3.6,
    description:
        "As events develop against him, a former assassin's pledge to never kill again is put to the test.",
    tags: [
      ContentTag(tagName: "Thriller", tagValue: 5.0),
      ContentTag(tagName: "Detective", tagValue: 3.0),
      ContentTag(tagName: "Adventure", tagValue: 4.5),
      ContentTag(tagName: "Historical", tagValue: 5.0),
      ContentTag(tagName: "Japan", tagValue: 3.0),
      ContentTag(tagName: "Japanese", tagValue: 3.0),
      ContentTag(tagName: "Organized", tagValue: 4.5),
      ContentTag(tagName: "Crime", tagValue: 5.0),
      ContentTag(tagName: "Mastermind", tagValue: 4.0),
      ContentTag(tagName: "Action", tagValue: 6.5),
      ContentTag(tagName: "Murder", tagValue: 2.5),
      ContentTag(tagName: "Killer", tagValue: 4.0),
      ContentTag(tagName: "Criminal", tagValue: 3.5),
      ContentTag(tagName: "Hideyoshi", tagValue: 3),
      ContentTag(tagName: "Iyeshu", tagValue: 3),
      ContentTag(tagName: "Death", tagValue: 3.5),
    ]);

Content immortalEnginesContent = Content(
    name: 'Immortal Engines',
    imageUrl: Assets.immortalEngines,
    titleImageUrl: Assets.immortalEnginesTitle,
    color: Colors.red,
    rating: 3.2,
    description:
        "Two people meet in London and try to halt a conspiracy in a post-apocalyptic future where cities ride on wheels and consume one another to survive.",
    tags: [
      ContentTag(tagName: "Thriller", tagValue: 5.0),
      ContentTag(tagName: "Mystery", tagValue: 4.0),
      ContentTag(tagName: "Science Fiction", tagValue: 6.0),
      ContentTag(tagName: "Futuristic", tagValue: 6.0),
      ContentTag(tagName: "Apocalypse", tagValue: 5.5),
      ContentTag(tagName: "Mastermind", tagValue: 4.0),
      ContentTag(tagName: "Action", tagValue: 5.0),
      ContentTag(tagName: "Criminal", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 3.5),
      ContentTag(tagName: "Engines", tagValue: 3.0),
      ContentTag(tagName: "Originals", tagValue: 6.5),
      ContentTag(tagName: "Immortal", tagValue: 3.0),
    ]);

Content survivormanContent = Content(
    name: 'Survivorman',
    imageUrl: Assets.survivorman,
    titleImageUrl: Assets.survivormanTitle,
    color: Colors.red,
    rating: 4.1,
    description:
        "Without food, shelter, or fresh water, one guy is left alone in the wilderness for seven days, relying solely on his wits and energy to survive.",
    tags: [
      ContentTag(tagName: "Survival", tagValue: 6.5),
      ContentTag(tagName: "Wild", tagValue: 5.3),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "Survivorman", tagValue: 4.0),
      ContentTag(tagName: "Adventure", tagValue: 6.5),
      ContentTag(tagName: "Planning", tagValue: 5.5),
      ContentTag(tagName: "Apocalypse", tagValue: 3.5),
    ]);

Content theAlienContent = Content(
    name: 'The Alien',
    imageUrl: Assets.theAlien,
    titleImageUrl: Assets.theAlienTitle,
    color: Colors.red,
    rating: 2.0,
    description:
        "A colony ship crew travelling for a distant planet discovers an uncharted paradise with a menace beyond their wildest dreams, forcing them to try a perilous escape.",
    tags: [
      ContentTag(tagName: "Horror", tagValue: 6.5),
      ContentTag(tagName: "Alien", tagValue: 5.5),
      ContentTag(tagName: "Thriller", tagValue: 5.5),
      ContentTag(tagName: "Spaceship", tagValue: 3.5),
      ContentTag(tagName: "Search", tagValue: 3.5),
      ContentTag(tagName: "Space", tagValue: 4.5),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Planning", tagValue: 3.0),
      ContentTag(tagName: "Science Fiction", tagValue: 4.5),
      ContentTag(tagName: "Scary", tagValue: 4.0),
      ContentTag(tagName: "Disaster", tagValue: 3.7),
      ContentTag(tagName: "Futuristic", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 3.7),
      ContentTag(tagName: "Guns", tagValue: 3.5),
      ContentTag(tagName: "Action", tagValue: 3.5),
      ContentTag(tagName: "Strategy", tagValue: 2.0),
    ]);

Content theBigThingsContent = Content(
    name: 'The Big Things',
    imageUrl: Assets.theBigThings,
    titleImageUrl: Assets.theBigThingsTitle,
    color: Colors.red,
    rating: 4.3,
    description:
        "Kern County Deputy Sheriff Joe Deacon is dispatched to Los Angeles for a routine evidence gathering mission. Instead, he finds himself involved in the hunt for a serial killer terrorising the city.",
    tags: [
      ContentTag(tagName: "Thriller", tagValue: 5.0),
      ContentTag(tagName: "Detective", tagValue: 5.0),
      ContentTag(tagName: "Adventure", tagValue: 2.5),
      ContentTag(tagName: "Government", tagValue: 2.5),
      ContentTag(tagName: "Guns", tagValue: 3.0),
      ContentTag(tagName: "Crime", tagValue: 5.0),
      ContentTag(tagName: "Big", tagValue: 3.0),
      ContentTag(tagName: "Things", tagValue: 3.0),
      ContentTag(tagName: "US", tagValue: 3.0),
      ContentTag(tagName: "American", tagValue: 3.0),
      ContentTag(tagName: "Mastermind", tagValue: 4.0),
      ContentTag(tagName: "Mystery", tagValue: 4.5),
      ContentTag(tagName: "Murder", tagValue: 2.5),
      ContentTag(tagName: "Killer", tagValue: 4.0),
      ContentTag(tagName: "Originals", tagValue: 6.5),
      ContentTag(tagName: "Action", tagValue: 2.5),
      ContentTag(tagName: "Criminal", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 2.5),
    ]);

Content theBrightSideContent = Content(
    name: 'The Bright Side',
    imageUrl: Assets.theBrightSide,
    titleImageUrl: Assets.theBrightSideTitle,
    color: Colors.red,
    rating: 2.0,
    description:
        "With the support of a compassionate mother and her family, Mike Oster, a homeless and traumatised youngster, became an All-American football star and first-round NFL draught pick.",
    tags: [
      ContentTag(tagName: "Sports", tagValue: 6.5),
      ContentTag(tagName: "Friends", tagValue: 3.5),
      ContentTag(tagName: "Family", tagValue: 5.5),
      ContentTag(tagName: "Football", tagValue: 4.0),
      ContentTag(tagName: "Manager", tagValue: 2.0),
      ContentTag(tagName: "Organized", tagValue: 4.0),
      ContentTag(tagName: "Strategy", tagValue: 4.5),
      ContentTag(tagName: "American", tagValue: 4.0),
      ContentTag(tagName: "US", tagValue: 4.0),
      ContentTag(tagName: "High School", tagValue: 5.5),
      ContentTag(tagName: "Teen", tagValue: 4.0),
      ContentTag(tagName: "Bright", tagValue: 3.0),
      ContentTag(tagName: "Side", tagValue: 3.0),
    ]);

Content theForestContent = Content(
    name: 'The Forest',
    imageUrl: Assets.theForest,
    titleImageUrl: Assets.theForestTitle,
    color: Colors.red,
    rating: 4.0,
    description:
        "Sarah Williams, an American woman, travels to a Japanese forest in search of her twin sister who has gone missing. Things change, however, when she is attacked by demonic beings.",
    tags: [
      ContentTag(tagName: "Horror", tagValue: 6.5),
      ContentTag(tagName: "Forest", tagValue: 5.5),
      ContentTag(tagName: "USA", tagValue: 3.0),
      ContentTag(tagName: "Japan", tagValue: 3.0),
      ContentTag(tagName: "American", tagValue: 3.0),
      ContentTag(tagName: "Thriller", tagValue: 5.5),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Supernatural", tagValue: 4.5),
      ContentTag(tagName: "Search", tagValue: 3.5),
      ContentTag(tagName: "Scary", tagValue: 4.0),
      ContentTag(tagName: "Ghost", tagValue: 2.0),
      ContentTag(tagName: "Death", tagValue: 2.7),
      ContentTag(tagName: "Quest", tagValue: 4.0),
      ContentTag(tagName: "Action", tagValue: 1.5),
    ]);

Content theLionOfWallStreetContent = Content(
    name: 'The Lion Of Wall Street',
    imageUrl: Assets.theLionOfWallStreet,
    titleImageUrl: Assets.theLionOfWallStreetTitle,
    color: Colors.red,
    rating: 3.0,
    description:
        "Based on Jordan Belfort's true narrative, from his climb to become a wealthy stockbroker living the good life to his fall into crime, corruption, and the federal government.",
    tags: [
      ContentTag(tagName: "Crime", tagValue: 2.0),
      ContentTag(tagName: "Organized", tagValue: 5.5),
      ContentTag(tagName: "Money", tagValue: 6.5),
      ContentTag(tagName: "Mastermind", tagValue: 4.0),
      ContentTag(tagName: "American", tagValue: 3.5),
      ContentTag(tagName: "Wall", tagValue: 3.0),
      ContentTag(tagName: "Street", tagValue: 3.0),
      ContentTag(tagName: "Politics", tagValue: 4.0),
      ContentTag(tagName: "Planning", tagValue: 4.5),
      ContentTag(tagName: "Strategy", tagValue: 4.0),
      ContentTag(tagName: "Comedy", tagValue: 4.0),
      ContentTag(tagName: "Greed", tagValue: 4.0),
      ContentTag(tagName: "Fame", tagValue: 4.5),
    ]);

Content thePiratesContent = Content(
    name: 'The Pirates',
    imageUrl: Assets.thePirates,
    titleImageUrl: Assets.thePiratesTitle,
    color: Colors.red,
    rating: 2.6,
    description:
        "A pirate crew and a gang of robbers compete to capture a grey whale that has eaten a royal stamp.",
    tags: [
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Historical", tagValue: 5.5),
      ContentTag(tagName: "British", tagValue: 3.5),
      ContentTag(tagName: "Originals", tagValue: 6.5),
      ContentTag(tagName: "Caribbean", tagValue: 5.5),
      ContentTag(tagName: "Ship", tagValue: 5.0),
      ContentTag(tagName: "Pirates", tagValue: 5.5),
      ContentTag(tagName: "Action", tagValue: 4.5),
      ContentTag(tagName: "Strategy", tagValue: 4.5),
      ContentTag(tagName: "Quest", tagValue: 3.5),
      ContentTag(tagName: "Money", tagValue: 3.5),
      ContentTag(tagName: "Greed", tagValue: 3.5),
      ContentTag(tagName: "Death", tagValue: 4.0),
    ]);

Content theTenthGateContent = Content(
    name: 'The Tenth Gate',
    imageUrl: Assets.theTenthGate,
    titleImageUrl: Assets.theTenthGateTitle,
    color: Colors.red,
    rating: 2.4,
    description:
        "While looking for the last two copies of a demon scripture, a rare book merchant is lured into a demonic plot.",
    tags: [
      ContentTag(tagName: "Horror", tagValue: 5.0),
      ContentTag(tagName: "Mystery", tagValue: 3.5),
      ContentTag(tagName: "Detective", tagValue: 2.5),
      ContentTag(tagName: "USA", tagValue: 3.0),
      ContentTag(tagName: "Quest", tagValue: 3.0),
      ContentTag(tagName: "Tenth", tagValue: 3.0),
      ContentTag(tagName: "Gate", tagValue: 3.0),
      ContentTag(tagName: "American", tagValue: 3.0),
      ContentTag(tagName: "Thriller", tagValue: 5.5),
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Supernatural", tagValue: 4.5),
      ContentTag(tagName: "Friends", tagValue: 3.5),
      ContentTag(tagName: "Children", tagValue: 3.5),
      ContentTag(tagName: "Mystery", tagValue: 5.5),
      ContentTag(tagName: "Scary", tagValue: 4.0),
      ContentTag(tagName: "Ghost", tagValue: 2.0),
    ]);

Content theTimeMachineContent = Content(
    name: 'The Time Machine',
    imageUrl: Assets.theTimeMachine,
    titleImageUrl: Assets.theTimeMachineTitle,
    color: Colors.red,
    rating: 3.0,
    description:
        "In order to change the course of history, Alice, an inventor, travels 800,000 years into the future, where he discovers humanity divided into two warring species.",
    tags: [
      ContentTag(tagName: "Adventure", tagValue: 5.0),
      ContentTag(tagName: "Science Fiction", tagValue: 4.5),
      ContentTag(tagName: "Exploration", tagValue: 5.0),
      ContentTag(tagName: "American", tagValue: 3.5),
      ContentTag(tagName: "Time", tagValue: 3.0),
      ContentTag(tagName: "Machine", tagValue: 3.0),
      ContentTag(tagName: "Life", tagValue: 3.5),
      ContentTag(tagName: "Originals", tagValue: 6.5),
      ContentTag(tagName: "Futuristic", tagValue: 4.0),
      ContentTag(tagName: "Quest", tagValue: 4.0),
    ]);

Content worldWarYContent = Content(
    name: 'World War Y',
    imageUrl: Assets.worldWarY,
    titleImageUrl: Assets.worldWarYTitle,
    color: Colors.red,
    rating: 4.1,
    description:
        "Harry Lanister, a former UN staffer, travels the globe in a race against time to avert a zombie plague that is toppling armies and governments and threatening to wipe humanity out entirely.",
    tags: [
      ContentTag(tagName: "Adventure", tagValue: 4.0),
      ContentTag(tagName: "Zombie", tagValue: 6.5),
      ContentTag(tagName: "Science Fiction", tagValue: 4.5),
      ContentTag(tagName: "World", tagValue: 3),
      ContentTag(tagName: "War", tagValue: 3),
      ContentTag(tagName: "Y", tagValue: 3),
      ContentTag(tagName: "Apocalypse", tagValue: 5.5),
      ContentTag(tagName: "American", tagValue: 3.5),
      ContentTag(tagName: "Horror", tagValue: 4.5),
      ContentTag(tagName: "Scary", tagValue: 4.0),
      ContentTag(tagName: "Thriller", tagValue: 4.0),
      ContentTag(tagName: "Government", tagValue: 4.5),
      ContentTag(tagName: "Action", tagValue: 5.5),
    ]);

Content babyBossContent = Content(
    name: 'Baby Boss',
    imageUrl: Assets.babyBoss,
    titleImageUrl: Assets.babyBossTitle,
    color: Colors.red,
    rating: 3.4,
    description:
        "A boss baby with a cutting-edge strategy is going to resurrect a failing corporation and turn it into a business empire.",
    tags: [
      ContentTag(tagName: "Kids", tagValue: 6.0),
      ContentTag(tagName: "Animated", tagValue: 5.0),
      ContentTag(tagName: "Money", tagValue: 6.5),
      ContentTag(tagName: "Baby", tagValue: 3.5),
      ContentTag(tagName: "Comedy", tagValue: 5.5),
      ContentTag(tagName: "Boss", tagValue: 4.0),
    ]);

Content zForZecheranContent = Content(
    name: 'Z For Zecheran',
    imageUrl: Assets.zForZecheran,
    titleImageUrl: Assets.zForZecheranTitle,
    color: Colors.red,
    rating: 2.6,
    description:
        "Two men and a young woman find themselves in a wrecked city after a tragedy wipes away most of civilization, and they must survive and live with whatever the ruins have to give.",
    tags: [
      ContentTag(tagName: "Z", tagValue: 3.0),
      ContentTag(tagName: "Zecheran", tagValue: 3.0),
      ContentTag(tagName: "Extinction", tagValue: 3.5),
      ContentTag(tagName: "Apocalypse", tagValue: 6.0),
      ContentTag(tagName: "Survival", tagValue: 6.0),
      ContentTag(tagName: "Life", tagValue: 4.0),
      ContentTag(tagName: "Adventure", tagValue: 3.5),
      ContentTag(tagName: "Friends", tagValue: 3.5),
      ContentTag(tagName: "Originals", tagValue: 6.5),
    ]);

List<Content> allContent = [
  casinoHeistContent,
  fishGamesContent,
  underTheWaterContent,
  whereToContent,
  hazlockShomesContent,
  nightMafiaContent,
  itFollowsContent,
  ghostShipContent,
  independenceNightContent,
  starTroopersContent,
  boultContent,
  braveContent,
  bravesoulContent,
  captainMathewContent,
  cyberMatrixContent,
  excaliburContent,
  extinctionContent,
  lastRideContent,
  maggieAndFriendsContent,
  maryInWonderlandContent,
  misterDynamiteContent,
  oblivionContent,
  onwardContent,
  prochantusContent,
  rameshBakshiContent,
  rocketScienceContent,
  savingPrivateJonesContent,
  gloryPathContent,
  gravityContent,
  heartOfTheSeaContent,
  helloJaceContent,
  hideyoshiIyeshuContent,
  immortalEnginesContent,
  survivormanContent,
  theAlienContent,
  theBigThingsContent,
  theBrightSideContent,
  theForestContent,
  theLionOfWallStreetContent,
  thePiratesContent,
  theTenthGateContent,
  theTimeMachineContent,
  worldWarYContent,
  babyBossContent,
  zForZecheranContent
];

List<Content> trending = [];


List<Content> originals = [];