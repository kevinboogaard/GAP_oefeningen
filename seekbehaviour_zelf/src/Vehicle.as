package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kevin Boogaard
	 */
	public class Vehicle extends Sprite
	{
		private var _velocity:Vector2D = new Vector2D(3, 3);
		private var _position:Vector2D = new Vector2D(3, 3);
		
		private var _vectorGraphic:Sprite;
		
		private var _maxSpeed:Number = 100;
		private var _mass:Number = 1;
		private var _slowRadius:Number = 100;
		public function Vehicle() 
		{
			_vectorGraphic = new Sprite();
			addChild(_vectorGraphic);
		}
		public function update():void
		{
			_position = _position.add(_velocity);
			
			x = _position.x;
			y = _position.y;
		}
		
		public function seek(target:Vector2D):void
		{
			var desiredStep:Vector2D = target.subtract(_position);
			var distenceToTarget:uint = desiredStep.length;
			
			desiredStep.normalize();
			
			var desiredVelocity:Vector2D = desiredStep.multiply(maxSpeed);
			
			var steeringForce:Vector2D = desiredVelocity.subtract(_velocity);
			
			_velocity.add(steeringForce.divide(_mass));
			
			rotation = _velocity.angle * 180 / Math.PI;
		}
		public function get maxSpeed():Number
		{
			return _maxSpeed;
		}
		
		public function set maxSpeed(value:Number):void
		{
			_maxSpeed = value;
		}
		
		public function get mass():Number
		{
			return _mass;
		}
		
		public function set mass(value:Number):void
		{
			_mass = value;
		}
		
	}

}