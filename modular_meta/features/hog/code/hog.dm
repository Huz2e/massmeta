/datum/species/hog
	// Думаю без свиней нам здесь не обойтись, Дементий, гони свиней.
	name = "\improper Hogperson"
	plural_form = "Hogpersons"
	id = SPECIES_HOG
	inherent_traits = list(
	TRAIT_USES_SKINTONES,
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	body_markings = list(/datum/bodypart_overlay/simple/body_marking = "None")
	mutant_organs = list(
		/obj/item/organ/ears/hog = "None",
	)
	mutanttongue = /obj/item/organ/tongue/hog
	coldmod = 1.1
	heatmod = 1.2
	payday_modifier = 1.0
	species_cookie = /obj/item/food/meat/slab
	meat = /obj/item/food/meat/slab/pig
	skinned_type = /obj/item/stack/sheet/hairlesshide
	death_sound = 'modular_meta/features/hog/sound/deathsound.ogg'
	species_language_holder = /datum/language_holder/hog

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/hog,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/hog,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/hog,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/hog,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/hog,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/hog,
	)

/datum/species/hog/get_scream_sound(mob/living/carbon/human/hog)
	return pick(
		'modular_meta/features/hog/sound/scream1.ogg',
		'modular_meta/features/hog/sound/scream2.ogg',
		'modular_meta/features/hog/sound/scream3.ogg',
	)

/datum/species/hog/get_cough_sound(mob/living/carbon/human/hog)
	if(hog.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)


/datum/species/hog/get_cry_sound(mob/living/carbon/human/hog)
	if(hog.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/hog/get_sneeze_sound(mob/living/carbon/human/hog)
	if(hog.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'

/datum/species/hog/get_laugh_sound(mob/living/carbon/human/hog)
	return 'modular_meta/features/hog/sound/oink1.ogg'

/datum/species/hog/get_sigh_sound(mob/living/carbon/human/hog)
	if(hog.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/hog/get_sniff_sound(mob/living/carbon/human/hog)
	if(hog.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/hog/get_snore_sound(mob/living/carbon/human/hog)
	if(hog.physique == FEMALE)
		return SFX_SNORE_FEMALE
	return SFX_SNORE_MALE

/datum/species/hog/get_physical_attributes()
	return "Human pigs are similar to humans, but less resistant to heat and cold, even a fat reserve does not save."

/datum/species/hog/get_species_description()
	return "People who grunt, as well as there are heels."

/datum/species/hog/get_species_lore()
	return list(
		"These pigs are not simple stories.",

 		"Previously, this race was ordinary pigs, but a gene mutation changed them and turned them into intelligent pigs. \
		They developed and multiplied in the laboratory and learned their language. \
		After that, they began to understand the general Galactic language, and then after some time they started working for scientists. \
 		After a couple of years they were released, some just wanted to live a peaceful life together, and some worked.",

 		"They almost didn't have their own technology, but representatives of this race have an average 69 IQ. \
		But employees of large corporations, and especially heads, undergo IQ tests, so not everyone will be able to take such positions.",

 		"During the existence of humanoid pigs, one significant corporation has appeared \"Hryak inc.\" \
 		It produces household goods and artificial pigs, as well as accessories for them. \
		There are rumors that their employees are being hired by enemy organizations.",
	)


/datum/emote/living/hog
	mob_type_allowed_typecache = /mob/living/carbon/human/species/hog
	mob_type_blacklist_typecache = list()

/datum/emote/living/hog/oink
	key = "oink"
	key_third_person = "oinks"
	message = "oinks!"
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	vary = TRUE
/datum/emote/living/carbon/oink/get_sound(mob/living/user)
	return pick(
		'modular_meta/features/hog/sound/oink1.ogg',
		'modular_meta/features/hog/sound/oink2.ogg',
		'modular_meta/features/hog/sound/oink3.ogg',
	)
