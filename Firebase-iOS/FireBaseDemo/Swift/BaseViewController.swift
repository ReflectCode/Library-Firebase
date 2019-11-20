
import UIKit


import FirebaseAuth

public class BaseViewController : UIViewController {

    @IBOutlet weak var progress_circleOutlet: UIActivityIndicatorView!
    
    private var mProgressBar : UIActivityIndicatorView? = UIActivityIndicatorView()


    open func showProgressBar() -> Void {
        mProgressBar = progress_circleOutlet
        if mProgressBar == nil {
            mProgressBar = UIActivityIndicatorView()
        }

        mProgressBar!.isHidden = false; mProgressBar!.startAnimating()
    }


    open func hideProgressBar() -> Void {
        mProgressBar = progress_circleOutlet
        if mProgressBar != nil && !mProgressBar!.isAnimating ==  false {
            mProgressBar!.isHidden = true; mProgressBar!.stopAnimating()
        }
    }


    open func getUid() -> String?{
        return Auth.auth().currentUser!.providerID
    }

}
