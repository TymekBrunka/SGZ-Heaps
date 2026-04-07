import echo.Body;
import PlayerControler;
import hxmath.math.Vector2;

class Enemy {
	public var sprite:h2d.SpriteBatch.BasicElement;
	public var body:Body;

	public function new(mainTexture:h2d.Tile, sprites:h2d.SpriteBatch.SpriteBatch, x:Float, y:Float) {
		sprite = new h2d.SpriteBatch.BasicElement(mainTexture.center());
		sprite.scale = 2;
		sprite.rotation = 0;
		sprites.add(sprite);

		body = Main.world.make({
			material: {elasticity: 0.2},
			shape: {
				type: CIRCLE,
				radius: 16,
			}
		});
		body.x = x;
		body.y = y;

		Main.world.listen(PlayerControler.body, body, {
			separate: true, // Setting this to true will cause the Bodies to separate on Collision. This defaults to true
			enter: (a, b, c) -> trace("Collision Entered"), // This callback is called on the first frame that a collision starts
			stay: (a, b, c) -> trace("Collision Stayed"), // This callback is called on frames when the two Bodies are continuing to collide
			exit: (a, b) -> trace("Collision Exited"), // This callback is called when a collision between the two Bodies ends
		});
	}

	public function update() {
		var lookat = new Vector2(PlayerControler.body.x - body.x, PlayerControler.body.y - body.y);
		var lookat = lookat * (1 / lookat.length);
		var orientation = Math.PI - Math.atan2(lookat.x, lookat.y);

		var velocity = 300 * lookat;
		body.velocity = velocity;
		body.rotation = orientation;
	}
}
