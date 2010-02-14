package org.robotlegs.examples.signalcommands.signals
{
	import org.osflash.signals.Signal;
	import org.robotlegs.examples.signalcommands.model.vo.FoodOrder;
	
	public class FoodOrderUpdated extends Signal
	{
		public function FoodOrderUpdated()
		{
			super(FoodOrder);
		}
	}
}