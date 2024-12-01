/datum/preference/choiced/hog_ears
	savefile_key = "hog_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_external_organ = /obj/item/organ/ears/hog
	can_randomize = FALSE

/datum/preference/choiced/hog_ears/init_possible_values()
	return assoc_to_keys_features(SSaccessories.ears_list)

/datum/preference/choiced/hog_ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ears"] = value

/datum/preference/choiced/hog_ears/create_default_value()
	return /datum/sprite_accessory/ears/hog::name
