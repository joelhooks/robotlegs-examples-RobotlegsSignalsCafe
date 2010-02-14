package org.robotlegs.examples.signalcommands.controller
{
	import org.robotlegs.examples.signalcommands.model.FoodOrderModel;
	import org.robotlegs.examples.signalcommands.model.enums.FoodType;
	import org.robotlegs.examples.signalcommands.model.vo.FoodItem;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class AddFoodItemToOrderCommand extends SignalCommand
	{
		[Inject]
		public var itemType:FoodType;
		
		[Inject]
		public var model:FoodOrderModel;
		
		override public function execute():void
		{
			model.addItemToOrder(itemType);
		}
	}
}