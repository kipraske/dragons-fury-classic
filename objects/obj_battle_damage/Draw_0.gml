/// @description Insert description here
// You can write your code in this editor

draw_set_font(ft_damage);
draw_set_halign(fa_center);
draw_set_color(c_white);

if ( crit_mult > 0 && resist_mult == 0 ) { // Normal Crit
	draw_set_color( c_yellow );
} else if ( crit_mult <= 0 && resist_mult < 0 ) { // Normal Weak
	draw_set_color( c_aqua );
} else if ( crit_mult > 0 && resist_mult < 0 ) { // Crit + Weak
	draw_set_color( c_fuchsia );
} else if ( crit_mult <= 0 && resist_mult > 0 ) { // Normal Resist
	draw_set_color( c_ltgray );
} else if ( crit_mult > 0 && resist_mult > 0 ) { // Crit + Resist
	draw_set_color (c_olive);
} else 

if ( damage < 0 ) { // Healing
	draw_set_color(c_green);
}

// TODO MP/heal and MP damage
// TODO XP gained/Damage

draw_text_shadow(x,y, damage);

var damage_text_width = string_width(damage)

if ( crit_mult > 0 ) {
	var display_mult = crit_mult + 1;
	draw_set_font(ft_stat_heading);
	draw_set_color( c_yellow );
	draw_text_shadow(x - damage_text_width - 12, y+14, "CRIT x" + string(display_mult));
}

// TODO - I think I am going to have to move this up in the various cases to make sure that the users
// can actually see both cases. It isn't ideal but it looks ok

if ( resist_mult < 0 ) {
	var display_mult = abs(resist_mult) + 1;
	draw_set_font(ft_stat_heading);
	draw_set_color( c_aqua );
	draw_text_shadow(x - damage_text_width - 12, y + 2, "WEAK x" + string(display_mult));
}

if ( resist_mult > 0 ) {
	var display_mult = abs(resist_mult) + 1;
	draw_set_font(ft_stat_heading);
	draw_set_color( c_ltgray );
	draw_text_shadow(x - damage_text_width - 16, y + 2, "RESIST x" + string(display_mult));
}

// TODO -- resist case
