import hxd.res.Loader;
import hxd.fs.LocalFileSystem;

class Main extends hxd.App {
	public var tile: h2d.Bitmap;

	override function init() {
		super.init();

		var font:h2d.Font = hxd.res.DefaultFont.get();
		var tf = new h2d.Text(font);
		tf.text = "Hello World\nHeaps is great!";
		s2d.addChild(tf);

		tile = new h2d.Bitmap(hxd.Res.textures.spaceship.toTile().center());
		tile.tile.center();
		tile.width = 64;
		tile.height = 64;
		s2d.addChild(tile);
	}

	override function update(dt:Float) {
		tile.x = engine.width / 2;
		tile.y = engine.height / 2;
	}

	static function main() {
		hxd.Res.loader = new Loader(new LocalFileSystem("assets", null, "assets"));
		new Main();
	}
}
