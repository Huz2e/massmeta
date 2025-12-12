/mob/living/basic/bot/buttbot
	name = "\improper buttbot"
	desc = "butts"
	icon = 'modular_meta/features/butt_farts/icons/butts.dmi'
	icon_state = "buttbot"
	density = FALSE
	anchored = FALSE
	health = 25
	maxHealth = 25
	bot_type = BUTT_BOT
	pass_flags = PASSMOB
	var/cooling_down = FALSE
	var/butt_probability = 15
	var/listen_probability = 30

//Buttbot Production
/obj/item/organ/internal/butt/attackby(obj/item/I, mob/living/user)
	if(istype(I, /obj/item/bodypart/arm/left/robot) || istype(I, /obj/item/bodypart/arm/right/robot))
		var/mob/living/basic/bot/buttbot/new_butt = new(get_turf(src))
		qdel(I)
		switch(src.type) //A BUTTBOT FOR EVERYONE!
			if(/obj/item/organ/internal/butt/atomic)
				new_butt.name = "Atomic Buttbot"
				new_butt.desc = "Science has gone too far."
				new_butt.icon_state = "buttbot_atomic"
			if(/obj/item/organ/internal/butt/bluespace)
				new_butt.name = "Bluespace Buttbot"
				new_butt.desc = "The peak of Nanotrasen design."
				new_butt.icon_state = "buttbot_bluespace"
			if(/obj/item/organ/internal/butt/clown)
				new_butt.name = "Bananium Buttbot"
				new_butt.desc = "Didn't you know clown asses were made out of Bananium?"
				new_butt.icon_state = "buttbot_clown"
				new_butt.AddComponent(/datum/component/slippery, 40)
			if(/obj/item/organ/internal/butt/cyber)
				new_butt.name = "Cybernetic Buttbot"
				new_butt.desc = "LAW ONE: BUTT"
				new_butt.icon_state = "buttbot_cyber"
			if(/obj/item/organ/internal/butt/iron)
				new_butt.name = "Iron Buttbot"
				new_butt.desc = "We can rebutt him, we have the technology."
				new_butt.icon_state = "buttbot_iron"
			if(/obj/item/organ/internal/butt/plasma)
				new_butt.name = "Plasma Buttbot"
				new_butt.desc = "Safer here than on it's owner."
				new_butt.icon_state = "buttbot_plasma"
			if(/obj/item/organ/internal/butt/skeletal)
				new_butt.name = "Skeletal Buttbot"
				new_butt.desc = "Rattle Me Booty!"
				new_butt.icon_state = "buttbot_skeleton"
			if(/obj/item/organ/internal/butt/xeno)
				new_butt.name = "Xenomorph Buttbot"
				new_butt.desc = "hiss!"
				new_butt.icon_state = "buttbot_xeno"

		playsound(src, pick(
			'modular_meta/features/butt_farts/sound/farts/fart1.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart2.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart3.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart4.ogg',
			), 25 ,use_reverb = TRUE, channel = CHANNEL_FART_SOUNDS)
		qdel(src)

/mob/living/basic/bot/buttbot/emag_act(mob/user)
	if(!(bot_access_flags & BOT_COVER_EMAGGED))
		visible_message("<span class='warning'>[user] swipes a card through the [src]'s crack!</span>", "<span class='notice'>You swipe a card through the [src]'s crack.</span>")
		listen_probability = 75
		butt_probability = 30
		bot_access_flags |= BOT_COVER_EMAGGED
		var/turf/butt = get_turf(src)
		butt.atmos_spawn_air("miasma=5;TEMP=310.15")
		playsound(src, pick(
			'modular_meta/features/butt_farts/sound/farts/fart1.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart2.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart3.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart4.ogg',
			), 100 ,use_reverb = TRUE, channel = CHANNEL_FART_SOUNDS)

/mob/living/basic/bot/buttbot/Hear(message, atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, list/message_mods, message_range)
	. = ..()
	if(!cooling_down && prob(listen_probability) && ishuman(speaker))
		cooling_down = TRUE
		var/list/split_message = splittext(raw_message, " ")
		for (var/i in 1 to length(split_message))
			if(prob(butt_probability))
				split_message[i] = pick("butt", "butts")
		if((bot_access_flags & BOT_COVER_EMAGGED))
			var/turf/butt = get_turf(src)
			butt.atmos_spawn_air("miasma=5;TEMP=310.15")
		var/joined_text = jointext(split_message, " ")
		if(!findtext(joined_text, "butt")) //We must butt, or else.
			cooling_down = FALSE
			return
		say(joined_text)
		playsound(src, pick(
			'modular_meta/features/butt_farts/sound/farts/fart1.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart2.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart3.ogg',
			'modular_meta/features/butt_farts/sound/farts/fart4.ogg',
			), 100 ,use_reverb = TRUE, channel = CHANNEL_FART_SOUNDS)
		spawn(20)
			cooling_down = FALSE
