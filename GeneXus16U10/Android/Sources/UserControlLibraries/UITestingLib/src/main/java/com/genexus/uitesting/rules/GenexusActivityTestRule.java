package com.genexus.uitesting.rules;

import androidx.test.espresso.IdlingRegistry;
import androidx.test.espresso.IdlingResource;
import androidx.test.rule.ActivityTestRule;

import com.artech.activities.StartupActivity;
import com.genexus.uitesting.idlingresources.LoadingIndicatorIdlingResource;

import java.util.ArrayList;
import java.util.List;

public class GenexusActivityTestRule<T extends StartupActivity> extends ActivityTestRule<T> {
    private List<IdlingResource> mIdlingResources;

    public GenexusActivityTestRule(Class<T> activityClass) {
        super(activityClass);
        mIdlingResources = new ArrayList<>(1);
    }

    @Override
    public T getActivity() {
        return super.getActivity();
    }

    @Override
    protected void afterActivityLaunched() {
        mIdlingResources.add(new LoadingIndicatorIdlingResource());
        for (IdlingResource res : mIdlingResources) {
            IdlingRegistry.getInstance().register(res);
        }
    }

    @Override
    protected void afterActivityFinished() {
        for (IdlingResource res : mIdlingResources) {
            IdlingRegistry.getInstance().unregister(res);
        }
    }
}
