import echo.Body;
import Main;
import hxd.Key;
import hxmath.math.Vector2;

class PlayerControler {
	public static var spaceship:h2d.SpriteBatch.BasicElement;
    public static var body:Body;

	public var speed:Float;
	public var velocity:Vector2;
	public var orientation:Float;

	public function new(mainTexture:h2d.Tile, sprites:h2d.SpriteBatch.SpriteBatch) {
		spaceship = new h2d.SpriteBatch.BasicElement(mainTexture.center());
		spaceship.scale = 2;
		// spaceship.vx = 0.5;
		// spaceship.vy = 0.5;
		sprites.add(spaceship);

		body = Main.world.make({
			material: {elasticity: 0.2},
			shape: {
				type: CIRCLE,
				radius: 16,
			}
		});
		body.x = 200;
		body.y = 200;

		body.on_move = (x, y) -> {
			spaceship.x = x;
			spaceship.y = y;
		};
		body.on_rotate = (rotation) -> spaceship.rotation = rotation;
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
        orientation = body.rotation;
        velocity = body.velocity;
		if (Key.isDown(hxd.Key.W)) {
			speed += dt * 450;
		}
		if (Key.isDown(hxd.Key.S)) {
			speed -= dt * 450;
		}
		if (Key.isDown(hxd.Key.A)) {
			orientation -= dt * 2.5;
		}
		if (Key.isDown(hxd.Key.D)) {
			orientation += dt * 2.5;
		}
		speed -= dt * 150 * sign(speed);
		speed = clamp(-150, 450, speed);
		velocity = speed * new Vector2(Math.sin(orientation), -Math.cos(orientation));
		body.rotation = orientation;
		body.velocity = velocity;
	}
}
