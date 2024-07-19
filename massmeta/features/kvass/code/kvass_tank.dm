// A kvass Tank, full of fresh and healthy kvass
// You can buy and also sell it!

// code/modules/reagents/reagent_dispenser.dm
/obj/structure/reagent_dispensers/kvasstank
	name = "kvass tank"
	desc = "Yellow barrel full of divine liquid."
	icon = 'massmeta/features/kvass/icons/chemical_tanks.dmi'
	icon_state = "kvass"
	reagent_id = /datum/reagent/consumable/kvass
	openable = TRUE
	climbable = TRUE

// code/modules/cargo/packs/materials.dm
/datum/supply_pack/materials/kvasstank
	name = "Kvass Tank Crate"
	desc = "Contains a yellow barrel full of kvass."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/structure/reagent_dispensers/kvasstank)
	crate_name = "kvass tank crate"
	crate_type = /obj/structure/closet/crate/large/soviet

// code/modules/cargo/exports/large_objects.dm
/datum/export/large/reagent_dispenser/kvass
	unit_name = "kvasstank"
	export_types = list(/obj/structure/reagent_dispensers/kvasstank)
	contents_cost = CARGO_CRATE_VALUE
