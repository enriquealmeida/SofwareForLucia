package $Main.AndroidPackageName$;

import com.artech.providers.EntityDataProvider;

public class AppEntityDataProvider extends EntityDataProvider
{
	public AppEntityDataProvider()
	{
		EntityDataProvider.AUTHORITY = "$Main.AndroidPackageName$.appentityprovider";
		EntityDataProvider.URI_MATCHER = buildUriMatcher();
	}
}
