<div class="carousel slide" data-ride="carousel" id="carousel-dynamic">
	<#if Image1kd4.getData() !="">
		<ol class="carousel-indicators">
			<#list Image1kd4.getSiblings() as i>
				<#if i?index = 0>
					<li class="active" data-slide-to="${i?index}" data-target="#carousel-dynamic"></li>
				<#else>
					<li data-slide-to="${i?index}" data-target="#carousel-dynamic"></li>
				</#if>
			</#list>
		</ol>

		<div class="carousel-inner">
			<div class="active item">
				<div class="image-wrapper">
					<img src="${Image1kd4.getData()}" />
				</div>
			</div>
			<#if Image1kd4.getSiblings()?has_content>
				<#list Image1kd4.getSiblings() as cur_Image1kd4>
					<#if cur_Image1kd4.getData()?? && cur_Image1kd4.getData() != "" && cur_Image1kd4.getData() != Image1kd4.getData()>
						<div class="item">
							<div class="image-wrapper">
								<img src="${cur_Image1kd4.getData()}" />
							</div>
						</div>
					</#if>
				</#list>
			</#if>
		</div>

	<#else>
		<ol class="carousel-indicators">
			<li class="active" data-slide-to="0" data-target="#carousel-dynamic"></li>
			<li data-slide-to="1" data-target="#carousel-dynamic" ></li>
			<li data-slide-to="2" data-target="#carousel-dynamic" ></li>
			<li data-slide-to="3" data-target="#carousel-dynamic" ></li>
		</ol>

		<div class="carousel-inner" role="listbox">
			<div class="active item">
				<img alt="Slide 1" src="http://www.template-joomspirit.com/theme-wordpress/theme-01/wp-content/uploads/2014/10/50-1100x418.jpg" width=70%>
			</div>
			<div class="item">
				<img alt="Slide 2" src="http://www.template-joomspirit.com/theme-wordpress/theme-01/wp-content/uploads/2014/10/20-1100x418.jpg" width=70%>
			</div>
			<div class="item">
				<img alt="Slide 3" src="http://www.template-joomspirit.com/theme-wordpress/theme-01/wp-content/uploads/2014/10/70-1100x418.jpg" width=70%>
			</div>
			<div class="item">
				<img alt="Slide 4" src="http://www.template-joomspirit.com/theme-wordpress/theme-01/wp-content/uploads/2014/10/40-1100x418.jpg" width=70%>
			</div>
		</div>
	</#if>

	<a class="carousel-control left" data-slide="prev" href="#carousel-dynamic" role="button">
		<span aria-hidden="true" class="icon-circle-arrow-left"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="carousel-control right" data-slide="next" href="#carousel-dynamic" role="button">
		<span aria-hidden="true" class="icon-circle-arrow-right" ></span>
		<span class="sr-only">Next</span>
	</a>
</div>