/obj/item/bodypart/head/hog
	icon_greyscale = 'modular_meta/features/hog/icons/bodyparts.dmi'
	limb_id = SPECIES_HOG
	is_dimorphic = FALSE
	head_flags = HEAD_LIPS|HEAD_EYESPRITES|HEAD_EYECOLOR|HEAD_EYEHOLES|HEAD_DEBRAIN
	// У взрослой свиньи 44 зуба. Из них 12 резцов, 4 клыка и 28 коренных.
	teeth_count = 44

/obj/item/bodypart/chest/hog
	icon_greyscale = 'modular_meta/features/hog/icons/bodyparts.dmi'
	is_dimorphic = TRUE
	wing_types = list(/obj/item/organ/wings/functional/dragon)

/obj/item/bodypart/arm/left/hog
	icon_greyscale = 'modular_meta/features/hog/icons/bodyparts.dmi'
	limb_id = SPECIES_HOG
	attack_type = BRUTE
	unarmed_attack_verbs = list("kick hooves")
	grappled_attack_verb = "smite"
	unarmed_attack_effect = ATTACK_EFFECT_PUNCH
	unarmed_attack_sound = 'sound/items/weapons/punch1.ogg'
	unarmed_miss_sound = 'sound/items/weapons/punchmiss.ogg'
	unarmed_damage_low = 1
	unarmed_damage_high = 2
	unarmed_effectiveness = 10

/obj/item/bodypart/arm/right/hog
	icon_greyscale = 'modular_meta/features/hog/icons/bodyparts.dmi'
	limb_id = SPECIES_HOG
	attack_type = BRUTE
	unarmed_attack_verbs = list("kick hooves")
	grappled_attack_verb = "smite"
	unarmed_attack_effect = ATTACK_EFFECT_PUNCH
	unarmed_attack_sound = 'sound/items/weapons/punch1.ogg'
	unarmed_miss_sound = 'sound/items/weapons/punchmiss.ogg'
	unarmed_damage_low = 1
	unarmed_damage_high = 2
	unarmed_effectiveness = 10

/obj/item/bodypart/leg/left/hog
	icon_greyscale = 'modular_meta/features/hog/icons/bodyparts.dmi'
	limb_id = SPECIES_HOG

/obj/item/bodypart/leg/right/hog
	icon_greyscale = 'modular_meta/features/hog/icons/bodyparts.dmi'
	limb_id = SPECIES_HOG
