package com.shop.util;

import com.opensymphony.oscache.base.NeedsRefreshException;
import com.opensymphony.oscache.general.GeneralCacheAdministrator;

public class CacheManager {
	public static String cachekey;
	public static GeneralCacheAdministrator cacheadmin = new GeneralCacheAdministrator();

	public static Object getFromCache(String cachekey) {
		Object obj = null;
		try {
			obj = cacheadmin.getFromCache(cachekey);
		} catch (NeedsRefreshException e) {
			return null;
		}
		return obj;
	}

	public static void putInCache(String key, Object content) {
		cacheadmin.putInCache(key, content);
	}

	public static Object getFromCache(String key, int refreshPeriod) {
		Object obj = null;
		try {
			obj = cacheadmin.getFromCache(key, refreshPeriod);
		} catch (NeedsRefreshException e) {
			return null;
		}
		return obj;
	}

	public static Object getKeyCache(String key, int refreshPeriod) {
		Object obj = null;
		try {
			obj = cacheadmin.getFromCache(cachekey + key, refreshPeriod);
		} catch (NeedsRefreshException e) {
			return null;
		}
		return obj;
	}

	public static void putKeyCache(String key, Object content) {
		cacheadmin.putInCache(cachekey + key, content);
	}

	public static void removeCache(String key) {
		cacheadmin.removeEntry(key);
	}

	public static void resetKey(String key, Object object) {
		cacheadmin.removeEntry(key);
		cacheadmin.putInCache(key, object);
	}
}
