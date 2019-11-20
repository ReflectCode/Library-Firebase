package com.reflectcode.demo.firebase;

import android.view.View;
import android.widget.ProgressBar;
import androidx.appcompat.app.AppCompatActivity;
import com.google.firebase.auth.FirebaseAuth;

public class BaseActivity extends AppCompatActivity {

    private ProgressBar mProgressBar;

    public void showProgressBar() {
        mProgressBar = (ProgressBar) findViewById(R.id.progress_circle);
        if (mProgressBar == null) {
            mProgressBar = new ProgressBar(this);
        }

        mProgressBar.setVisibility(View.VISIBLE);
    }

    public void hideProgressBar() {
        mProgressBar = (ProgressBar) findViewById(R.id.progress_circle);
        if (mProgressBar != null && mProgressBar.getVisibility() == View.VISIBLE) {
            mProgressBar.setVisibility(View.INVISIBLE);
        }
    }

    public String getUid() {
        return FirebaseAuth.getInstance().getCurrentUser().getUid();
    }

}
