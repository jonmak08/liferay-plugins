<div class="works-display">

	<div class="heading heading-row">
		<h2>${Heading.getData()}</h2>

		<button class="btn">
			<#if LinkToBlogPage??>
				<#assign
					blog_url = LinkToBlogPage.getFriendlyUrl()
				/>
			<#else>
				<#assign
					blog_url = "./blogs"
				/>
			</#if>

			<a href="${blog_url}">
				${ButtonText.getData()}
			</a>
		</button>
	</div>

	<div class="blog-cards">
		<ul class="cards">

			<#if BlogTitle.getSiblings()?has_content>
				<#list BlogTitle.getSiblings() as blog>

					<#if blog.LinkToBlogPost??>
						<#assign
							current_blog_url = blog.LinkToBlogPost.getFriendlyUrl()
						/>
					<#else>
						<#assign
							current_blog_url = blog.DefaultBlogLink.getData()
						/>
					</#if>

					<#if blog.Image?? && blog.Image.getData() != "">
						<#assign
							blog_image_url = blog.Image.getData()
						/>
					<#else>
						<#assign
							blog_image_url = "/o/port-theme/images/forest.jpg"
						/>
					</#if>

					<li>
						<img src="${blog_image_url}" />

						<h5>
							<a href="${current_blog_url}">
								${blog.getData()}
							</a>
						</h5>

						<h6 class="blog-byline">Posted by <span>${blog.Author.getData()}</span> on ${blog.Date.getData()} in <span>${blog.Category.getData()}</span></h6>

						<p>${blog.Preview.getData()}</p>

						<a href="${current_blog_url}">Read More</a>
					</li>

				</#list>
			</#if>

		</ul>
	</div>

</div>