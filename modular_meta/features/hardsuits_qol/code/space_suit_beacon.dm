/obj/item/choice_beacon/space_suit
	name = "space suit delivery beacon"
	desc = "Summon your space suit."
	icon = 'modular_meta/features/hardsuits_qol/icons/device.dmi'
	icon_state = "suit_delivery"
	w_class = WEIGHT_CLASS_BULKY // No pocket hard or mod suit

	/// Additional magboots only for engi, atmos and CE suits
	var/extra_magboots = FALSE
	/// Additional jetpack
	var/extra_jetpack = FALSE

/obj/item/choice_beacon/space_suit/spawn_option(obj/choice_path, mob/living/user)
	// if hardsuit has extra magboots or jetpack - we delliver it too
	if(ispath(choice_path, /obj/item/clothing/suit/space/hardsuit))
		var/hardsuit_kit = list(choice_path)
		if (extra_magboots)
			hardsuit_kit += /obj/item/clothing/shoes/magboots
		if (extra_jetpack)
			hardsuit_kit += /obj/item/tank/jetpack/carbondioxide

		podspawn(list(
			"target" = get_turf(src),
			"style" = /datum/pod_style/advanced,
			"spawn" = hardsuit_kit,
		))
		return

	// or just spawn only hardsuit
	. = ..()

///////// Commands choice beacons ///////////

/obj/item/choice_beacon/space_suit/captain

/obj/item/choice_beacon/space_suit/captain/generate_display_names()
	var/static/list/captain_suits
	if(!captain_suits)
		captain_suits = list()
		var/list/possible_captain_suits = list(
			/obj/item/clothing/suit/space/hardsuit/swat/captain,
			/obj/item/mod/control/pre_equipped/magnate,
		)
		for(var/obj/item/suit as anything in possible_captain_suits)
			captain_suits[initial(suit.name)] = suit
	return captain_suits

///////// Engineers choice beacons ///////////

/obj/item/choice_beacon/space_suit/ce
	// CE already has his magboots
	extra_jetpack = TRUE

/obj/item/choice_beacon/space_suit/ce/generate_display_names()
	var/static/list/ce_suits
	if(!ce_suits)
		ce_suits = list()
		var/list/possible_ce_suits = list(
			/obj/item/clothing/suit/space/hardsuit/engine/elite,
			/obj/item/mod/control/pre_equipped/advanced,
		)
		for(var/obj/item/suit as anything in possible_ce_suits)
			ce_suits[initial(suit.name)] = suit
	return ce_suits

/obj/item/choice_beacon/space_suit/engineering
	extra_magboots = TRUE

/obj/item/choice_beacon/space_suit/engineering/generate_display_names()
	var/static/list/engineering_suits
	if(!engineering_suits)
		engineering_suits = list()
		var/list/possible_engineering_suits = list(
			/obj/item/clothing/suit/space/hardsuit/engine,
			/obj/item/mod/control/pre_equipped/engineering,
		)
		for(var/obj/item/suit as anything in possible_engineering_suits)
			engineering_suits[initial(suit.name)] = suit
	return engineering_suits

/obj/item/choice_beacon/space_suit/atmos
	extra_magboots = TRUE

/obj/item/choice_beacon/space_suit/atmos/generate_display_names()
	var/static/list/atmos_suits
	if(!atmos_suits)
		atmos_suits = list()
		var/list/possible_atmos_suits = list(
			/obj/item/clothing/suit/space/hardsuit/atmos,
			/obj/item/mod/control/pre_equipped/atmospheric,
		)
		for(var/obj/item/suit as anything in possible_atmos_suits)
			atmos_suits[initial(suit.name)] = suit
	return atmos_suits

///////// Sexqurity choice beacons ///////////

/obj/item/choice_beacon/space_suit/hos
	extra_jetpack = TRUE

