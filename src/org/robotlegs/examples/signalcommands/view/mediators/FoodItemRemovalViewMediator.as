package org.robotlegs.examples.signalcommands.view.mediators
{
	import org.robotlegs.examples.signalcommands.model.vo.FoodItem;
	import org.robotlegs.examples.signalcommands.signals.FoodItemSelected;
	import org.robotlegs.examples.signalcommands.signals.NoFoodItemSelected;
	import org.robotlegs.examples.signalcommands.signals.RemoveAllOfSelectedItem;
	import org.robotlegs.examples.signalcommands.view.components.FoodItemRemovalView;
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.mediaClasses.VolumeBar;
	
	public class FoodItemRemovalViewMediator extends Mediator
	{
		[Inject]
		public var view:FoodItemRemovalView;
		
		[Inject]
		public var removeAllOfItem:RemoveAllOfSelectedItem;
		
		[Inject]
		public var itemSelected:FoodItemSelected;
		
		[Inject]
		public var noFoodItemSelected:NoFoodItemSelected;
		
		override public function onRegister():void
		{
			view.removeAllItemsClicked.add(handleRemoveAllItemsClicked);
			
			itemSelected.add(updateOnItemSelected);
			noFoodItemSelected.add(updateOnNoItemSelected);
		}
		
		protected function updateOnItemSelected(item:FoodItem):void
		{
			view.enabled = item is FoodItem;
		}
		
		protected function updateOnNoItemSelected():void
		{
			view.enabled = false;
		}
		
		protected function handleRemoveAllItemsClicked():void
		{
			removeAllOfItem.dispatch();
		}
	}
}