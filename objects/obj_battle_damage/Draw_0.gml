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
}

if ( damage < 0 ) { // Healing
	draw_set_color(c_green);
}

// TODO MP/heal and MP damage
// TODO XP gained/Damage

draw_text_shadow(x,y, damage);