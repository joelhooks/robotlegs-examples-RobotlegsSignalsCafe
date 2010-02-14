package org.robotlegs.examples.signalcommands.signals
{
	import org.osflash.signals.Signal;
	import org.robotlegs.examples.signalcommands.model.vo.FoodItem;
	
	public class FoodItemAddedToOrder extends Signal
	{
		public function FoodItemAddedToOrder()
		{
			super(FoodItem);
		}
	}
}