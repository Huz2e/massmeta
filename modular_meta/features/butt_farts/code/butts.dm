/obj/item/organ/internal/butt
	name = "butt"
	desc = "extremely treasured body part"
	worn_icon = 'modular_meta/features/butt_farts/icons/worn_butts.dmi' //Wearable on the head
	icon = 'modular_meta/features/butt_farts/icons/butts.dmi'
	icon_state = "ass"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_BUTT
	throw_speed = 1
	force = 4
	embed_type = /datum/embedding/butt
	hitsound = 'modular_meta/features/butt_farts/sound/farts/fart1.ogg'
	body_parts_covered = HEAD
	slot_flags = ITEM_SLOT_HEAD
	var/list/sound_effect  = list(
		'modular_meta/features/butt_farts/sound/farts/fart1.ogg',
		'modular_meta/features/butt_farts/sound/farts/fart2.ogg',
		'modular_meta/features/butt_farts/sound/farts/fart3.ogg',
		'modular_meta/features/butt_farts/sound/farts/fart4.ogg'
		)
	var/atmos_gas = "miasma=0.25;TEMP=310.15" //310.15 is body temperature (TODO сделать зависимость от core temp)
	var/fart_instability = 1 //Percent chance to lose your rear each fart.
	var/cooling_down = FALSE


/datum/embedding/butt
	pain_mult = 0
	jostle_pain_mult = 0
	ignore_throwspeed_threshold = TRUE
	embed_chance = 20

//ADMIN ONLY ATOMIC ASS
/obj/item/organ/internal/butt/atomic
	name = "Atomic Ass"
	desc = "A highly radioactive and unstable posterior. Anyone with this is a walking war crime."
	sound_effect = list(
		"sound/items/geiger/low1.ogg",
		"sound/items/geiger/low2.ogg",
		"sound/items/geiger/low3.ogg",
		"sound/items/geiger/low4.ogg"
		)
	fart_instability = 5
	atmos_gas = "tritium=5;TEMP=600"
	icon_state = "atomicass"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/organ/internal/butt/atomic/On_Fart(mob/user)
	var/mob/living/carbon/human/Person = user
	var/turf/Location = get_turf(user)

	if(!cooling_down)
		cooling_down = TRUE
		user.audible_message("[user] <font color='green'>farts.</font>")
		if(prob(fart_instability))
			playsound(user, "sound/machines/alarm.ogg", 100, FALSE, 50, ignore_walls=TRUE, channel = CHANNEL_FART_SOUNDS)
			minor_announce("The detonation of a nuclear posterior has been detected in your area. All crew are required to exit the blast radius.", "Nanotrasen Atomics", 0)
			Person.Paralyze(120)
			Person.electrocution_animation(120)
			spawn(120)
				Location = get_turf(user)
				dyn_explosion(Location, 20,10)
				cooling_down = FALSE
		else
			playsound(user, pick(sound_effect), 50, TRUE, channel = CHANNEL_FART_SOUNDS)
			Location.atmos_spawn_air(atmos_gas)
			spawn(20)
				cooling_down = FALSE
	//Do NOT call parent on this.
	//Unique functionality.

//BLUESPACE ASS
/obj/item/organ/internal/butt/bluespace
	name = "Bluespace Posterior"
	desc = "Science isn't about why, it's about why not!"
	fart_instability = 6
	atmos_gas = "water_vapor=0.75;TEMP=50"
	icon_state = "blueass"

//IPC ASS
/obj/item/organ/internal/butt/cyber
	name = "Flatulence Simulator"
	desc = "Designed from the ground up to create advanced humor."
	icon_state = "roboass"
	sound_effect = list(
		'sound/machines/buzz/buzz-sigh.ogg',
		'sound/machines/buzz/buzz-two.ogg',
		'sound/machines/terminal/terminal_error.ogg',
		'sound/items/weapons/ring.ogg'
		)
	atmos_gas = "co2=0.25;TEMP=310.15"

//CLOWN ASS
/obj/item/organ/internal/butt/clown
	name = "Clown Butt"
	desc = "A poor clown has been separated with their most funny organ."
	fart_instability = 3
	atmos_gas = "n2o=0.25;TEMP=310.15"
	icon_state = "clownass"
	sound_effect = list('sound/items/party_horn.ogg', 'sound/items/bikehorn.ogg')

/obj/item/organ/internal/butt/clown/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/slippery, 40)

/obj/item/organ/internal/butt/clown/On_Fart(mob/user)
	if(!cooling_down)
		var/turf/Location = get_turf(user)
		if(!locate(/obj/effect/decal/cleanable/confetti) in Location)
			new /obj/effect/decal/cleanable/confetti(Location)
	..()

//PROSTHETIC ASS
/obj/item/organ/internal/butt/iron
	name = "The Iron Butt"
	desc = "A prosthetic replacement posterior."
	icon_state = "ironass"
	sound_effect = list('sound/machines/clockcult/integration_cog_install.ogg', 'sound/effects/clang.ogg')

//SKELETAL ASS
/obj/item/organ/internal/butt/skeletal
	name = "Skeletal Butt"
	desc = "You don't understand how this works!"
	atmos_gas = "o2=0.25;TEMP=310.15"
	sound_effect = list("modular_meta/features/butt_farts/sound/skeleton_laugh.ogg")
	icon_state =  "skeleass"

