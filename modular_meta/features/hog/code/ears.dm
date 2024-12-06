/obj/item/organ/ears/hog
	name = "hog ears"
	icon = 'modular_meta/features/hog/icons/hog_mics.dmi'
	icon_state = "m_ears"
	visual = TRUE
	damage_multiplier = 0.5

	bodypart_overlay = /datum/bodypart_overlay/ears/hog

/datum/bodypart_overlay/ears/hog
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

	var/inner_layer = EXTERNAL_FRONT

/datum/bodypart_overlay/ears/hog/can_draw_on_bodypart(mob/living/carbon/human/human)
	if((human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return FALSE
	return TRUE

/datum/bodypart_overlay/ears/hog/get_image(image_layer, obj/item/bodypart/limb)
	var/mutable_appearance/base_ears = ..()

	if(image_layer != bitflag_to_layer(inner_layer))
		return base_ears
