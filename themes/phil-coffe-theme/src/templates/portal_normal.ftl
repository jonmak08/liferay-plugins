<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">
<head>
	<title>${siteTitle}</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"] page=top_head_include />
</head>
<body class="${css_class}">
<@liferay_ui["quick-access"] contentId="#main-content" />
<@liferay_util["include"] page=body_top_include />
<@liferay.control_menu />
<div class="container-fluid" id="wrapper">
	<header id="banner" role="banner">
		<div id="heading">
			<section class="social-icons">
				<div class="social-links">
					<ul>
						<label class="follow">follow us: </label>
						<#if facebook>
							<li>
								<a class="icon_facebook" href="${facebookUrl}" target="_blank" title="Facebook" ><i class="icon-facebook"></i></a>
							</li>
						</#if>

						<#if Linkedin>
							<li>
								<a class="icon_linkedin" href="${linkedinUrl}" target="_blank" title="Linkedin" ><i class="icon-linkedin"></i></a>
							</li>
						</#if>

						<#if Instagram>
							<li>
								<a class="icon_instagram" href="${instagramUrl}" target="_blank" title="Instagram" ><i class="icon-instagram"></i></a>
							</li>
						</#if>

						<#if Twitter>
							<li>
								<a class="icon_twitter" href="${twitterUrl}" target="_blank" title="Twitter" ><i class="icon-twitter"></i></a>
							</li>
						</#if>

						<#if Pinterest>
							<li>
								<a class="icon_pinterest" href="${pinterestUrl}" target="_blank" title="Pinterest" ><i class="icon-pinterest"></i></a>
							</li>
						</#if>

						<#if Youtube>
							<li>
								<a class="icon_youtube" href="${youtubeUrl}" target="_blank" title="Youtube" ><i class="icon-youtube"></i></a>
							</li>
						</#if>
					</ul>
				</div>
			</section>

		</div>
		<div class="website-header">
			<#if showTitle>
				<h1 class="website-name">${siteTitle}</h1>
			</#if>

			<#if showCreator>
				<div class="website-author">by ${siteCreator}</div><br>
			</#if>

			<#if has_navigation && is_setup_complete>
				<nav class="${nav_css_class}" data-offset-top="100" data-spy="affix" id="navigation" role="navigation">
					<div class="${nav_css_class} site-navigation" id="navigation" role="navigation">
						<@liferay.navigation_menu default_preferences="${freeMarkerPortletPreferences}" />
					</div>
				</nav>
			</#if>
		</div>

	</header>

	<section id="content">
		<h1 class="hide-accessible">${the_title}</h1>
		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer class="website-footer" id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
		</p>
		<#if !is_signed_in>
			<div class="sign-in">
				<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
			</div>
		<#else>
			<div class="sign-in">
				<div class="website-author">Welcome ${siteCreator}, you are signed in</div><br>
			</div>
		</#if>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>