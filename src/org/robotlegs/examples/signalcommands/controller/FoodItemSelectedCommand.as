package org.robotlegs.examples.signalcommands.controller
{
	import org.robotlegs.examples.signalcommands.model.FoodOrderModel;
	import org.robotlegs.examples.signalcommands.model.vo.FoodItem;
	import org.robotlegs.mvcs.Command;
	
	public class FoodItemSelectedCommand extends Command
	{
		[Inject]
		public var item:FoodItem;
		
		[Inject]
		public var model:FoodOrderModel;
		
		override public function execute():void
		{
			model.currentItemSelection = item;
		}
	}
}