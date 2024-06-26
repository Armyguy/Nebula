/spell/targeted/glimpse_of_eternity
	name = "Glimpse of Eternity"
	desc = "Show the non-believers what enlightenment truely means."
	feedback = "GE"
	school = "illusion"
	invocation = "Ghe Tar Yet!"
	invocation_type = SpI_SHOUT
	spell_flags = INCLUDEUSER
	max_targets = 0
	charge_max = 400
	range = 3

	hud_state = "wiz_glimpse"

/spell/targeted/glimpse_of_eternity/cast(var/list/targets, var/mob/user)
	for(var/t in targets)
		var/mob/living/L = t
		if(L.faction != user.faction) //Worse for non-allies
			SET_STATUS_MAX(L, STAT_BLIND, 5)
			SET_STATUS_MAX(L, STAT_STUN, 5)
			new /obj/effect/temporary(get_turf(L), 5, 'icons/effects/effects.dmi', "electricity_constant")
		else
			SET_STATUS_MAX(L, STAT_BLIND, 2)
			L.heal_damage(BRUTE, 10, do_update_health = FALSE)
			L.heal_damage(BURN, 10)
			new /obj/effect/temporary(get_turf(L), 5, 'icons/effects/effects.dmi', "green_sparkles")