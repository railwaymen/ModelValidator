import Foundation

public protocol AnyOptionalType {
    var anyWrapped: Any? { get }
    static var anyWrappedType: Any.Type { get }
}

extension AnyOptionalType where Self: OptionalType {
    public var anyWrapped: Any? { self.wrapped }
    public static var anyWrappedType: Any.Type { WrappedType.self }
}

public protocol OptionalType: AnyOptionalType {
    associatedtype WrappedType
    var wrapped: WrappedType? { get }
    static func makeOptionalType(_ wrapped: WrappedType?) -> Self
}

// MARK: - OptionalType
extension Optional: OptionalType {
    public typealias WrappedType = Wrapped
    
    public var wrapped: Wrapped? { self }
    
    public static func makeOptionalType(_ wrapped: Wrapped?) -> Wrapped? {
        wrapped
    }
}
