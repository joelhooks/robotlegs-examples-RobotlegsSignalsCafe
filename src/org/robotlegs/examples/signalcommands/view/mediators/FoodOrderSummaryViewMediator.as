package org.robotlegs.examples.signalcommands.view.mediators
{
	import org.robotlegs.examples.signalcommands.model.vo.FoodOrder;
	import org.robotlegs.examples.signalcommands.signals.FoodOrderUpdated;
	import org.robotlegs.examples.signalcommands.view.components.FoodOrderSummaryView;
	import org.robotlegs.mvcs.Mediator;
	
	public class FoodOrderSummaryViewMediator extends Mediator
	{
		[Inject]
		public var view:FoodOrderSummaryView;
		
		[Inject]
		public var orderUpdated:FoodOrderUpdated;
		
		override public function onRegister():void
		{
			orderUpdated.add(updateViewOnOrderUpdated);
		}
		
		protected function updateViewOnOrderUpdated(order:FoodOrder):void
		{
			if(!view.order)
				view.order = order;
		}
	}
}