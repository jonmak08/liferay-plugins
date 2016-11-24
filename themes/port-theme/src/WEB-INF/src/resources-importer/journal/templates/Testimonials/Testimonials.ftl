<div class="group-testimonials testimonials">
	<ul class="cards">
		<#if PersonName.getSiblings()?has_content>
			<#list PersonName.getSiblings() as person>

				<li>
					<#if person.PersonImage?? && person.PersonImage.getData() != "">
						<#assign
							person_image = person.PersonImage.getData()
						/>
					<#else>
						<#assign
							person_image = "/o/port-theme/images/person.jpg"
						/>
					</#if>

					<img  alt="${person.getData()}" src="${person_image}" />

					<p>"${person.PersonTestimonial.getData()}"</p>

					<h5>- ${person.getData()}</h5>
				</li>

			</#list>
		</#if>
	</ul>
</div>