//PLASMAMAN ASS
/obj/item/organ/internal/butt/plasma
	name = "Plasmaman Butt"
	desc = "You REALLY don't understand how this works!"
	sound_effect = list("modular_meta/features/butt_farts/sound/skeleton_laugh.ogg")
	fart_instability = 5
	atmos_gas = "plasma=0.25;TEMP=310.15"
	icon_state = "plasmaass"

/obj/item/organ/internal/butt/plasma/On_Fart(mob/user)
	if(prob(15) && !cooling_down)
		user.visible_message("<span class='danger'>[user]'s gas catches fire!</span>")
		var/turf/Location = get_turf(user)
		new /obj/effect/hotspot(Location)
	..()

//XENOMORPH ASS
/obj/item/organ/internal/butt/xeno
	name = "Xenomorph Butt"
	desc = "Truly, the trophy of champions."
	icon_state = "xenoass"

//IMMOVABLE ASS (TODO: сделать как смешной аналог ивента с палкой)
/obj/effect/immovablerod/butt
	name = "immovable butt"
	desc = "No, really, what the fuck is that?"
	icon = 'modular_meta/features/butt_farts/icons/butts.dmi'
	icon_state = "ass"

/obj/effect/immovablerod/butt/Initialize(mapload)
	. = ..()
	src.SpinAnimation(5, -1)

/obj/effect/immovablerod/butt/Bump(atom/clong)
	playsound(src,'modular_meta/features/butt_farts/sound/farts/fart1.ogg', 100, TRUE, 10, pressure_affected = FALSE)
	..()

//ACTUAL FART PROC
/obj/item/organ/internal/butt/proc/On_Fart(mob/user)
	//VARIABLE HANDLING
	var/turf/Location = get_turf(user)
	var/mob/living/carbon/human/Person = user //We know they are human already, it was in the emote check.
	var/volume = 40
	var/true_instability = fart_instability

	//TRAIT CHECKS
	if(Person.has_quirk(/datum/quirk/loud_ass))
		volume = volume*2
	if(Person.has_quirk(/datum/quirk/unstable_ass))
		true_instability = true_instability*2
	if(Person.has_quirk(/datum/quirk/stable_ass))
		true_instability = true_instability/2

	//BIBLEFART
	//This goes above all else because it's an instagib.
	for(var/obj/item/book/bible/Holy in Location)
		if(Holy)
			cooling_down = TRUE
			var/turf/T = get_step(get_step(Person, NORTH), NORTH)
			T.Beam(Person, icon_state="lightning[rand(1,12)]", time = 15)
			Person.Paralyze(15)
			Person.visible_message("<span class='warning'>[Person] attempts to fart on the [Holy], uh oh.<span>","<span class='ratvar'>What a grand and intoxicating innocence. Perish.</span>")
			playsound(user,'sound/effects/magic/lightningshock.ogg', 50, 1)
			playsound(user,	'modular_meta/features/butt_farts/sound/farts/dagothgod.ogg', 80)
			Person.electrocution_animation(15)
			spawn(15)
				Person.gib()
				dyn_explosion(Location, 1, 0)
				cooling_down = FALSE
			return

	//EMOTE MESSAGE/MOB TARGETED FARTS
	var/hit_target = FALSE
	for(var/mob/living/Targeted in Location)
		if(Targeted != user)
			user.visible_message("[user] [pick(
										"farts in [Targeted]'s face!",
										"gives [Targeted] the silent but deadly treatment!",
										"rips mad ass in [Targeted]'s mug!",
										"releases the musical fruits of labor onto [Targeted]!",
										"commits an act of butthole bioterror all over [Targeted]!",
										"poots, singing [Targeted]'s eyebrows!",
										"humiliates [Targeted] like never before!",
										"gets real close to [Targeted]'s face and cuts the cheese!")]")
			hit_target = TRUE
			break
	if(!hit_target)
		user.audible_message("[pick(world.file2list("modular_meta/features/butt_farts/strings/farts.txt"))]", audible_message_flags = list(CHATMESSAGE_EMOTE = TRUE))


	//SOUND HANDLING
	playsound(user, pick(sound_effect), volume , use_reverb = TRUE, pressure_affected = FALSE)

	//GAS CREATION, ASS DETACHMENT & COOLDOWNS
	if(!cooling_down)
		cooling_down = TRUE
		user.newtonian_move(user.dir)
		Location.atmos_spawn_air(atmos_gas)
		if(prob(true_instability))
			user.visible_message("<span class='warning'>[user]'s butt goes flying off!</span>")
			new /obj/effect/decal/cleanable/blood(Location)
			user.nutrition = max(user.nutrition - rand(5, 20), NUTRITION_LEVEL_STARVING)
			src.Remove(user)
			src.forceMove(Location)
			for(var/mob/living/Struck in Location)
				if(Struck != user)
					user.visible_message("<span class='danger'>[Struck] is struck in the face by [user]'s flying ass!</span>")
					Struck.apply_damage(10, "brute", BODY_ZONE_HEAD)
					cooling_down = FALSE
					return

		spawn(15)
			cooling_down = FALSE
