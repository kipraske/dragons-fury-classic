/// @function init
/// @desc defines all global enum and macros for the application
function init(){

	enum stats {
		atk,
		def,
		res,
		spd,
		luk
	}

	enum jobs {
		mage,
		druid,
		thief,
		oracle,
		inventor,
		knight,
		monk
	}
	
	enum skills {
		// basic magic group
		heal,
		poison,
		quake,
		tornado,
		flood,
		
		// combo damage magic group
		thunder, //sea+sky
		ice,	 //sea+earth
		meteor,  //earth+sky
		smite,   //earth+sea+sky
		
		// healing/buff magic group
		DEF_up,  //light+earth
		RES_up,  //light+sea
		regen,   //light+sky
		SPD_up, //light+thunder
		LUK_up,  //light+ice
		ATK_up,  //light+meteor
		revive,  //light+smite
		mp_regen,//dark+light+sea
		
		// debuff magic group
		DEF_down, //dark+earth
		RES_down, //dark+sea
		aggro,    //dark+sky
		SPD_down,  //dark+thunder
		LUK_down, //dark+ice
		ATK_down, //dark+meteor
		plague,   //dark+smite
		flash,    //dark+light+lightning
		
		// status magic group
		purify,   //dark+light
		pain,     //dark+light+earth
		confuse,  //dark+light+sky
		freeze,   //dark+light+ice
		sleep,    //dark+light+meteor
		
		// ultimate magic group
		void,     //all 5
		
		// basic attack
		attack,
		
		// Mage
		passive_MP_up,
		double_cast,
		mp_cost_down,
		mp_turbo,
		staff_up,
		book_up,
		
		// Druid
		passive_RES_up,
		mimic,
		hp_drain,
		rest_up,
		bow_up,
		ax_up,
		
		// Thief
		passive_SPD_up,
		steal,
		loot_up,
		gold_up,
		hammer_up,
		accessory_up,
		
		// Oracle
		passive_LUK_up,
		scan,
		insight,
		xp_up,
		sword_up,
		dagger_up,
		
		// Inventor
		passive_HP_up,
		machine_gun,
		potion,
		elixer,
		spear_up,
		gun_up,
		
		// Knight
		passive_DEF_up,
		defend,
		last_stand,
		auto_revive,
		heavy_armor_up,
		shield_up,
		
		// Monk
		passive_ATK_up,
		flurry,
		counter,
		mp_drain,
		unarmored_up,
		unarmed_up
	}
	
	// Manually sort just so we don't have to always figure this out
	global.job_skills_by_type[jobs.monk] = [
		skills.passive_ATK_up,
		skills.flurry,
		skills.counter,
		skills.mp_drain,
		skills.unarmored_up,
		skills.unarmed_up
	];
	global.job_skills_by_type[jobs.knight] = [
		skills.passive_DEF_up,
		skills.defend,
		skills.last_stand,
		skills.auto_revive,
		skills.heavy_armor_up,
		skills.shield_up
	];
	global.job_skills_by_type[jobs.inventor] = [
		skills.passive_HP_up,
		skills.machine_gun,
		skills.potion,
		skills.elixer,
		skills.spear_up,
		skills.gun_up
	];
	global.job_skills_by_type[jobs.oracle] = [
		skills.passive_LUK_up,
		skills.scan,
		skills.insight,
		skills.xp_up,
		skills.sword_up,
		skills.dagger_up
	];
	global.job_skills_by_type[jobs.thief] = [
		skills.passive_SPD_up,
		skills.steal,
		skills.loot_up,
		skills.gold_up,
		skills.hammer_up,
		skills.accessory_up
	];
	global.job_skills_by_type[jobs.druid] = [
		skills.passive_RES_up,
		skills.mimic,
		skills.hp_drain,
		skills.rest_up,
		skills.bow_up,
		skills.ax_up
	];
	global.job_skills_by_type[jobs.mage] = [
		skills.passive_MP_up,
		skills.double_cast,
		skills.mp_cost_down,
		skills.mp_turbo,
		skills.staff_up,
		skills.book_up
	];

	global.magic_base_mp_cost = [skills.void] = 15;
	
	global.magic_base_mp_cost = [skills.sleep] = 3;
	global.magic_base_mp_cost = [skills.freeze] = 3;
	global.magic_base_mp_cost = [skills.confuse] = 3;
	global.magic_base_mp_cost = [skills.pain] = 3;
	global.magic_base_mp_cost = [skills.purify] = 4;
	
	global.magic_base_mp_cost = [skills.flash] = 5;
	global.magic_base_mp_cost = [skills.plague] = 8;
	global.magic_base_mp_cost = [skills.ATK_down] = 4;
	global.magic_base_mp_cost = [skills.LUK_down] = 4;
	global.magic_base_mp_cost = [skills.SPD_down] = 4;
	global.magic_base_mp_cost = [skills.aggro] = 3;
	global.magic_base_mp_cost = [skills.RES_down] = 4;
	global.magic_base_mp_cost = [skills.DEF_down] = 4;
	
	global.magic_base_mp_cost = [skills.mp_regen] = 8;
	global.magic_base_mp_cost = [skills.revive] = 8;
	global.magic_base_mp_cost = [skills.ATK_up] = 4;
	global.magic_base_mp_cost = [skills.LUK_up] = 4;
	global.magic_base_mp_cost = [skills.SPD_up] = 4;
	global.magic_base_mp_cost = [skills.regen] = 5;
	global.magic_base_mp_cost = [skills.RES_up] = 4;
	global.magic_base_mp_cost = [skills.DEF_up] = 4;
	
	global.magic_base_mp_cost = [skills.smite] = 12;
	global.magic_base_mp_cost = [skills.meteor] = 8;
	global.magic_base_mp_cost = [skills.ice] = 8;
	global.magic_base_mp_cost = [skills.thunder] = 8;
	global.magic_base_mp_cost = [skills.flood] = 5;
	global.magic_base_mp_cost = [skills.tornado] = 5;
	global.magic_base_mp_cost = [skills.quake] = 5;
	global.magic_base_mp_cost = [skills.poison] = 3;
	global.magic_base_mp_cost = [skills.heal] = 5;	

	// Used for in battle status effects (power+duration) AND for item bonus/resists (perminent levels)
	enum status_effects {
		earth,
		sea,
		sky,
		sleep,
        freeze,
        confuse,
        pain,
        aggro,
        poison,
        regen,
        mp_regen,
        atk_up,
        def_up,
        res_up,
        spd_up,
        luk_up,
		atk_down,
        def_down,
        res_down,
        spd_down,
        luk_down
	}
	

	enum equipment_slots {
		main_hand,
		off_hand,
		two_hand,
		armor,
		ring
	}
	
	enum equipment_types {
		unarmed,
		pistol,
		dagger,
		short_sword, //counts as a "sword" for bonus
		book,
		crossbow, //counts as a "bow"
		rifle,
		sword,
		mace, //counts as a "hammer" for bonus
		spear,
		bow,
		staff,
		axe,
		hammer,
		shield,
		unarmored,
		light_armor, // all robes
		medium_armor, // all leather
		heavy_armor, // all steel plate
		ring
	}
	
	global.equipment_slot_by_type[equipment_types.ring] = equipment_slots.ring;
	global.equipment_slot_by_type[equipment_types.heavy_armor] = equipment_slots.armor;
	global.equipment_slot_by_type[equipment_types.medium_armor] = equipment_slots.armor;
	global.equipment_slot_by_type[equipment_types.light_armor] = equipment_slots.armor;
	global.equipment_slot_by_type[equipment_types.unarmored] = equipment_slots.armor;
	global.equipment_slot_by_type[equipment_types.shield] = equipment_slots.off_hand;
	global.equipment_slot_by_type[equipment_types.hammer] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.axe] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.bow] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.spear] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.mace] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.sword] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.rifle] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.crossbow] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.book] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.short_sword] = equipment_slots.off_hand;
	global.equipment_slot_by_type[equipment_types.dagger] = equipment_slots.off_hand;
	global.equipment_slot_by_type[equipment_types.pistol] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.unarmed] = equipment_slots.off_hand;
}