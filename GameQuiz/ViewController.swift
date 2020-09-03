
// Swift
//
// Add this to the header of your file, e.g. in ViewController.swift

import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current,
            !token.isExpired {
        }
    
      
    }
    @IBAction func btnFacebook(_ sender: Any) {
       facebooklogin()
    }
    
    func facebooklogin() {
       let loginManager = LoginManager()
        loginManager.logIn(permissions: [Permission.publicProfile], viewController : self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login")
            case .success(let grantedPermissions,
                          let declinedPermissions,
                          let accessToken):
                print("Logged in")
                self.returnUserData()
            }
        }
    }


    func returnUserData() {
        let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"email,name"])
       graphRequest.start(completionHandler: { (connection, result, error) -> Void in
          if ((error) != nil) {
              // Process error
              print(error)
           } else {
                 let resultDic = result as! NSDictionary
                
                 if (resultDic.value(forKey:"name") != nil) {
                     let userName = resultDic.value(forKey:"name")! as! String as NSString?
                   
                  }

                 if (resultDic.value(forKey:"email") != nil) {
                     let userEmail = resultDic.value(forKey:"email")! as! String as NSString?
                    
                  }
             }
        })
     }
}
