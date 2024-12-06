/datum/language/pig
	name = "Pig"
	desc = "Свинский язык, буквально."
	key = "pig"
	syllables = list("oink","OInk","hrya","hrYA","hrr","hrrr")
	default_priority = 10
	default_name_syllable_min = 1
	default_name_syllable_max = 4

	icon = 'icons/ui/chat/language.dmi'
	icon_state = "pig"

/datum/language_holder/hog
	understood_languages = list(
		/datum/language/common = list(LANGUAGE_ATOM),
		/datum/language/pig = list(LANGUAGE_ATOM),
	)
	spoken_languages = list(
		/datum/language/common = list(LANGUAGE_ATOM),
		/datum/language/pig = list(LANGUAGE_ATOM),
	)
