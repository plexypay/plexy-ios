//
// Copyright (c) 2020 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Foundation
import UIKit

/**
 An action handler component to perform any supported action out of the box.
 
 - SeeAlso:
 [Implementation Reference](https://github.com/plexy/plexy-ios#handling-an-action)
 */
public final class PlexyActionComponent: ActionComponent, ActionHandlingComponent {
    
    /// :nodoc:
    /// The context object for this component.
    public let context: PlexyContext
    
    /// The object that acts as the delegate of the action component.
    public weak var delegate: ActionComponentDelegate?
    
    /// The object that acts as the presentation delegate of the action component.
    public weak var presentationDelegate: PresentationDelegate?
    
    /// Action handling configurations.
    public var configuration: Configuration
    
    /// Action handling configurations.
    public struct Configuration: Localizable {

        /// Localization parameters.
        public var localizationParameters: LocalizationParameters?

        /// The UI style configurations.
        public var style: ActionComponentStyle = .init()

        /// Initializes a new instance
        ///
        /// - Parameters:
        ///   - localizationParameters: Localization parameters.
        ///   - style: The UI style configurations.
        public init(
            localizationParameters: LocalizationParameters? = nil,
            style: ActionComponentStyle = .init()
        ) {
            self.localizationParameters = localizationParameters
            self.style = style
        }
    }
    
    internal var currentActionComponent: Component?
    
    internal var appLauncher: AnyAppLauncher = AppLauncher()
    
    /// Initializes a new instance of `PlexyActionComponent`
    ///
    /// - Parameters:
    ///   - context: The context object.
    ///   - configuration: The configuration.
    public init(
        context: PlexyContext,
        configuration: Configuration = Configuration()
    ) {
        self.context = context
        self.configuration = configuration
    }
    
    // MARK: - Performing Actions
    
    /// Handles an action to complete a payment.
    ///
    /// - Parameter action: The action to handle.
    public func handle(_ action: Action) {

        sendHandleEvent(for: action)

        switch action {
        case let .redirect(redirectAction):
            handle(redirectAction)
        case let .await(awaitAction):
            handle(awaitAction)
        case let .redirectableAwait(redirectableAwaitAction):
            handle(redirectableAwaitAction)
        case let .voucher(voucher):
            handle(voucher)
        case let .qrCode(qrCode):
            handle(qrCode)
        case let .document(documentAction):
            handle(documentAction)
        }
    }
    
    private func sendHandleEvent(for action: Action) {
        let logEvent = AnalyticsEventLog(component: action.analyticsType, type: .action)
        context.analyticsProvider?.add(log: logEvent)
    }
    
    // MARK: - Private
    
    private func handle(_ action: RedirectAction) {
        let component = RedirectComponent(context: context)
        component.configuration.style = configuration.style.redirectComponentStyle
        component.delegate = delegate
        component._isDropIn = _isDropIn
        component.presentationDelegate = presentationDelegate
        currentActionComponent = component

        component.handle(action)
    }

    private func handle(_ action: AwaitAction) {
        let component = AwaitComponent(context: context)
        component.configuration.style = configuration.style.awaitComponentStyle
        component._isDropIn = _isDropIn
        component.delegate = delegate
        component.presentationDelegate = presentationDelegate
        component.configuration.localizationParameters = configuration.localizationParameters
        component.appLauncher = appLauncher
        
        component.handle(action)
        currentActionComponent = component
    }

    private func handle(_ action: RedirectableAwaitAction) {
        let component = AwaitComponent(context: context)
        component.configuration.style = configuration.style.awaitComponentStyle
        component._isDropIn = _isDropIn
        component.delegate = delegate
        component.presentationDelegate = presentationDelegate
        component.configuration.localizationParameters = configuration.localizationParameters
        component.appLauncher = appLauncher
        
        component.handle(action)
        currentActionComponent = component
    }

    private func handle(_ action: VoucherAction) {
        let component = VoucherComponent(context: context)
        component.configuration.style = configuration.style.voucherComponentStyle
        component._isDropIn = _isDropIn
        component.delegate = delegate
        component.presentationDelegate = presentationDelegate
        component.configuration.localizationParameters = configuration.localizationParameters
        
        component.handle(action)
        currentActionComponent = component
    }
    
    private func handle(_ action: QRCodeAction) {
        let component = QRCodeActionComponent(context: context)
        component.configuration.style = configuration.style.qrCodeComponentStyle
        component._isDropIn = _isDropIn
        component.delegate = delegate
        component.presentationDelegate = presentationDelegate
        component.configuration.localizationParameters = configuration.localizationParameters
        
        component.handle(action)
        currentActionComponent = component
    }
    
    private func handle(_ action: DocumentAction) {
        let component = DocumentComponent(context: context)
        component.configuration.style = configuration.style.documentActionComponentStyle
        component._isDropIn = _isDropIn
        component.delegate = delegate
        component.configuration.localizationParameters = configuration.localizationParameters
        component.presentationDelegate = presentationDelegate
        
        component.handle(action)
        currentActionComponent = component
    }
}

private extension Action {

    var analyticsType: String {
        switch self {
        case .redirect:
            return "redirect"
        case .await, .redirectableAwait:
            return "await"
        case .voucher, .document:
            return "voucher"
        case .qrCode:
            return "qrCode"
        }
    }
}