/obj/item/choice_beacon/space_suit/hos/generate_display_names()
	var/static/list/hos_suits
	if(!hos_suits)
		hos_suits = list()
		var/list/possible_hos_suits = list(
			/obj/item/clothing/suit/space/hardsuit/security/hos,
			/obj/item/mod/control/pre_equipped/safeguard,
		)
		for(var/obj/item/suit as anything in possible_hos_suits)
			hos_suits[initial(suit.name)] = suit
	return hos_suits

/obj/item/choice_beacon/space_suit/security

/obj/item/choice_beacon/space_suit/security/generate_display_names()
	var/static/list/security_suits
	if(!security_suits)
		security_suits = list()
		var/list/possible_security_suits = list(
			/obj/item/clothing/suit/space/hardsuit/security,
			/obj/item/mod/control/pre_equipped/security,
		)
		for(var/obj/item/suit as anything in possible_security_suits)
			security_suits[initial(suit.name)] = suit
	return security_suits

///////// Mining choice beacons /////////// do we acctualy have it?

/obj/item/choice_beacon/space_suit/mining

/obj/item/choice_beacon/space_suit/mining/generate_display_names()
	var/static/list/mining_suits
	if(!mining_suits)
		mining_suits = list()
		var/list/possible_mining_suits = list(
			/obj/item/clothing/suit/space/hardsuit/mining,
			/obj/item/mod/control/pre_equipped/mining,
		)
		for(var/obj/item/suit as anything in possible_mining_suits)
			mining_suits[initial(suit.name)] = suit
	return mining_suits

///////// Medical choice beacons ///////////

/obj/item/choice_beacon/space_suit/med

/obj/item/choice_beacon/space_suit/med/generate_display_names()
	var/static/list/med_suits
	if(!med_suits)
		med_suits = list()
		var/list/possible_med_suits = list(
			/obj/item/clothing/suit/space/hardsuit/med,
			/obj/item/mod/control/pre_equipped/rescue,
		)
		for(var/obj/item/suit as anything in possible_med_suits)
			med_suits[initial(suit.name)] = suit
	return med_suits

// NO BEACON FOR ORDINARY MED SUIT!!!

///////// Science choice beacons ///////////

/obj/item/choice_beacon/space_suit/rd

/obj/item/choice_beacon/space_suit/rd/generate_display_names()
	var/static/list/rd_suits
	if(!rd_suits)
		rd_suits = list()
		var/list/possible_rd_suits = list(
			/obj/item/clothing/suit/space/hardsuit/rd,
			/obj/item/mod/control/pre_equipped/research,
		)
		for(var/obj/item/suit as anything in possible_rd_suits)
			rd_suits[initial(suit.name)] = suit
	return rd_suits

///////// CLOWN choice beacon ///////////

/obj/item/choice_beacon/space_suit/clown
	w_class = WEIGHT_CLASS_NORMAL // maybe must be bigger?

/obj/item/choice_beacon/space_suit/clown/generate_display_names()
	var/static/list/clown_suits
	if(!clown_suits)
		clown_suits = list()
		var/list/possible_clown_suits = list(
			/obj/item/clothing/suit/space/hardsuit/clown,
			/obj/item/mod/control/pre_equipped/cosmohonk,
		)
		for(var/obj/item/suit as anything in possible_clown_suits)
			clown_suits[initial(suit.name)] = suit
	return clown_suits

// NO BEACON FOR MIME SUIT!!!

///////// Syndicate choice beacons ///////////

/obj/item/choice_beacon/space_suit/syndi
	extra_magboots = TRUE
	extra_jetpack = TRUE

/obj/item/choice_beacon/space_suit/syndi/generate_display_names()
	var/static/list/syndi_suits
	if(!syndi_suits)
		syndi_suits = list()
		var/list/possible_syndi_suits = list(
			/obj/item/clothing/suit/space/hardsuit/syndi,
			/obj/item/mod/control/pre_equipped/nuclear,
		)
		for(var/obj/item/suit as anything in possible_syndi_suits)
			syndi_suits[initial(suit.name)] = suit
	return syndi_suits
