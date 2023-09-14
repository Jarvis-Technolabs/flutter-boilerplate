package jarvis.architecture

import android.app.Activity
import android.content.pm.PackageManager
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

class JailBreakMethodChannelHandler() {

    companion object {
        private const val METHOD_CHANNEL_JAIL_BREAK = "jailBreakChannel"
        private val PACKAGE_LIST = arrayOf("me.shingle.fridaserver")
    }

    fun registerWith(dartExecutor: DartExecutor, activity: Activity) {
        MethodChannel(
            dartExecutor.binaryMessenger,
            METHOD_CHANNEL_JAIL_BREAK
        ).setMethodCallHandler { call, result ->
            var status = false

            try {
                val packageManager: PackageManager = activity.packageManager

                for (packageName in PACKAGE_LIST) {
                    packageManager.getPackageInfo(packageName, PackageManager.GET_ACTIVITIES)
                }
                status = true
            } catch (e: PackageManager.NameNotFoundException) {

            }
            result.success(status)
        }
    }
}