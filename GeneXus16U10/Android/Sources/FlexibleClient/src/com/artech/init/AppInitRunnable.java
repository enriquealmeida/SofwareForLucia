package com.artech.init;

import android.content.Context;

import com.artech.android.ContextImpl;
import com.artech.base.metadata.loader.ApplicationLoader;
import com.artech.base.metadata.loader.LoadResult;
import com.artech.base.metadata.loader.SyncManager;
import com.artech.base.services.Services;

public class AppInitRunnable implements Runnable {
    private final Context mContext;
    private final ApplicationLoader mApplicationLoader;
    private final Listener mListener;
    private final SyncManager.Listener mSyncListener;

    public AppInitRunnable(Context context,
                           ApplicationLoader applicationLoader,
                           Listener listener,
                           SyncManager.Listener syncListener) {
        mContext = context;
        mApplicationLoader = applicationLoader;
        mListener = listener;
        mSyncListener = syncListener;
    }

    @Override
    public void run() {
        LoadResult loadResult;

        try {
            // Load the Application.
            loadResult = mApplicationLoader.loadApplication(new ContextImpl(mContext), mContext, mSyncListener);
        } catch (OutOfMemoryError ex) {
            // Notify the user that the app could not load correctly due to reduced memory.
            loadResult = LoadResult.error(ex);
        }

        if (loadResult.getCode() == LoadResult.RESULT_OK) {
            Services.Application.clearData();
            Services.Application.notifyMetadataLoadFinished();
        }

        LoadResult finalLoadResult = loadResult;
        Services.Device.runOnUiThread(() -> mListener.onAppInitFinished(finalLoadResult));
    }

    public interface Listener {
        void onAppInitFinished(LoadResult loadResult);
    }
}
