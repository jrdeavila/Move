package com.mevo.taxis

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.google.firebase.FirebaseApp
import com.google.firebase.appcheck.FirebaseAppCheck
import com.google.firebase.appcheck.playintegrity.PlayIntegrityAppCheckProviderFactory
import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.os.Bundle

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.mevo.taxis/foreground"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            FirebaseApp.initializeApp(/*context=*/this)
            val firebaseAppCheck = FirebaseAppCheck.getInstance()
            firebaseAppCheck.installAppCheckProviderFactory(
                   PlayIntegrityAppCheckProviderFactory.getInstance()
            )
        }
          // Configuración del canal de método
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "bringAppToFront") {
                bringAppToFront()
                result.success("App enfocada nuevamente")
            } else {
                result.notImplemented()
            }
        }
    }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
  }


  fun bringAppToFront() {
    val activityManager = getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
    val tasks = activityManager.getRunningTasks(Integer.MAX_VALUE)

    for (task in tasks) {
      if (task.baseActivity?.packageName == packageName) {
        val intent = Intent(applicationContext, MainActivity::class.java)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
        startActivity(intent)
        break
      }
    }
  }
}