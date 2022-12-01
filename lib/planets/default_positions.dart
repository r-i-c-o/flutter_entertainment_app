import 'package:tarot/planets/planet_position.dart';

// MAIN SCREEN
const PlanetOffset main_1 = PlanetOffset(
  bottom: -40.0,
  right: -70.0,
);
const PlanetOffset main_2 = PlanetOffset(
  top: -50.0,
  left: -80.0,
);
// PAYWALL
const PlanetOffset paywall_1 = main_1;
const PlanetOffset paywall_2 = main_2;

// CARD OF DAY
const PlanetOffset cardOfDay_1 = PlanetOffset(
  top: -100.0,
  right: -126.0,
);
const PlanetOffset cardOfDay_2 = PlanetOffset(
  left: -77.0,
  bottom: -56.0,
);

// CARD DESCRIPTION
const PlanetOffset description_1 = PlanetOffset(
  top: -100.0,
  left: -126.0,
);
const PlanetOffset description_2 = PlanetOffset(
  bottom: 68.0,
  right: -107.0,
);

// CHOOSE SPREAD
const PlanetOffset spreads_1 = PlanetOffset.anchored(
  topAnchor: 0.5,
  bottom: -180.0,
  left: 0.0,
  right: -112.0,
);
const PlanetOffset spreads_2 = PlanetOffset(
  top: -113.0,
  right: -107.0,
);

//READING
const PlanetOffset reading_1 = PlanetOffset(
  bottom: 137.0,
  right: -162.0,
);
const PlanetOffset reading_2 = PlanetOffset(
  top: -100.0,
  left: -162.0,
);

//SETTINGS
const PlanetOffset settings_1 = PlanetOffset(
  left: -92.0,
  bottom: -40.0,
);
const PlanetOffset settings_2 = PlanetOffset(
  top: -210.0,
  right: -139.0,
);

//HANDBOOK PAGES
const PlanetOffset handbook_1 = PlanetOffset(
  right: -162.0,
  bottom: 207.0,
);
const PlanetOffset handbook_2 = PlanetOffset(
  left: -162.0,
  top: -100.0,
);
//JOURNAL LIST
const PlanetOffset journalList_1 = spreads_1;
const PlanetOffset journalList_2 = spreads_2;

// JOURNAL
const PlanetOffset journal_1 = cardOfDay_1;
const PlanetOffset journal_2 = cardOfDay_2;
