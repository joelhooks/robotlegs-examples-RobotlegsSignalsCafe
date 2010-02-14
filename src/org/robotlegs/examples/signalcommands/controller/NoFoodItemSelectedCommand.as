package org.robotlegs.examples.signalcommands.controller
{
	import org.robotlegs.examples.signalcommands.model.FoodOrderModel;
	import org.robotlegs.mvcs.Command;
	
	public class NoFoodItemSelectedCommand extends Command
	{
		[Inject]
		public var model:FoodOrderModel;
		
		override public function execute():void
		{
			model.currentItemSelection = null;
		}
	}
}