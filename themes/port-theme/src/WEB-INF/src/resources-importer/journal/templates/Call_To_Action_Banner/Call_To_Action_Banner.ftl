<#if BackgroundImage?? && BackgroundImage.getData() != "">
	<#assign
		background_image = BackgroundImage.getData()
	/>
<#else>
	<#assign
		background_image = "/o/port-theme/images/traffic.jpg"
	/>
</#if>

<div class="photo-bg site-banner" style="background-image: url(${background_image})">
	<div class="overlay">

		<div class="call-to-action">
			<h3>${CallToAction.getData()}</h3>

			<button class="btn btn-complement">
				<#if LinkToPage??>
					<#assign link_to_page = LinkToPage.getFriendlyUrl() />
				<#else>
					<#assign link_to_page = "./portfolio" />
				</#if>

				<a href="${link_to_page}">
					${ButtonText.getData()}
				</a>
			</button>
		</div>

	</div>

</div>
