import hxd.Key;
import hxd.res.Loader;
import hxd.fs.LocalFileSystem;
import echo.util.Debug.HeapsDebug;
import echo.World;

class Main extends hxd.App {
	public static var world:World;

	#if debug
	public var echo_debug_drawer:HeapsDebug;
	#end

	public static var mainTexture:h2d.Tile;
	public static var sprites:h2d.SpriteBatch.SpriteBatch;
	public static var player:PlayerControler;
	public static var enemies:Array<Enemy> = [];
	public static var music:hxd.res.Sound;

	override function init() {
		world = new World({
			width: engine.width,
			height: engine.height,
			gravity_y: 20
		});

		#if debug
		echo_debug_drawer = new HeapsDebug(s2d);
		#end

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

		player = new PlayerControler(mainTexture, sprites);

		// playerObj = new h2d.Object();
		// s2d.addChild(playerObj);

		var enemy = new ZombieRegular(sprites, 0, 0);
		var enemy2 = new ZombieTough(sprites, 100, -100);
		enemies.push(enemy);
		enemies.push(enemy2);

		s2d.add(sprites, 0);

		s2d.camera.anchorX = 0.5;
		s2d.camera.anchorY = 0.5;

		world.listen({separate: true});

		music = hxd.Res.sound.PrismTrollPilgrammedOST;
		music.play(true);
	}

	override function update(dt:Float) {
		s2d.camera.x = PlayerControler.spaceship.x;
		s2d.camera.y = PlayerControler.spaceship.y;
		player.update(dt);
		for (i in enemies) {
			i.update();
		}

		world.step(dt);

		#if debug
		if (Key.isPressed(Key.QWERTY_TILDE)) echo_debug_drawer.canvas.visible = !echo_debug_drawer.canvas.visible;
		echo_debug_drawer.draw(world);
		#end
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
