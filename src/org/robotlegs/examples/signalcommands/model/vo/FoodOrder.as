package org.robotlegs.examples.signalcommands.model.vo
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.examples.signalcommands.model.enums.FoodType;
	
	[Bindable]
	/**
	 * Value Object to wrap a collection of <code>FoodItem</code> objects 
	 * @author joel
	 * 
	 */	
	public class FoodOrder extends EventDispatcher
	{
		[ArrayElementType("org.robotlegs.examples.signalcommands.model.vo.FoodItem")]
		private var _foodItems:ArrayCollection;

		public function get foodItems():ArrayCollection
		{
			if(!_foodItems)
				_foodItems = new ArrayCollection();
			
			return _foodItems;
		}

		public function set foodItems(value:ArrayCollection):void
		{
			_foodItems = value;
		}
		
		public function addItem(item:FoodItem):void
		{
			for each(var existingItem:FoodItem in foodItems)
			{
				if(item.type == existingItem.type)
				{
					dispatchEvent(new Event("foodOrderUpdated"));
					return;
				}
			}
			foodItems.addItem(item);
			dispatchEvent(new Event("foodOrderUpdated"));
		}
		
		public function removeItem(item:FoodItem):void
		{
			var itemIndex:int = foodItems.getItemIndex(item);
			if(itemIndex > -1)
				foodItems.removeItemAt(itemIndex);
			dispatchEvent(new Event("foodOrderUpdated"));
		}
		
		public function getItemByType(type:FoodType):FoodItem
		{
			var item:FoodItem;
			for each( item in foodItems)
			{
				if(item.type == type)
					return item;
			}
			return new FoodItem(type);
		}
	
		[Bindable(event="foodOrderUpdated")]
		/**
		 * The total cost of all of the <code>FoodItem</code> objects
		 * in this order. 
		 * @return 
		 * 
		 */		
		public function get totalCost():Number
		{
			var cost:Number = 0.00;
			
			for each(var item:FoodItem in foodItems)
			{
				cost += item.price * item.quantity;
			}
			
			return cost;
		}
	}
}