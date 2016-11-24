<div class="blog-post-preview">

	<div class="blog-heading">
		<h1>
			<#if LinkToPost??>
				<#assign
					link_to_post = LinkToPost.getFriendlyUrl()
				/>
			<#else>
				<#assign
					link_to_post = DefaultURL.getData()
				/>
			</#if>

			<a href="${link_to_post}">
				${Title.getData()}
			</a>
		</h1>

		<h5 class="blog-byline">Posted by <span>${Author.getData()}</span> on ${Date.getData()} in <span>${Category.getData()}</span></h5>
	</div>

	<div class="blog-content-preview">
		${PostContent.getData()}
	</div>

</div>