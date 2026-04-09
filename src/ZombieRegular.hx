class ZombieRegular extends Enemy {
    function classTexture():h2d.Tile {
        // return hxd.Res.textures.zombie_regular.toTile();
        return hxd.Res.textures.spritesheet_png.toTile().sub(32, 0, 16, 16);
    }

    function classSize():Float {
        return 25;
    }
}