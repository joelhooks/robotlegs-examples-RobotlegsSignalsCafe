package org.robotlegs.examples.signalcommands.model.vo
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import org.robotlegs.examples.signalcommands.model.enums.FoodType;
	
	[Bindable]
	public class FoodItem extends EventDispatcher
	{
		private var _type:FoodType;

		public function set type(value:FoodType):void
		{
			_type = value;
			dispatchEvent(new Event("foodTypeUpdated"));
		}

		public function get type():FoodType
		{
			return _type;
		}
		
		private var _quantity:int;

		public function get quantity():int
		{
			return _quantity;
		}

		public function set quantity(value:int):void
		{
			_quantity = value;
		}

		[Bindable(event="foodTypeUpdated")]
		public function get price():Number
		{
			return type.price;
		}
		
		[Bindable(event="foodTypeUpdated")]
		public function get icon():Class
		{
			return type.icon;
		}
		
		public function FoodItem(type:FoodType)
		{
			_type = type;
		}
	}
}