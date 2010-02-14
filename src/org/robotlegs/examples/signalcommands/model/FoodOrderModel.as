package org.robotlegs.examples.signalcommands.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.examples.signalcommands.model.enums.FoodType;
	import org.robotlegs.examples.signalcommands.model.vo.FoodItem;
	import org.robotlegs.examples.signalcommands.model.vo.FoodOrder;
	import org.robotlegs.examples.signalcommands.signals.FoodItemAddedToOrder;
	import org.robotlegs.examples.signalcommands.signals.FoodOrderUpdated;
	import org.robotlegs.examples.signalcommands.signals.NoFoodItemSelected;
	import org.robotlegs.mvcs.Actor;
	
	public class FoodOrderModel extends Actor
	{
		[Inject]
		public var orderUpdated:FoodOrderUpdated;
		
		[Inject]
		public var itemAdded:FoodItemAddedToOrder;
		
		[Inject]
		public var noFoodItemSelected:NoFoodItemSelected;
		
		private var _foodOrder:FoodOrder;
		
		public function get foodOrder():FoodOrder
		{
			return _foodOrder;
		}
		
		private var _currentItemSelection:FoodItem;

		public function get currentItemSelection():FoodItem
		{
			return _currentItemSelection;
		}

		public function set currentItemSelection(value:FoodItem):void
		{
			_currentItemSelection = value;
		}
		
		public function FoodOrderModel()
		{
			_foodOrder = new FoodOrder();
		}
		
		public function addItemToOrder(type:FoodType):void
		{
			var item:FoodItem = getFoodItemByType(type);
			
			item.quantity++;
			foodOrder.addItem(item);
			
			itemAdded.dispatch(item);
			orderUpdated.dispatch(foodOrder);
		}
		
		protected function getFoodItemByType(type:FoodType):FoodItem
		{
			var item:FoodItem;
			
			for each( item in foodOrder.foodItems)
			{
				if(item.type == type)
					return item;
			}
			item = new FoodItem(type);
			return item;
		}
		
		public function removeAllOf(item:FoodItem):void
		{
			foodOrder.removeItem(item);
			noFoodItemSelected.dispatch();
			orderUpdated.dispatch(foodOrder);
		}
	}
}