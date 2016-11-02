<#assign
	off_screen_navigation = getterUtil.getBoolean(themeDisplay.getThemeSetting("Off Screen Desktop Navigation"))
	nav_wrapper_class = ""
	color_scheme = themeDisplay.getThemeSetting('Color Scheme')
	wrapper_class = "container-fluid"
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

