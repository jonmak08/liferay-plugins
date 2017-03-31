<nav class="${nav_css_class}" id="navigation" role="navigation">
	<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>
	<label class="nav-trigger-close" for="nav-trigger">
		<svg class="lexicon-icon">
			<use xlink:href="${themeDisplay.getPathThemeImages()}/lexicon/icons.svg#times" />
		</svg>
	</label>

	<ul aria-label="<@liferay.language key="site-pages" />" role="menubar">
		<#list nav_items as nav_item>
			<#assign
				nav_item_attr_has_popup = ""
				nav_item_attr_selected = ""
				nav_item_css_class = ""
				nav_item_layout = nav_item.getLayout()
				nav_has_children_class = ""
			/>

			<#if nav_item.isSelected()>
				<#assign
					nav_item_attr_has_popup = "aria-haspopup='true'"
					nav_item_attr_selected = "aria-selected='true'"
					nav_item_css_class = "selected"
				/>
			</#if>

			<#if nav_item.hasChildren()>
				<#assign
					nav_has_children_class = "nav-has-children"
					nav_is_checked = ""
				/>
			</#if>

			<#if nav_item.hasChildren() && nav_item.isSelected()>
				<#assign
					nav_is_checked = "checked"
				/>
			</#if>

			<li ${nav_item_attr_selected} class="${nav_item_css_class} ${nav_has_children_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>

				<#if nav_item.hasChildren()>

					<input  class="child-menu-trigger" id="children_${nav_item.getLayoutId()}" type="checkbox" ${nav_is_checked}>
					<label for="children_${nav_item.getLayoutId()}" id="toggle-child-menu-btn">
						<svg class="lexicon-icon show-child">
							<use xlink:href="${themeDisplay.getPathThemeImages()}/lexicon/icons.svg#angle-right" />
						</svg>
						<svg class="hide-child lexicon-icon">
							<use xlink:href="${themeDisplay.getPathThemeImages()}/lexicon/icons.svg#angle-down" />
						</svg>
					</label>

					<div class="child-menu-wrapper">
						<ul class="child-menu" role="menu">
							<#list nav_item.getChildren() as nav_child>
								<#assign
									nav_child_attr_selected = ""
									nav_child_css_class = ""
								/>

								<#if nav_child.isSelected()>
									<#assign
										nav_child_attr_selected = "aria-selected='true'"
										nav_child_css_class = "selected"
									/>
								</#if>

								<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
									<svg class="child-item-icon lexicon-icon">
										<use xlink:href="${themeDisplay.getPathThemeImages()}/lexicon/icons.svg#reply" />
									</svg>
									<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
								</li>
							</#list>
						</ul>
					</div>

				</#if>
			</li>
		</#list>

		<#if !is_signed_in>
			<li>
				<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
			</li>
		</#if>

	</ul>
</nav>