import UIKit

final class FirstViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var slider: UISlider?

    // MARK: - Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        tabBarItem = UITabBarItem(
            title: "FIRST",
            image: .init(systemName: "circle.fill"),
            tag: 0
        )

        // We use the unqualified name as identifier. It must be unqique for
        // siblings in the object graph, but global uniqueness is not required.
        //
        // This controller is initially created before
        // `application(_:willFinishLaunchingWithOptions:)` returns. Thus, we
        // don't have to restore the controller itself (only its internal state,
        // see below).
        //
        // Setting a non-nil `String` as its `restorationIdentifier` ensures
        // this view controller and its children can take part in state
        // restoration.
        restorationIdentifier = String(describing: type(of: self))
    }

    // MARK: - State Restoring

    // We must restore the slider's state manually. These methods are only called
    // when the controller's `restorationIdentifier` is not nil, and the app
    // has opted into state restoration (see `AppDelegate.swift`).

    private static let encodingKeySliderValue = "encodingKeySliderValue"

    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        guard let slider, isViewLoaded else {
            return
        }

        coder.encode(slider.value, forKey: Self.encodingKeySliderValue)
    }

    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        assert(
            isViewLoaded,
            "We assume the controller is never restored without loading its view First."
            print("GitHub testing")
        )
        slider?.value = coder.decodeFloat(forKey: Self.encodingKeySliderValue)
    }

    override func applicationFinishedRestoringState() {
        print("Finished restoring everything.")
    }
}
