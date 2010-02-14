package org.robotlegs.examples.signalcommands
{
    import org.robotlegs.examples.signalcommands.controller.*;
    import org.robotlegs.examples.signalcommands.model.FoodOrderModel;
    import org.robotlegs.examples.signalcommands.signals.*;
    import org.robotlegs.examples.signalcommands.view.components.*;
    import org.robotlegs.examples.signalcommands.view.mediators.*;
    import org.robotlegs.mvcs.SignalContext;

    public class SignalCafeContext extends SignalContext
    {
        override public function startup():void
        {
			injector.mapSingleton(FoodOrderModel);
			injector.mapSingleton(FoodOrderUpdated);
			injector.mapSingleton(FoodItemAddedToOrder);
			
			signalCommandMap.mapSignalClass(AddFoodItemToOrder, AddFoodItemToOrderCommand);
			signalCommandMap.mapSignalClass(FoodItemSelected, FoodItemSelectedCommand);
			signalCommandMap.mapSignalClass(RemoveAllOfSelectedItem, RemoveAllSelectedItemCommand);
			signalCommandMap.mapSignalClass(NoFoodItemSelected, NoFoodItemSelectedCommand);
			
            mediatorMap.mapView(FoodSelectionView, FoodSelectionViewMediator);
			mediatorMap.mapView(CurrentOrderView, CurrentOrderViewMediator);
			mediatorMap.mapView(FoodOrderSummaryView, FoodOrderSummaryViewMediator);
			mediatorMap.mapView(FoodItemRemovalView, FoodItemRemovalViewMediator);
        }
    }
}