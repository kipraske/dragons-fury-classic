/// @description move focus next frame to prevent out of order

// We can't apply focus on this step or else those menus will be activated prematurely
// So we set the focus for the next step here
global.battle.menu_focus = global.battle.next_menu_focus;