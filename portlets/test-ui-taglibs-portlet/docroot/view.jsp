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

<%@ include file="/init.jsp" %>


<%
String tabs1 = ParamUtil.getString(request, "tabs1", "Button");

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setWindowState(WindowState.NORMAL);

portletURL.setParameter("struts_action", "/test-mobile-responsive/view");
portletURL.setParameter("tabs1", tabs1);

String tabNames = "Button,Navbar,Navbar Search,Row,Input,Icon Menu,Display Style";

%>

<liferay-ui:tabs
	names="<%= tabNames %>"
	url="<%= portletURL.toString() %>"
/>

<c:choose>
	<c:when test='<%= tabs1.equals("Button") %>'>
		<%@ include file="/button.jsp" %>
	</c:when>
	<c:when test='<%= tabs1.equals("Navbar") %>'>
		<%@ include file="/navbar.jsp" %>
	</c:when>
	<c:when test='<%= tabs1.equals("Navbar Search") %>'>
		<%@ include file="/navbar_search.jsp" %>
	</c:when>
	<c:when test='<%= tabs1.equals("Row") %>'>
		<%@ include file="/row.jsp" %>
	</c:when>
	<c:when test='<%= tabs1.equals("Input") %>'>
		<%@ include file="/input.jsp" %>
	</c:when>
	<c:when test='<%= tabs1.equals("Icon Menu") %>'>
		<%@ include file="/icon_menu.jsp" %>
	</c:when>
	<c:when test='<%= tabs1.equals("Display Style") %>'>
		<%@ include file="/display_style.jsp" %>
	</c:when>
</c:choose>
