<#if BackgroundImage?? && BackgroundImage.getData() != "">

	<#assign
		background_image = BackgroundImage.getData()
	/>
<#else>
	<#assign
		background_image = "/o/port-theme/images/notebook_computer_chill_relax.jpg"
	/>
</#if>

<div class="photo-bg services site-banner" style="background-image: url(${background_image})">
	<div class="overlay">
		<#if Heading?? || Subheading??>
			<div class="heading">
				<h3>${Heading.getData()}</h3>
				<h4>${Subheading.getData()}</h4>
			</div>
		</#if>

		<ul class="cards">
			<#if ItemHeading.getSiblings()?has_content>
				<#list ItemHeading.getSiblings() as current_item>

					<li>
						<#if current_item.ItemImage?? && current_item.ItemImage.getData() != "">

							<img src="${current_item.ItemImage.getData()}" />

						<#else>

							<img src="/o/port-theme/images/${current_item.DefaultImage.getData()}" />

						</#if>

						<h4/>${current_item.getData()}</h4>

						<p>${current_item.ItemText.getData()}</p>
					</li>
				</#list>
			</#if>
		</ul>

	</div>

</div>