import Foundation

open class UserManager {

    private static var mInstance: UserManager!

	public static func getInstance() -> UserManager {
		if nil == mInstance {
			mInstance = UserManager()
		}

		return mInstance
	}

	public func printUserInfo() {
		print("printUserInfo")
	}
}
