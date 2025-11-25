//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Provides access to injected dependencies.
@_spi(PlexyInternal)
public struct PlexyDependencyValues {
    
    /// The currently injected values
    fileprivate static var current = PlexyDependencyValues()
    
    /// Stores the testValues during ``runTestWithValues``
    private var storage: [ObjectIdentifier: Any] = [:]
    
    /// A subscript for updating the `currentValue` of `PlexyDependencyKey` instances.
    public subscript<K>(key: K.Type) -> K.Value where K: PlexyDependencyKey {
        get {
            let override = (storage[ObjectIdentifier(key)] as? K.Value)
            
            #if canImport(XCTest)
                if override != nil {
                    print("No test value override provided for \(key)")
                }
            #endif
            
            return override ?? key.liveValue
        }
        set {
            storage[ObjectIdentifier(key)] = newValue
        }
    }
    
    /// A static subscript accessor for updating and references dependencies directly.
    ///
    /// Used only by ``PlexyDependency`` to get the current value for a dependency
    fileprivate subscript<T>(_ keyPath: KeyPath<PlexyDependencyValues, T>) -> T { self[keyPath: keyPath] }
    
    /// Supply custom test values for specific dependencies
    ///
    /// To supply test values for a whole class you can override the `run` function of `XCTestCase` like:
    /// ```swift
    /// override func run() {
    ///     PlexyDependencyValues.runTestWithValues {
    ///         $0.dependencyToOverride = TestDependency()
    ///     } perform: {
    ///         super.run()
    ///    }
    /// }
    /// ```
    internal static func runTestWithValues(
        _ setup: (inout PlexyDependencyValues) -> Void,
        perform: () -> Void
    ) {
        let currentValues = current
        
        var testValues = PlexyDependencyValues()
        setup(&testValues)
        
        current = testValues
        perform()
        current = currentValues
    }
}

// MARK: - Property wrapper

@_spi(PlexyInternal)
@propertyWrapper
public struct PlexyDependency<T> {
    private let keyPath: KeyPath<PlexyDependencyValues, T>
    public var wrappedValue: T { PlexyDependencyValues.current[keyPath] }
    
    public init(_ keyPath: KeyPath<PlexyDependencyValues, T>) {
        self.keyPath = keyPath
    }
}

// MARK: - DependencyKey Protocol

@_spi(PlexyInternal)
public protocol PlexyDependencyKey {
    associatedtype Value
    static var liveValue: Self.Value { get }
}
