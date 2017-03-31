<div class="bio">
	<h4>${Name.getData()}</h4>

	<div class="bio-content">
		<#if PersonImage?? && PersonImage.getData() != "">
			<#assign
				person_image_url = PersonImage.getData()
			/>
		<#else>
			<#assign
				person_image_url = PersonDefaultURL.getData()
			/>
		</#if>

		<img  alt="${Name.getData()}" src="${person_image_url}">
		<p>${Bio.getData()}</p>
	</div>

</div>