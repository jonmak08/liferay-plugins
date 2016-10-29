<#if BackgroundImage.getData()?? && BackgroundImage.getData() != "">
	<#assign
		img_url = BackgroundImage.getData()
	/>
</#if>

<div class="full-page-banner jumbotron photo-bg" style="background-image: url(${img_url})">
	<div class="banner-content">
		<h1>${Heading.getData()}</h1>
		<h4>${Subheading.getData()}</h4>
	</div>
</div>