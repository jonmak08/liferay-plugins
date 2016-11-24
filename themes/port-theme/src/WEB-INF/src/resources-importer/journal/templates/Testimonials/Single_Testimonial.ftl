<div class="single-testimonial testimonials">
	<h4>Testimonials</h4>

	<#if PersonName?has_content>

		<#if PersonName.PersonImage?? && PersonName.PersonImage.getData() != "">
			<#assign
				person_image = PersonName.PersonImage.getData()
			/>
		<#else>
			<#assign
				person_image = "/o/port-theme/images/person.jpg"
			/>
		</#if>

		<img alt="${PersonName.getData()}" src="${person_image}" />

		<div class="testimonial-content">
			<p>${PersonName.PersonTestimonial.getData()}</p>
			<h5>- ${PersonName.getData()}</h5>
		</div>

	</#if>
</div>