<#assign
	off_screen_navigation = getterUtil.getBoolean(themeDisplay.getThemeSetting("off-screen-desktop-navigation"))
	nav_wrapper_class = ""
	color_scheme = themeDisplay.getThemeSetting("navigation-color-scheme")
	accent_color = themeDisplay.getThemeSetting("Accent Color")
	accent_class = accent_color + "-theme"
	wrapper_class = "container-fluid " + accent_class
/>

<#if !off_screen_navigation>
	<#assign
		nav_wrapper_class = "onscreen-nav"
	/>
</#if>

<#if color_scheme == "light">
	<#assign
		wrapper_class = wrapper_class + " light-theme"
	/>
</#if>
