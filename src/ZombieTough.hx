class ZombieTough extends Enemy {
    override function classTexture():h2d.Tile {
        return hxd.Res.textures.zombie_tough.toTile();
    }

    override function classSize():Float {
        return 35;
    }
}