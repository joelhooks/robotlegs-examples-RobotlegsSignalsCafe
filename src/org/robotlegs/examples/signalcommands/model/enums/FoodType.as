package org.robotlegs.examples.signalcommands.model.enums
{
	import assets.ApplicationAsset;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * Enumeration of some types of food. This is used in this example as a sort of 
	 * service replacement. A fixed menu, if you will. 
	 * @author joel
	 * 
	 */	
	public class FoodType extends EventDispatcher
	{
		public static const NONE:FoodType = new FoodType("---", 0, 0.0, null);
		public static const APPLE:FoodType = new FoodType("apple", 1, 0.50, ApplicationAsset.AppleIcon);
		public static const BURGER:FoodType = new FoodType("burger", 2, 1.75, ApplicationAsset.BurgerIcon);
		public static const COFFEE:FoodType = new FoodType("coffee", 4, 0.25, ApplicationAsset.CoffeeIcon);
		public static const HOTDOG:FoodType = new FoodType("hotdog", 5, 1.00, ApplicationAsset.HotdogIcon);
		public static const PIZZA:FoodType = new FoodType("pizza", 6, 4.00, ApplicationAsset.PizzaIcon);
		public static const SUSHI:FoodType = new FoodType("rare FUGU", 1, 1235.00, ApplicationAsset.SushiIcon);
		
		private var _value:String;

		[Bindable(event="foodTypeUpdated")]
		public function get value():String
		{
			return _value;
		}

		private var _ordinal:int;

		[Bindable(event="foodTypeUpdated")]
		public function get ordinal():int
		{
			return _ordinal;
		}
		
		private var _price:Number;

		[Bindable(event="foodTypeUpdated")]
		public function get price():Number
		{
			return _price;
		}

		private var _icon:Class;
		
		[Bindable(event="foodTypeUpdated")]
		public function get icon():Class
		{
			return _icon;
		}
		
		public function FoodType(value:String, ordinal:int, price:Number, icon:Class)
		{
			_value = value;
			_ordinal = ordinal;
			_price = price;
			_icon = icon;
			dispatchEvent(new Event("foodTypeUpdated"));
		}
		
		public static function get list():ArrayCollection
		{
			return new ArrayCollection([APPLE, BURGER, COFFEE, HOTDOG, PIZZA, SUSHI]);
		}
		
		public static function get cList():ArrayCollection
		{
			var cList:ArrayCollection = new ArrayCollection(list.source);
			cList.addItemAt(NONE,0);
			return cList; 
		}
		
		public static function selectByValue(value:String):FoodType
		{
			for each(var type:FoodType in list)
			{
				if(type.value == value)
					return type;
			}
			return NONE;
		}
		
		override public function toString():String
		{
			return value;
		}
	}
}