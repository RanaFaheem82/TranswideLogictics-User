import UIKit
import GooglePlaces
import GoogleMapsBase

//MARK:- SearchPlacesViewControllerDelegate
protocol SearchPlacesViewControllerDelegate : class{
    func getAddress(Address : NSAttributedString , LocationID : String)
}

class SearchPlacesViewController: BaseViewController {
    
    @IBOutlet weak var resultText: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var PlacePridictions : [GMSAutocompletePrediction] = []
    var fetcher: GMSAutocompleteFetcher?
    var delegate : SearchPlacesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.becomeFirstResponder()
        view.backgroundColor = .white
        self.autoCompleteFilter()
    }
    @objc func textFieldDidChange(textField: UITextField) {
        fetcher?.sourceTextHasChanged(textField.text!)
    }
    func autoCompleteFilter(){
        
        edgesForExtendedLayout = []
        let filter = GMSAutocompleteFilter()
        filter.type = .establishment
        let token: GMSAutocompleteSessionToken = GMSAutocompleteSessionToken.init()
        fetcher = GMSAutocompleteFetcher()
        fetcher?.delegate = self
        fetcher?.provide(token)
        
        textField?.addTarget(self, action: #selector(textFieldDidChange(textField:)),
                             for: .editingChanged)
        
    }
    
}
//MARK:- GMSAutocompleteFetcherDelegate
extension SearchPlacesViewController: GMSAutocompleteFetcherDelegate {
    func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        self.PlacePridictions = predictions
        self.tableView.reloadData()
    }
    
    func didFailAutocompleteWithError(_ error: Error) {
        self.showAlertView(message: error.localizedDescription, title: "")
    }
}
//MARK:- TABLEVIEW METHODS

extension SearchPlacesViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.PlacePridictions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"PlacesTableViewCell", for: indexPath) as! PlacesTableViewCell
        cell.configureView(place: PlacePridictions[indexPath.row].attributedFullText )
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let del = self.delegate{
            del.getAddress(Address:  PlacePridictions[indexPath.row].attributedFullText, LocationID: PlacePridictions[indexPath.row].placeID)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
