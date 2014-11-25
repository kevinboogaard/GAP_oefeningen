package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Berend Weij
	 */
	public class Main extends Sprite 
	{
		
		private var _paraglider : Paraglider;
		private var _waypoints : Array;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_waypoints = [];
			
			_paraglider = new Paraglider();
			
			addChild(_paraglider);
			
			stage.addEventListener(MouseEvent.CLICK, setWaypoint);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function setTarget(wp:Waypoint):void 
		{
			_paraglider.setTarget( new Vector2D(wp.x, wp.y) );
		}
		
		private function update(e : Event) : void
		{
			_paraglider.update();
			trace(_paraglider.disiredStepDistance);
		}
		
		private function setWaypoint(e:MouseEvent):void
		{
			var wp:Waypoint = new Waypoint();
			wp.x = e.stageX;
			wp.y = e.stageY;
			addChild(wp);
			_waypoints.push(wp);
			setTarget(_waypoints[0]);
		}
		
		private function removeWaypoint(wp:Waypoint):void
		{
			var index = _waypoints.indexOf(wp);
			_waypoints.splice(index, 1);
			removeChild(wp);
		}
		
	}
	
}