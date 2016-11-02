<#assign
	off_screen_navigation = getterUtil.getBoolean(themeDisplay.getThemeSetting("off-screen-desktop-navigation"))
	nav_wrapper_class = ""
/>

<#if !off_screen_navigation>
	<#assign
		nav_wrapper_class = "onscreen-nav"
	/>
</#if>

