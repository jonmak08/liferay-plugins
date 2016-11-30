<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<aui:form>
	<aui:select name="Select" value="select option" >
		<aui:option value="Option 1"><liferay-ui:message key="Option 1" /></aui:option>
		<aui:option value="Option 2"><liferay-ui:message key="Option 2" /></aui:option>
		<aui:option value="Option 3"><liferay-ui:message key="Option 3" /></aui:option>
	</aui:select>

	<aui:input name="Text" type="text" />
	<aui:input name="Checkbox" type="checkbox" />
	<aui:input name="Textarea" type="textarea" />
	<aui:input name="input name 4" type="editor" editorImpl="editor.wysiwyg.portal-web.docroot.html.taglib.ui.email_notification_settings.jsp" />
	<aui:input name="Radio" type="radio" />
</aui:form>