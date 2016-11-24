<#if BackgroundImage?? && BackgroundImage.getData() != "">
	<#assign
		background_image = BackgroundImage.getData()
	/>
<#else>
	<#assign
		background_image = "/o/port-theme/images/port_banner.jpg"
	/>
</#if>

<div class="${BannerSize.getData()}-banner jumbotron photo-bg" style="background-image: url(${background_image})">

	<div class="banner-content">
		<h1>${Heading.getData()}</h1>

		<h4>${Subheading.getData()}</h4>
	</div>

</div>