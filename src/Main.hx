import hxd.Key;
import hxd.res.Loader;
import hxd.fs.LocalFileSystem;

class Main extends hxd.App {
	public var mainTexture:h2d.Tile;
	public var sprites:h2d.SpriteBatch.SpriteBatch;
	public var spaceship:h2d.SpriteBatch.BasicElement;

	override function init() {
		super.init();
		s2d.cameras[0].layerVisible = (idx) -> idx != 1;

		var uiCamera = new h2d.Camera.Camera();
		uiCamera.layerVisible = (idx) -> idx == 1;
		s2d.addCamera(uiCamera, 1);

		var font:h2d.Font = hxd.res.DefaultFont.get();
		var tf = new h2d.Text(font);
		tf.text = "Hello World\nHeaps is great!";
		s2d.add(tf, 1);

		mainTexture = hxd.Res.textures.spaceship.toTile();
		sprites = new h2d.SpriteBatch.SpriteBatch(mainTexture);
		sprites.hasRotationScale = true;
		sprites.hasUpdate = true;

		// playerObj = new h2d.Object();
		// s2d.addChild(playerObj);

		spaceship = new h2d.SpriteBatch.BasicElement(mainTexture.center());
		spaceship.scale = 2;
		spaceship.rotation = 1.57;
		spaceship.x = 500;
		spaceship.y = 500;
		// spaceship.vx = 0.5;
		// spaceship.vy = 0.5;
		sprites.add(spaceship);
		s2d.add(sprites, 0);

		s2d.camera.anchorX = 0.5;
		s2d.camera.anchorY = 0.5;
	}

	override function update(dt:Float) {
		// s2d.camera.x = spaceship.x;
		// s2d.camera.y = spaceship.y;
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
