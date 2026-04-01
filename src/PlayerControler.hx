import Main;
import hxd.Key;
import VectorMath;

class PlayerControler {
	public static var spaceship:h2d.SpriteBatch.BasicElement;
    public var speed:Float;
    public var velocity:Vec2;
    public var orientation:Float;

	public function new(mainTexture:h2d.Tile, sprites:h2d.SpriteBatch.SpriteBatch) {
		spaceship = new h2d.SpriteBatch.BasicElement(mainTexture.center());
		spaceship.scale = 2;
		spaceship.rotation = 3.14 / 4;
		spaceship.x = 200;
		spaceship.y = 200;
		// spaceship.vx = 0.5;
		// spaceship.vy = 0.5;
		sprites.add(spaceship);
	}

    function sign(x:Float) {
        if (x == 0) {
            return 0.0;
        }
        return x / Math.abs(x);
    }

    function clamp(min:Float, max:Float, x:Float) {
        if (x < min) {
            return min;
        } else if (x > max) {
            return max;
        }
        return x;
    }

	public function update(dt:Float) {
		if (Key.isDown(hxd.Key.W)) {
            speed += dt * 300;
        }
        if (Key.isDown(hxd.Key.S)) {
            speed -= dt * 300;
        }
        if (Key.isDown(hxd.Key.A)) {
            orientation -= dt * 2;
        }
        if (Key.isDown(hxd.Key.D)) {
            orientation += dt * 2;
        }
        speed -= dt * 100 * sign(speed);
        speed = clamp(-100, 300, speed);
        velocity = speed * vec2(Math.sin(orientation), -Math.cos(orientation));
        spaceship.rotation = orientation;
		spaceship.vx = velocity.x;
		spaceship.vy = velocity.y;
	}
}
