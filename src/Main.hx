package;

import luxe.Color;
import luxe.Input;
import luxe.options.DrawOptions.DrawCircleOptions;
import luxe.Vector;
import phoenix.Batcher.PrimitiveType;
import phoenix.geometry.CircleGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;

class Main extends luxe.Game 
{
	var geo: Geometry;
	var verts: Array<Vertex>;
	var drawn: Array<CircleGeometry>;
	
	var btnDwn: Bool = false;
	var cur: Int = 0;
	
	var last: Bool = false;
	var mousePos: Vector;
	
	var curp: Int = 0;
	
	var rand:Bool = false;
	
	override function ready() {

		mousePos = new Vector();
		
		var wx = Luxe.screen.mid.x;
		var hy = Luxe.screen.mid.y;
		
		geo = new Geometry( {
			batcher: Luxe.renderer.batcher,
			primitive_type: PrimitiveType.triangle_strip
		});
		
		verts = new Array<Vertex>();
		drawn = new Array<CircleGeometry>();
		
		for (v in verts)
		{
			geo.add(v);
		}
	}

	override function onkeyup(e:KeyEvent) {
		if(e.keycode == Key.escape) {
			Luxe.shutdown();
		}
	}
	
	override public function onmouseup(event:MouseEvent) {
		if (event.button == MouseButton.left) {
			btnDwn = false;
		}
	}
	
	override public function onmousemove(event:MouseEvent) {		
		mousePos = event.pos;
	}
	
	override public function onmousedown(event:MouseEvent) {
		if (event.button == MouseButton.right) {
			var i = checkVert(mousePos.x, mousePos.y, 10);
			if (i != -1) {
				geo.remove(verts[i]);
				verts.remove(verts[i]);
				drawn[i].visible = false;
				drawn[i] = null;
				drawn.remove(drawn[i]);
			}
		}
	}

	override function update(dt:Float) {
		var pressed = Luxe.input.mousedown(1);
		
		var radius = 10;
		
		for (d in drawn) {
			if (d != null) {
				d.visible = false;
			}
		}
		
		var i = checkVert(mousePos.x, mousePos.y, radius);
		var v = verts[i];
		if (i != -1) {
			if (Luxe.input.mousedown(1)) {
				btnDwn = true;
				cur = i;
			}
			
			if(drawn[i] == null) {
				drawn[i] = Luxe.draw.circle( { 
					x: v.pos.x, 
					y: v.pos.y, 
					r: radius,
					depth: 3
				});
			}
			else {
				drawn[i].visible = true;
				drawn[i].transform.pos.x = v.pos.x;
				drawn[i].transform.pos.y = v.pos.y;
			}
		}
		
		if (btnDwn) {
			verts[cur].pos.x = mousePos.x;
			verts[cur].pos.y = mousePos.y;
		}
		else if (pressed && !last) {
			addVertex(mousePos.x, mousePos.y);
		}
		
		last = pressed;
			
		if(rand)
		if (Math.random() > 0.9999) {
			addVertex(Math.random() * Luxe.screen.w, Math.random() * Luxe.screen.h);
		}
	}
	
	override public function onkeydown(event:KeyEvent) {
		if (event.keycode == Key.space) {
			rand = !rand;
		}
	}
	
	function addVertex(x: Float, y: Float): Void {
		var v1 = new Vertex(new Vector(x, y), Color.random());
		verts.push(v1);
		geo.add(v1);
	}
	
	function checkVert(x: Float, y:  Float, radius: Float): Int {
		for (i in 0...verts.length) {
			var v = verts[i];
			
			if (Math.abs(v.pos.x - x) < radius && Math.abs(v.pos.y - y) < radius ) {
				return i;
			}
		}
		return -1;
	}
}
