package org.robotlegs.examples.signalcommands.view.mediators
{
	import org.robotlegs.examples.signalcommands.model.vo.FoodItem;
	import org.robotlegs.examples.signalcommands.model.vo.FoodOrder;
	import org.robotlegs.examples.signalcommands.signals.FoodItemAddedToOrder;
	import org.robotlegs.examples.signalcommands.signals.FoodItemSelected;
	import org.robotlegs.examples.signalcommands.signals.FoodOrderUpdated;
	import org.robotlegs.examples.signalcommands.signals.NoFoodItemSelected;
	import org.robotlegs.examples.signalcommands.view.components.CurrentOrderView;
	import org.robotlegs.mvcs.Mediator;
	
	public class CurrentOrderViewMediator extends Mediator
	{
		[Inject]
		public var view:CurrentOrderView;
		
		[Inject]
		public var orderUpdated:FoodOrderUpdated;
		
		[Inject]
		public var foodItemSelected:FoodItemSelected;
		
		[Inject]
		public var noFoodItemSelected:NoFoodItemSelected;
		
		[Inject]
		public var foodItemAddedToOrder:FoodItemAddedToOrder;
		
		override public function onRegister():void
		{
			orderUpdated.add(updateOnOrderUpdated);
			foodItemAddedToOrder.add(updateOnItemAdded);
			view.foodItemSelected.add(updateOnItemSelected);	

		}
		
		protected function updateOnItemAdded(item:FoodItem):void
		{
			view.items.selectedItem = item;
			foodItemSelected.dispatch(item);
		}
		
		protected function updateOnItemSelected(item:FoodItem):void
		{
			if(item)
				foodItemSelected.dispatch(item);
			else
				noFoodItemSelected.dispatch();
		}
		
		protected function updateOnOrderUpdated(order:FoodOrder):void
		{
			if(!view.dataProvider)
				view.dataProvider = order.foodItems;
		}
	}
}