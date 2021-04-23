package com.artech.controls;

import android.content.Context;
import android.net.Uri;

import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.common.ServicesImpl;
import com.artech.controls.media.GxMediaEditControl;
import com.artech.ui.Coordinator;
import com.genexus.testing.MyTestApplication;
import com.genexus.testing.TestingUtils;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import androidx.test.core.app.ApplicationProvider;

import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@RunWith(RobolectricTestRunner.class)
@Config(application = MyTestApplication.class)
public class GxMediaEditControlTest {
    private Coordinator mCoordinator;
    private GxMediaEditControl mControl;

    @Before
    public void setupControl() {
        Context context = ApplicationProvider.getApplicationContext();
        mCoordinator = mock(Coordinator.class);

        ControlInfo controlInfo = new ControlInfo();
        LayoutItemDefinition definition = TestingUtils.createControlDefinition(controlInfo);

        mControl = new GxMediaEditControl(context, mCoordinator, definition);
    }

    @Test
    public void verifyThatControlValueChangedEventIsNotTriggeredWhenControlValueIsSetByTheFramework() {
        mControl.setGxValue("file:///blablabla.png");

        verify(mCoordinator, never()).onValueChanged(eq(mControl), eq(true));
    }

    @Test
    public void verifyThatControlValueChangedEventIsTriggeredWhenControlValueIsChangedByTheUserToADifferentOne() {
        mControl.onMediaChanged(Uri.parse("file:///blablabla.png"));

        verify(mCoordinator, times(1)).onValueChanged(eq(mControl), eq(true));
    }
}
