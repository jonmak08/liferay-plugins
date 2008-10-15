/**
 * Copyright (c) 2000-2008 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package com.liferay.chat.model.impl;

import com.liferay.chat.model.Status;
import com.liferay.chat.model.StatusSoap;

import com.liferay.portal.kernel.bean.ReadOnlyBeanHandler;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.model.impl.BaseModelImpl;

import java.io.Serializable;

import java.lang.reflect.Proxy;

import java.sql.Types;

import java.util.ArrayList;
import java.util.List;

/**
 * <a href="StatusModelImpl.java.html"><b><i>View Source</i></b></a>
 *
 * @author Brian Wing Shun Chan
 *
 */
public class StatusModelImpl extends BaseModelImpl {
	public static final String TABLE_NAME = "Chat_Status";
	public static final Object[][] TABLE_COLUMNS = {
			{ "statusId", new Integer(Types.BIGINT) },
			

			{ "userId", new Integer(Types.BIGINT) },
			

			{ "modifiedDate", new Integer(Types.BIGINT) },
			

			{ "online", new Integer(Types.BOOLEAN) },
			

			{ "awake", new Integer(Types.BOOLEAN) },
			

			{ "activeBrowserKey", new Integer(Types.VARCHAR) }
		};
	public static final String TABLE_SQL_CREATE = "create table Chat_Status (statusId LONG not null primary key,userId LONG,modifiedDate LONG,online BOOLEAN,awake BOOLEAN,activeBrowserKey VARCHAR(75) null)";
	public static final String TABLE_SQL_DROP = "drop table Chat_Status";
	public static final String DATA_SOURCE = "liferayDataSource";
	public static final String SESSION_FACTORY = "liferaySessionFactory";
	public static final String TX_MANAGER = "liferayTransactionManager";
	public static final boolean CACHE_ENABLED = GetterUtil.getBoolean(com.liferay.util.service.ServiceProps.get(
				"value.object.finder.cache.enabled.com.liferay.chat.model.Status"),
			true);

	public static Status toModel(StatusSoap soapModel) {
		Status model = new StatusImpl();

		model.setStatusId(soapModel.getStatusId());
		model.setUserId(soapModel.getUserId());
		model.setModifiedDate(soapModel.getModifiedDate());
		model.setOnline(soapModel.getOnline());
		model.setAwake(soapModel.getAwake());
		model.setActiveBrowserKey(soapModel.getActiveBrowserKey());

		return model;
	}

	public static List<Status> toModels(StatusSoap[] soapModels) {
		List<Status> models = new ArrayList<Status>(soapModels.length);

		for (StatusSoap soapModel : soapModels) {
			models.add(toModel(soapModel));
		}

		return models;
	}

	public static final long LOCK_EXPIRATION_TIME = GetterUtil.getLong(com.liferay.util.service.ServiceProps.get(
				"lock.expiration.time.com.liferay.chat.model.Status"));

	public StatusModelImpl() {
	}

	public long getPrimaryKey() {
		return _statusId;
	}

	public void setPrimaryKey(long pk) {
		setStatusId(pk);
	}

	public Serializable getPrimaryKeyObj() {
		return new Long(_statusId);
	}

	public long getStatusId() {
		return _statusId;
	}

	public void setStatusId(long statusId) {
		if (statusId != _statusId) {
			_statusId = statusId;
		}
	}

	public long getUserId() {
		return _userId;
	}

	public void setUserId(long userId) {
		if (userId != _userId) {
			_userId = userId;
		}
	}

	public long getModifiedDate() {
		return _modifiedDate;
	}

	public void setModifiedDate(long modifiedDate) {
		if (modifiedDate != _modifiedDate) {
			_modifiedDate = modifiedDate;
		}
	}

	public boolean getOnline() {
		return _online;
	}

	public boolean isOnline() {
		return _online;
	}

	public void setOnline(boolean online) {
		if (online != _online) {
			_online = online;
		}
	}

	public boolean getAwake() {
		return _awake;
	}

	public boolean isAwake() {
		return _awake;
	}

	public void setAwake(boolean awake) {
		if (awake != _awake) {
			_awake = awake;
		}
	}

	public String getActiveBrowserKey() {
		return GetterUtil.getString(_activeBrowserKey);
	}

	public void setActiveBrowserKey(String activeBrowserKey) {
		if (((activeBrowserKey == null) && (_activeBrowserKey != null)) ||
				((activeBrowserKey != null) && (_activeBrowserKey == null)) ||
				((activeBrowserKey != null) && (_activeBrowserKey != null) &&
				!activeBrowserKey.equals(_activeBrowserKey))) {
			_activeBrowserKey = activeBrowserKey;
		}
	}

	public Status toEscapedModel() {
		if (isEscapedModel()) {
			return (Status)this;
		}
		else {
			Status model = new StatusImpl();

			model.setNew(isNew());
			model.setEscapedModel(true);

			model.setStatusId(getStatusId());
			model.setUserId(getUserId());
			model.setModifiedDate(getModifiedDate());
			model.setOnline(getOnline());
			model.setAwake(getAwake());
			model.setActiveBrowserKey(HtmlUtil.escape(getActiveBrowserKey()));

			model = (Status)Proxy.newProxyInstance(Status.class.getClassLoader(),
					new Class[] { Status.class }, new ReadOnlyBeanHandler(model));

			return model;
		}
	}

	public Object clone() {
		StatusImpl clone = new StatusImpl();

		clone.setStatusId(getStatusId());
		clone.setUserId(getUserId());
		clone.setModifiedDate(getModifiedDate());
		clone.setOnline(getOnline());
		clone.setAwake(getAwake());
		clone.setActiveBrowserKey(getActiveBrowserKey());

		return clone;
	}

	public int compareTo(Object obj) {
		if (obj == null) {
			return -1;
		}

		StatusImpl status = (StatusImpl)obj;

		long pk = status.getPrimaryKey();

		if (getPrimaryKey() < pk) {
			return -1;
		}
		else if (getPrimaryKey() > pk) {
			return 1;
		}
		else {
			return 0;
		}
	}

	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}

		StatusImpl status = null;

		try {
			status = (StatusImpl)obj;
		}
		catch (ClassCastException cce) {
			return false;
		}

		long pk = status.getPrimaryKey();

		if (getPrimaryKey() == pk) {
			return true;
		}
		else {
			return false;
		}
	}

	public int hashCode() {
		return (int)getPrimaryKey();
	}

	private long _statusId;
	private long _userId;
	private long _modifiedDate;
	private boolean _online;
	private boolean _awake;
	private String _activeBrowserKey;
}