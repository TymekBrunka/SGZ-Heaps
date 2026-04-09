class ZombieTough extends Enemy {
    function classTexture():h2d.Tile {
        // return hxd.Res.textures.zombie_tough.toTile();
        return hxd.Res.textures.spritesheet_png.toTile().sub(0.666, 0.333, 1, 0.666);
    }

    function classSize():Float {
        return 35;
    }
}