
import UIKit


public class aUser : Codable {


    open var username : String? = ""
    open var email : String? = ""

    init(){
        // Default constructor required for calls to DataSnapshot.getValue(aUser.class)
    }

    init(_ username: String?, _ email: String?){
        self.username = username!
        self.email = email!
    }
}
