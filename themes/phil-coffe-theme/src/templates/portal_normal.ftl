<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>
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
			<section id="social-icons">
				<div class="social-links">

					<ul>
						<#if facebook>
							<!-- FACEBOOK -->
							<li><a target="_blank" class="icon_facebook" title="Facebook" href="http://www.facebook.com"><i class="icon-facebook" aria-hidden="true"></i></a></li>
						</#if>

						<#if linkedin>
							<!-- LINKEDIN -->
							<li><a target="_blank" class="icon_linkedin" title="Linkedin" href="http://www.linkedin.com"><i class="icon-linkedin"></i></a></li>
						</#if>
						<#if instagram>
							<!-- INSTAGRAM -->
							<li><a target="_blank" class="icon_instagram" title="Instagram" href="http://www.instagram.com"><i class="icon-instagram"></i></a></li>
						</#if>
						<#if youtube>
							<!-- YOUTUBE -->
							<li><a target="_blank" class="icon_youtube" title="Youtube" href="http://www.youtube.com"><i class="icon-youtube"></i></a></li>
						</#if>
					</ul>
				</div>
			</section>

			<nav id="breadcrumbs">
				<@liferay.breadcrumbs />
			</nav>
			<h1 class="site-title">
				<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
				</a>

				<#if show_site_name>
					<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						${site_name}
					</span>
				</#if>
			</h1>
		</div>

		<#if !is_signed_in>
			<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
		</#if>

		<h1 id="website-name">${site_name}</h1>
		<div class="website-author">by ${user_name}</div><br>

		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>

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

	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
		</p>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>