import PlayerControler;
import VectorMath;

class Enemy {
    public var sprite: h2d.SpriteBatch.BasicElement;

    public function new(mainTexture:h2d.Tile, sprites:h2d.SpriteBatch.SpriteBatch, x:Float, y:Float) {
		sprite = new h2d.SpriteBatch.BasicElement(mainTexture.center());
		sprite.scale = 2;
		sprite.rotation = 3.14 / 4;
		sprite.x = 200;
		sprite.y = 200;
		sprites.add(sprite);
    }

    public function update() {
        var lookat = vec2(sprite.x - PlayerControler.spaceship.x, sprite.y - PlayerControler.spaceship.x);
        var lookat = lookat / lookat.length();
        var orientation = Math.atan2(lookat.x, lookat.y);

        var velocity = 200 * vec2(Math.sin(orientation), -Math.cos(orientation));
        sprite.rotation = orientation;
		sprite.vx = velocity.x;
		sprite.vy = velocity.y;
    }
}