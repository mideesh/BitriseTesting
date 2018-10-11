package com.bitrisetesting.mideesh.bitrisetesting

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.crashlytics.android.Crashlytics
import io.fabric.sdk.android.Fabric
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Fabric.with(this, Crashlytics())
        setContentView(R.layout.activity_main)
        val manager = this.packageManager
        val info = manager.getPackageInfo(this.packageName, 0)
        tv.text = "Version name : " + info.versionName + "\nVersion code : " + info.versionCode;
    }
}
