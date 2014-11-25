package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Kevin Boogaard
	 */
	public class Main extends Sprite 
	{
		private var ball : Ball;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			ball.seek(new Vector2D(mouseX, mouseY));
			
			ball.update();
		}
		
	}
	
}