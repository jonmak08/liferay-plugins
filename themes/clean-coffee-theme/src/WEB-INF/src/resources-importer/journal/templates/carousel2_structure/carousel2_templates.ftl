<div class="carousel slide" data-ride="carousel" id="carousel-example-generic">
   <ol class="carousel-indicators">
		<li class="active" data-slide-to="0" data-target="#carousel-example-generic"></li>
		<li data-slide-to="1" data-target="#carousel-example-generic" ></li>
		<li data-slide-to="2" data-target="#carousel-example-generic" ></li>
		<li data-slide-to="3" data-target="#carousel-example-generic" ></li>

	</ol>
	<div class="carousel-inner" role="listbox">
		<div class="active item">
			<img alt="Slide 1" src="${Image_1_URL.getData()}" >
		</div>
		<div class="item">
			<img alt="Slide 2" src="${Image_2_URL.getData()}" >
		</div>
		<div class="item">
			<img alt="Slide 3" src="${Image_3_URL.getData()}">
		</div>
		<div class="item">
			<img alt="Slide 4" src="${Image_4_URL.getData()}">
		</div>
	</div>
	<a class="carousel-control left" data-slide="prev" href="#carousel-example-generic" role="button">
		<span aria-hidden="true" class="icon-circle-arrow-left" ></span>
		<span class="sr-only">Previous</span>
	</a>

	<a class="carousel-control right" data-slide="next" href="#carousel-example-generic" role="button">
		<span aria-hidden="true" class="icon-circle-arrow-right" ></span>
		<span class="sr-only">Next</span>
	</a>
</div>