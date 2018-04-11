

import UIKit

class MTabBarController: UITabBarController {
    
        override func viewDidLoad() {
                super.viewDidLoad()
            
           // var window: UIWindow?
            //    private func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      //      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
                // Override point for customization after application launch.
                // print("Hello?")
                _ = MuseumAppViewMasterPackets.sharedViewMasterPackets()
                /**/
                /*        if packets != nil {
                 print("Success in AppDelegate --- found the plist")
                 }
                 else {
                 print("Problems reading plist")
                 }
                 print("Here's the categories: \(MuseumAppViewMasterPackets.packetCategories)")
                 let aCategory = "SHOWTIME"
                 print("Here's a categories dictionary entry: \(MuseumAppViewMasterPackets.categoriesDictionary![aCategory])")
                 print("Here's the whole categories dictionary: \(MuseumAppViewMasterPackets.categoriesDictionary!)")
                 let aLetter = "B"
                 print("Here's the B first letter dictionary: \(MuseumAppViewMasterPackets.titlesIndexDictionary![aLetter])")
                 print("Here's the packets sorted by number: \(MuseumAppViewMasterPackets.packetsSortedByNumber!)")
                 */
                
                //// Start REAL implementation...
                
                // For each table view screen we need to create a separate data source instance
                // We then need to create an instance of MuseumAppPacketsTableViewCOntroller with that data source instance.
                // Finally, we need to return a UINavigationController for each screen, with the MuseumAppPacketViewCOntroller
                //    as its root view controller
              //  let tabBarController = window?.inputViewController//rootViewController as! UITabBarController
                
                // The class for the data source is not important, but it must implement the
                //    MuseumAppPacketDataSourceProtocol (...and the UITableViewDataSource protocol, too?)
                var _ : MuseumAppPacketsTableDataSourceProtocol
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                var tempViewControllers = [UINavigationController]()
                
                // Now create our tab bar view controllers.
                // Since we already have one defined in the storyboard, we will create as many instances of it
                //    as we need for the different ways of display, and assign each its own data source.
                
                // Sorted by title...
                var tempNavController = storyBoard.instantiateViewController(withIdentifier: "navForTableView") as! UINavigationController
                var tempViewController = tempNavController.topViewController! as! MuseumAppPacketsTableViewController
                tempViewController.dataSource = MuseumAppPacketsSortedByTitleDataSource()
                tempViewControllers.append(tempNavController)
                
                // Sorted by date...
                tempNavController = storyBoard.instantiateViewController(withIdentifier: "navForTableView") as! UINavigationController
                tempViewController = tempNavController.topViewController! as! MuseumAppPacketsTableViewController
                tempViewController.dataSource = MuseumAppPacketsSortedByDateDataSource()
                tempViewControllers.append(tempNavController)
                
                // Sorted by category...
                tempNavController = storyBoard.instantiateViewController(withIdentifier: "navForTableView") as! UINavigationController
                tempViewController = tempNavController.topViewController! as! MuseumAppPacketsTableViewController
                tempViewController.dataSource = MuseumAppPacketsSortedByCategoryDataSource()
                tempViewControllers.append(tempNavController)
                
                // Sorted by date, as a grid...
                tempNavController = storyBoard.instantiateViewController(withIdentifier: "navForCollectionView") as! UINavigationController
                let tempGridViewController = tempNavController.topViewController! as! MuseumAppPacketsCollectionViewController
                tempGridViewController.dataSource = MuseumAppPacketsCollectionDataSource()
                tempViewControllers.append(tempNavController)
                // print("Got this far... Grid VC exists")
                
          //  tabBarController.viewControllers = tempViewControllers
            self.viewControllers = tempViewControllers
                
      //          return true
   //         }
            
    }
    
    
    override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                    // Dispose of any resources that can be recreated.
    }
    
    
        /*
         // MARK: - Navigation
     
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destinationViewController.
             // Pass the selected object to the new view controller.
         }
         */
    
    
}
