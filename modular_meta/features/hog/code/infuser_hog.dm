/datum/infuser_entry/hog
	name = "Hog"
	infuse_mob_name = "hog"
	desc = "Mix human and piggy to get Hogperson. Too easy"
	threshold_desc = DNA_INFUSION_NO_THRESHOLD
	qualities = list(
		"he can oink",
		"he have hooves instead feet",
		"he have pig ears and piglet",
	)
	input_obj_or_mob = list(
		/mob/living/basic/pig,
	)
	output_organs = list(
		/obj/item/organ/ears/hog,
	)
	infusion_desc = "pork"
	tier = DNA_MUTANT_TIER_ZERO
