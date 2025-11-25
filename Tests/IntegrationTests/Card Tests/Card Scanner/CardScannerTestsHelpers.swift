//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

#if canImport(PlexyCardScanner)
    @testable import PlexyCard
    @testable import PlexyCardScanner

    internal class CardScannerProviderSpy: CardScannerProviding {
        private var completion: ((Result<PlexyCardScanner.CardScanDetails, Error>) -> Void)?

        func createCardScanner(
            completion: @escaping (Result<CardScannerCardDetails, Error>) -> Void
        ) -> UIViewController? {
            self.completion = completion
            return UIViewController()
        }

        func onScanComplete(result: Result<CardScannerCardDetails, Error>) {
            self.completion?(result)
        }
    }
#endif
