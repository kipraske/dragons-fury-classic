To best create the localization files we will do the following steps on a new launch package.

1. Remove labels.json from the current save file.
2. Run the game to generate a new labels.json in the game save files
3. Copy the labels.json to this datafiles directory

For each new localization we will add a switch statement in the labels_init script which determines which labels.json file to use and which plot_tree folder to use. Use the standard localization suffixes. So

labels_ES.json and plot_tree_ES will be for spanish