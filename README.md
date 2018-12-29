# iOSTableWithImages
In this assignment you will get familiar with iOS Table Views and loading images. You
will develop an iTunes application viewer application. 

Part 1 : Categories View Controller (30 Points)
The interface should be created to match the UI presented in Figure 1(a). The
requirements are as follows:
1. This is Categories view controller should be embedded in a navigation controller to
provide the transition to the Apps View Controller.
2. The list of categories should be retrieved from the provided support files.
3. The list of categories should be displayed in a Table View. Upon clicking on one of the
categories the app should navigate to the Apps View controller. The Categories view
controller should pass the required information to the Apps view controller in order to
display the apps list for the selected category. 

Part 2 : Apps View Controller (60 Points)
The interface should be created to match the UI presented in Figure 1(b). The
requirements are as follows:
1. This is the Apps view controller which should display the list of apps in the category
selected from the Categories view controller.
2. Each table view cell should be displayed as shown in Figure 1(b).
3. Image downloads should be done in the background.
4. Clicking on a row item should segue to the App Details view controller, you should
use the “Present Modally” segue and should pass the required information from the
Apps view controller to the Ap Details view controller.

Part 3 : App Details View Controller (10 Points)
The interface should be created to match the UI presented in Figure 1(c). The
requirements are as follows:
1. This view controller should display the details of the app selected in the Apps view
controller.
2. This view controller should be displayed using the “Present Modally” segue
3. Clicking the “Close” button should dismiss this view controller and return back to the
Apps view controller.
4. Image downloads should be done in the background.
