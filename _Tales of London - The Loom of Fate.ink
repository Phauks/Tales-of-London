# author: Phauks
# title: Tales of London - The Loom of Fate
# version: 0.7.0

/*
Built on:
Inky:   0.15.1-beta
Ink:    1.1.1
Inkjs:  2.2.2

Considerations will be made for moving to the Calico fork; however, any move to a different engine off of Base Ink will make any migration to GoDot or Unity much more difficult.
Still haven't decided if this project will end once base game is complete; honestly depends on community support. If it is forgotten, at least I got to make something cool and I can use this skills on an original game in the future.
*/

- (file_import)
INCLUDE events\events_auto.ink
INCLUDE events\event_auto_hub.ink
INCLUDE events\events_random.ink
INCLUDE events\event_random_hub.ink
INCLUDE hubs\free_roam.ink
INCLUDE functions.ink
INCLUDE hubs\irem.ink
INCLUDE locations\location_hinterland.ink
INCLUDE locations\location_london.ink
INCLUDE locations\location_parabola.ink
INCLUDE locations\location_zee.ink
INCLUDE quests\stats_advanced.ink
INCLUDE quests\stats_destructive.ink
INCLUDE quests\stats_main.ink
INCLUDE hubs\tales_hub.ink
INCLUDE hubs\your_lodgings.ink

// Tales
INCLUDE tales\christmas_past.ink
INCLUDE tales\christmas_present.ink



- (reset_variables)
// Main Stats
VAR player_dangerous = 0
VAR player_persuasive = 0
VAR player_shadowy = 0
VAR player_watchful = 0

// Advanced Stats
VAR player_anatomy = 0
VAR player_artisan = 0
VAR player_chess = 0
VAR player_glasswork = 0
VAR player_mithridacy = 0
VAR player_shapeling = 0
VAR player_toxicology = 0
VAR player_zeefaring = 0

// Destructive Advanced Stats
VAR player_smen = 0
VAR player_smen_candle_lit = 0
VAR player_discordance = 0
VAR event_gains_discordance = 0

// Timing Variables
VAR total_actions_count = 0
VAR actions_per_week = 2
VAR action_count = 0
VAR timer_week = 1
VAR timer_month = 1

// Auto Fire Events
VAR event_posi = false
VAR discovered_hinterlands = false
VAR discovered_adulterine_castle = false

VAR event_gains_dangerous = 0
VAR event_gains_persuasive = 0
VAR event_gains_shadowy = 0
VAR event_gains_watchful = 0

VAR event_gains_anatomy = 0
VAR event_gains_artisan = 0
VAR event_gains_chess = 0
VAR event_gains_glasswork = 0
VAR event_gains_mithridacy = 0
VAR event_gains_shapeling = 0
VAR event_gains_toxicology = 0
VAR event_gains_zeefaring = 0

// Random Events Lists
LIST random_event_rare = Event_Null_Rare
LIST random_event_unusual = Event_Null_Unusual
LIST random_event_standard = Event_001, Event_002, Event_003, Event_004, Event_005, Event_006, Event_007, Event_008, Event_009, Event_010, Event_The_Infinite_Void
LIST random_event_frequent = Event_Null_Frequent

// Opportunity Deck Variables
VAR chosen_01_rarity = 0
VAR chosen_01 = 0
VAR chosen_02_rarity = 0
VAR chosen_02 = 0
VAR chosen_03_rarity = 0
VAR chosen_03 = 0
VAR chosen_04_rarity = 0
VAR chosen_04 = 0
VAR chosen_05_rarity = 0
VAR chosen_05 = 0
VAR chosen_06_rarity = 0
VAR chosen_06 = 0
VAR chosen_07_rarity = 0
VAR chosen_07 = 0


// Activate All Random Events. May have to change this if we only want to enable certain non-auto-fire events after parameters are met.
~ random_event_rare = LIST_ALL(random_event_rare)
~ random_event_unusual = LIST_ALL(random_event_unusual)
~ random_event_standard = LIST_ALL(random_event_standard)
~ random_event_frequent = LIST_ALL(random_event_frequent)

// Other
VAR airs_of_london = 1 // randomized on dawn of a new day
VAR player_lodging_size = 0 // size of opportunity deck
VAR pursuing_an_exceptional_tale = false // used so only one ET occurs at a time.

// Irem
VAR the_loom_set = 0 // the chosen future of Irem

// Debug
VAR debug_mode = false
VAR debug_events_enabled = true // disabling this will disable Opportunity and Auto-fire Deck activation on start of day

- (quirks)

VAR player_quirk_austere = 0
VAR player_quirk_daring = 0
VAR player_quirk_foreceful = 0
VAR player_quirk_heartless = 0
VAR player_quirk_hedonist = 0
VAR player_quirk_magnanimous = 0
VAR player_quirk_melancholy = 0
VAR player_quirk_ruthless = 0
VAR player_quirk_steadfast = 0
VAR player_quirk_subtle = 0

- (inventory)

// Inventory Items
VAR player_item_box_empty = 0
VAR player_item_box_apocyan = 0
VAR player_item_box_cosmogone = 0
VAR player_item_box_gant = 0
VAR player_item_box_irrigo = 0
VAR player_item_box_peligin = 0
VAR player_item_box_violant = 0
VAR player_item_box_viric = 0

VAR player_item_breath_void = 0
VAR player_item_masters_blood = 0
VAR player_item_reported_location = 0
VAR player_item_impossible_theorem = 0
VAR player_item_veils_velvet = 0
VAR player_item_rumourmongers_network = 0
VAR player_item_fluke_core = 0
VAR player_item_tasting_flight = 0

VAR player_item_weeping_scars = 0
VAR player_item_stained_soul = 0
VAR player_item_memory_of_chains = 0
VAR player_item_candle_arthur = 0
VAR player_item_candle_beau = 0
VAR player_item_candle_cerise = 0
VAR player_item_candle_destin = 0
VAR player_item_candle_erzulie = 0
VAR player_item_candle_fortigan = 0
VAR player_item_candle_gawain = 0
VAR player_smen_reckoning = 0


-> irem.opening_act // prologue of story
//->  your_lodgings // skip prologue for access to main area.


// CONTENT
TODO finish christmas episode

// KNOWN BUGS / ENGINE CHANGES

// EVENT CHANGES
TODO better cohesion of advanced and main stat gains
TODO Add more Events (52 necessary for no repetition)
TODO Endings

/*
Potential Framework
Main        Adv.        Adv.
Dangerous   A           B
Persuasive  A           B
Shadowy     A           B
Watchful    A           B
    Hinterland and A5/B5 Unlocks A6/B6 (2)
AB6 Unlocks 215 (1)
215 Unlocks AB7 (2)
AB7 Unlocks 230 (1)
*/

// Future Ideas
TODO Quirks, connect to variable text on main stat lines?
TODO Implement Music
TODO Implement Images
TODO Background


// Beyond Ink

TODO Free Roam Mode. I could do it in Ink. But FL has a map based system that makes it easy to have twenty plus options on the screen. with just text it would be word-vomit.