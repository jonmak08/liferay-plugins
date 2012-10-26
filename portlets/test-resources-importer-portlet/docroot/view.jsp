<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
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
if (!themeDisplay.isSignedIn()) {
%>

	Please sign in to run the test.

<%
	return;
}

ServletContext servletContext = getServletContext();

String[] importers = {"custom", "lar", "resource"};

for (String importer : importers) {
	Group group = GroupLocalServiceUtil.fetchGroup(themeDisplay.getCompanyId(), "Test Resources Importer Portlet");

	if (group != null) {
		GroupLocalServiceUtil.deleteGroup(group);
	}

	String resourcesPath = servletContext.getRealPath("/WEB-INF/classes/resources-importer");

	FileUtil.deltree(resourcesPath);
	FileUtil.mkdirs(resourcesPath);

	if (importer.equals("lar") || importer.equals("resource")) {
		String importerPath = servletContext.getRealPath("WEB-INF/classes/test/" + importer);

		FileUtil.copyDirectory(importerPath, resourcesPath);
	}

	Message message = new Message();

	message.put("command", "deploy");
	message.put("servletContextName", "test-resources-importer-portlet");

	message.setResponseDestinationName("liferay/resources_importer");

	Map<String, Object> responseMap = (Map<String, Object>)MessageBusUtil.sendSynchronousMessage(DestinationNames.HOT_DEPLOY, message);

	long groupId = GetterUtil.getLong(responseMap.get("groupId"));
%>

	<h3>

		<c:choose>
			<c:when test='<%= importer.equals("custom") %>'>
				Custom Resource Directory
			</c:when>
			<c:when test='<%= importer.equals("lar") %>'>
				Default LAR File
			</c:when>
			<c:when test='<%= importer.equals("resource") %>'>
				Default Resource Directory
			</c:when>
		</c:choose>
	</h3>

	<p>
		GroupLocalServiceUtil#fetchGroup=<%= _assertTrue(GroupLocalServiceUtil.fetchGroup(groupId) != null) %><br />

		<%
		if (groupId == 0) {
			continue;
		}

		LayoutSet layoutSet = LayoutSetLocalServiceUtil.getLayoutSet(groupId, false);
		%>

		LayoutSet#getPageCount=<%= _assertEquals(5, layoutSet.getPageCount()) %>
	</p>

	<p>

		<%
		DLFileEntry dlFileEntry = DLFileEntryLocalServiceUtil.fetchFileEntry(groupId, DLFolderConstants.DEFAULT_PARENT_FOLDER_ID, "company_logo");

		String[] assetTagNames = AssetTagLocalServiceUtil.getTagNames(DLFileEntry.class.getName(), dlFileEntry.getFileEntryId());
		%>

		AssetTagLocalServiceUtil#getTagNames=<%= _assertTrue(ArrayUtil.contains(assetTagNames, "logo")) %>
	</p>

	<p>
		DLFileEntryLocalServiceUtil#getFileEntriesCount=<%= _assertEquals(1, DLFileEntryLocalServiceUtil.getFileEntriesCount(groupId, DLFolderConstants.DEFAULT_PARENT_FOLDER_ID)) %><br />
	</p>

	<p>

		<%
		JournalArticle journalArticle = JournalArticleLocalServiceUtil.getArticle(groupId, "CHILD-WEB-CONTENT-1");
		%>

		JournalArticle#isTemplateDriven=<%= _assertTrue(journalArticle.isTemplateDriven()) %><br />

		JournalArticleLocalService#getArticlesCount=<%= _assertEquals(5, JournalArticleLocalServiceUtil.getArticlesCount(groupId)) %><br />

		<%
		JournalStructure journalStructure = JournalStructureLocalServiceUtil.getStructure(groupId, "CHILD-STRUCTURE-1");

		String parentStructureId = journalStructure.getParentStructureId();
		%>

		JournalStructure#getParentStructureId=<%= _assertEquals("PARENT-STRUCTURE", parentStructureId) %><br />

		JournalStructureLocalServiceUtil#getStructuresCount=<%= _assertEquals(3, JournalStructureLocalServiceUtil.getStructuresCount(groupId)) %><br />

		<%
		JournalTemplate journalTemplate = JournalTemplateLocalServiceUtil.getTemplate(groupId, "CHILD-TEMPLATE-1");

		String journalStructureId = journalTemplate.getStructureId();
		%>

		JournalTemplate#getStructureId=<%= _assertEquals("CHILD-STRUCTURE-1", journalStructureId) %><br />

		JournalTemplateLocalServiceUtil#getTemplatesCount=<%= _assertEquals(2, JournalTemplateLocalServiceUtil.getTemplatesCount(groupId)) %><br />
	</p>

<%
}
%>

<%!
private static String _assertEquals(Object expected, Object actual) {
	return _assertTrue(Validator.equals(expected, actual));
}

private static String _assertTrue(boolean value) {
	if (value) {
		return "PASSED";
	}
	else {
		return "FAILED";
	}
}
%>