package org.robotlegs.examples.signalcommands.signals
{
	import org.osflash.signals.Signal;
	import org.robotlegs.examples.signalcommands.model.enums.FoodType;
	import org.robotlegs.examples.signalcommands.model.vo.FoodItem;
	
	public class AddFoodItemToOrder extends Signal
	{
		public function AddFoodItemToOrder()
		{
			super(FoodType);
		}
	}
}