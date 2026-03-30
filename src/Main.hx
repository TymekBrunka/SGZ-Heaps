import hxd.Key;
import hxd.res.Loader;
import hxd.fs.LocalFileSystem;

class Main extends hxd.App {
	public var mainTexture:h2d.Tile;
	public var sprites:h2d.SpriteBatch.SpriteBatch;
	public var spaceship:h2d.SpriteBatch.BasicElement;
	// public var playerObj:h2d.Object;

	override function init() {
		super.init();

		var font:h2d.Font = hxd.res.DefaultFont.get();
		var tf = new h2d.Text(font);
		tf.text = "Hello World\nHeaps is great!";
		s2d.addChild(tf);

		mainTexture = hxd.Res.textures.spaceship.toTile();
		sprites = new h2d.SpriteBatch.SpriteBatch(mainTexture);
		sprites.hasRotationScale = true;
		sprites.hasUpdate = true;

		// playerObj = new h2d.Object();
		// s2d.addChild(playerObj);

		spaceship = new h2d.SpriteBatch.BasicElement(mainTexture.center());
		spaceship.scale = 5;
		spaceship.rotation = 1.57;
		spaceship.x = 500;
		spaceship.y = 500;
		// spaceship.vx = 0.5;
		// spaceship.vy = 0.5;
		sprites.add(spaceship);
		s2d.addChild(sprites);
	}

	override function update(dt:Float) {
		s2d.camera.x = spaceship.x;
		s2d.camera.y = spaceship.y;
		// s2d.camera.follow = playerObj;
		s2d.camera.anchorX = 0.5;
		s2d.camera.anchorY = 0.5;
	}

	static function main() {
		// if (!hxd.tools.RenderDoc.init())
		// 	throw "Can't init RenderDoc, renderdoc.dll may be missing from your PATH!";
		// hxd.tools.RenderDoc.launchReplayUi(true, null);
		// hxd.tools.RenderDoc.setCaptureKeys([Key.F11]);

		// hxd.Res.loader = new Loader(new LocalFileSystem("assets", null, "assets"));
		hxd.Res.initLocal();
		new Main();
	}
}
