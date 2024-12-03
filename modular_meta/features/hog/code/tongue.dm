/obj/item/organ/tongue/hog
	name = "Pig tongue"
	desc = "Just a pig tongue"
	icon_state = "tongue"
	taste_sensitivity = 2
	modifies_speech = FALSE
	languages_native = list(/datum/language/pig)
	liked_foodtypes = RAW | FRUIT | NUTS

/obj/item/organ/tongue/hog/get_possible_languages()
	return ..() + /datum/language/pig
