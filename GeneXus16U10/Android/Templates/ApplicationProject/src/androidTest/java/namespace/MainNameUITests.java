package $Main.AndroidPackageName$;

import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.filters.LargeTest;

import com.artech.activities.StartupActivity;
import com.artech.base.services.IGxProcedure;
import com.artech.layers.GxObjectFactory;
import com.genexus.uitesting.rules.GenexusActivityTestRule;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(AndroidJUnit4.class)
@LargeTest
public class $Main.Name$UITests {
    @Rule
    public GenexusActivityTestRule<StartupActivity> mActivityRule = new GenexusActivityTestRule<>(StartupActivity.class);

$Main.GxTest4UITestRelatedObjectNames:{ testName |
    @Test
    public void test$testName$() {
        IGxProcedure proc = GxObjectFactory.getProcedure("$testName; format="Lower"$");
        proc.execute(null);
    \}
}; separator="\n"$
}
