<#assign
	facebook = getterUtil.getBoolean(themeDisplay.getThemeSetting("facebook"))
	facebookUrl = themeDisplay.getThemeSetting("Facebook-address")
	Instagram = getterUtil.getBoolean(themeDisplay.getThemeSetting("Instagram"))
	instagramUrl = themeDisplay.getThemeSetting("Instagram-channel")
	Linkedin = getterUtil.getBoolean(themeDisplay.getThemeSetting("Linkedin"))
	linkedinUrl = themeDisplay.getThemeSetting("Linkedin-page")
	showTitle = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-title"))
	showCreator = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-author"))
	siteCreator = themeDisplay.getThemeSetting("creator")
	siteTitle = themeDisplay.getThemeSetting("title")
	Youtube = getterUtil.getBoolean(themeDisplay.getThemeSetting("Youtube"))
	youtubeUrl = themeDisplay.getThemeSetting("Youtube-channel")
/>

	<#if has_navigation && is_setup_complete>
			<#assign navbar_true = true />
	</#if>