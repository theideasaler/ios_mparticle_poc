package com.example.mparticle_poc

import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity;
import com.mparticle.MParticle
import com.mparticle.MParticleOptions

class MainActivity: FlutterFragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val mParticleKey = "key"
        val mParticleSecret = "secret"
        val options = MParticleOptions.builder(this)
            .credentials(mParticleKey, mParticleSecret)
            .environment(MParticle.Environment.Development)
            .dataplan("dataPlanId", 1)
            .build()
        MParticle.start(options)
    }
}
