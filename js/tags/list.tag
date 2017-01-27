<list>
	<section>
		<header>
			<h1>Posts</h1>
		</header>

		<article each={item, i in posts}>
			<header>
				<h3>{item.title}</h3>
			</header>

			<p>{item.body}</p>

			<div if={item.photos} class="row">
		    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" each={photo, i in item.photos}>
					<img class="img-responsive img-responsive-max" src="{domain}{photo.image}">
		    </div>
		  </div>

			<footer>
				<p>{item.author.first_name} {item.author.last_name}</p>
			</footer>
		</article>
	</section>

	<script>
		var self = this;

		self.posts = [];
		self.resource = "http://blog.agresebe.com/api/posts";
		self.domain = "http://blog.agresebe.com/"

		self.on('mount', function() {
			self.getPosts();
		})

		self.getPosts = function() {
			var xhr = new XMLHttpRequest();

			xhr.open("GET", self.resource, true);
			xhr.withCredentials = true;
			xhr.send();

			xhr.onload = function () {
				self.posts = JSON.parse(xhr.responseText);

				self.posts.forEach(function(data, i) {
					var req = new XMLHttpRequest();

			    req.open('GET', data.photos, true);
					req.withCredentials = true;
					req.send();

					req.onload = function (event) {
						data.photos = JSON.parse(event.target.responseText);
						self.update();
					}
				});				
			};
		}
	</script>

	<style></style>
</list>
