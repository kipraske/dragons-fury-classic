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
	
	}
	
	// Manually sort just so we don't have to always figure this out
	global.job_skills_by_type[jobs.monk] = [
		
	];
	global.job_skills_by_type[jobs.knight] = [
		
	];
	global.job_skills_by_type[jobs.inventor] = [
		
	];
	global.job_skills_by_type[jobs.oracle] = [
		
	];
	global.job_skills_by_type[jobs.thief] = [
		
	];
	global.job_skills_by_type[jobs.druid] = [
		
	];
	global.job_skills_by_type[jobs.mage] = [
		
	];

	enum magic_skills {}

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