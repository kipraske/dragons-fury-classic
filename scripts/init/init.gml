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
	
	enum job_skills {
		// Mage
		MP_up,
		double_cast,
		mp_cost_down,
		mp_turbo,
		staff_up,
		book_up,
		// Druid
		RES_up,
		mimic,
		hp_drain,
		healing_up,
		bow_up,
		ax_up,
		// Thief
		SPD_up,
		steal,
		loot_up,
		gold_up,
		hammer_up,
		accessory_up,
		// Oracle
		LUK_up,
		scan,
		insight,
		xp_up,
		sword_up,
		dagger_up,
		// Inventor
		HP_up,
		machine_gun,
		potion,
		elixer,
		rest_up,
		gun_up,
		// Knight
		DEF_up,
		defend,
		last_stand,
		auto_revive,
		heavy_armor_up,
		shield_up,
		// Monk
		ATK_up,
		flurry,
		counter,
		mp_drain,
		unarmored_up,
		unarmed_up
	}
	
	// Manually sort just so we don't have to always figure this out
	global.job_skills_by_type[jobs.monk] = [
		job_skills.ATK_up,
		job_skills.flurry,
		job_skills.counter,
		job_skills.mp_drain,
		job_skills.unarmored_up,
		job_skills.unarmed_up
	];
	global.job_skills_by_type[jobs.knight] = [
		job_skills.DEF_up,
		job_skills.defend,
		job_skills.last_stand,
		job_skills.auto_revive,
		job_skills.heavy_armor_up,
		job_skills.shield_up
	];
	global.job_skills_by_type[jobs.inventor] = [
		job_skills.HP_up,
		job_skills.machine_gun,
		job_skills.potion,
		job_skills.elixer,
		job_skills.rest_up,
		job_skills.gun_up
	];
	global.job_skills_by_type[jobs.oracle] = [
		job_skills.LUK_up,
		job_skills.scan,
		job_skills.insight,
		job_skills.xp_up,
		job_skills.sword_up,
		job_skills.dagger_up
	];
	global.job_skills_by_type[jobs.thief] = [
		job_skills.SPD_up,
		job_skills.steal,
		job_skills.loot_up,
		job_skills.gold_up,
		job_skills.hammer_up,
		job_skills.accessory_up
	];
	global.job_skills_by_type[jobs.druid] = [
		job_skills.RES_up,
		job_skills.mimic,
		job_skills.hp_drain,
		job_skills.healing_up,
		job_skills.bow_up,
		job_skills.ax_up
	];
	global.job_skills_by_type[jobs.mage] = [
		job_skills.MP_up,
		job_skills.double_cast,
		job_skills.mp_cost_down,
		job_skills.mp_turbo,
		job_skills.staff_up,
		job_skills.book_up
	];

	enum magic_skills {
		// basic group
		heal,
		poison,
		quake,
		tornado,
		flood,
		
		// combo damage group
		thunder, //sea+sky
		ice,	 //sea+earth
		meteor,  //earth+sky
		smite,   //earth+sea+sky
		
		// healing/buff group
		DEF_up,  //light+earth
		RES_up,  //light+sea
		regen,   //light+sky
		SPD_up, //light+thunder
		LUK_up,  //light+ice
		ATK_up,  //light+meteor
		revive,  //light+smite
		mp_regen,//dark+light+sea
		
		// debuff group
		DEF_down, //dark+earth
		RES_down, //dark+sea
		aggro,    //dark+sky
		SPD_down,  //dark+thunder
		LUK_down, //dark+ice
		ATK_down, //dark+meteor
		plague,   //dark+smite
		flash,    //dark+light+lightning
		
		// status group
		purify,   //dark+light
		pain,     //dark+light+earth
		confuse,  //dark+light+sky
		freeze,   //dark+light+ice
		sleep,    //dark+light+meteor
		
		// ultimate group
		void      //all 5
	}

	enum status_effects {
		sleep,
        freeze,
        confuse,
        pain,
        aggro,
        poison,
        regen,
        mp_regen,
        atk,
        def,
        res,
        spd,
        luk
	}
}