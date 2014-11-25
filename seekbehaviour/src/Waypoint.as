package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kevin Boogaard
	 */
	public class Waypoint extends Sprite
	{
		
		public function Waypoint() 
		{
			this.graphics.beginFill(0xFF0000);
			this.graphics.drawCircle(0, 0, 15);
			this.graphics.endFill();
		}
		
	}

}