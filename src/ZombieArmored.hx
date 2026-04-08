class ZombieArmored extends Enemy {
    override function classTexture():h2d.Tile {
        return hxd.Res.textures.zombie_armored.toTile();
    }

    // override function classSize():Float {
    //     return 35;
    // }
}