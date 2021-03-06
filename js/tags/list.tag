<list>
	<section>
		<header>
			<h1>Posts</h1>
		</header>

		<article class="post" each={item, i in posts}>
			<header>
				<h3 class="post-title">{item.title}</h3>
			</header>

			<div class="post-body">
				<p>{item.body}</p>
			</div>

			<footer>
				<p class="post-footer">{item.author.first_name} {item.author.last_name}</p>
			</footer>
		</article>

		<div hide="{loaded}" class="loading-icon">
			<img src="./images/cargando-2.gif" alt="Loading...">
		</div>
	</section>

	<script>
		var self = this;

		self.loaded = false;
		self.posts = [];
		self.resource = "http://blog.agresebe.com/api/posts?format=json";
		self.domain = "http://blog.agresebe.com/";

		self.on('mount', function() {
			self.getPosts();
		})

		self.getPosts = function() {
			var xhr = new XMLHttpRequest();

			xhr.open("GET", self.resource, true);
			xhr.withCredentials = true;
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-type", "application/json");
			xhr.send();

			xhr.onload = function () {
				self.posts = JSON.parse(xhr.responseText);
				self.loaded = true;
				self.update();

				// self.posts.forEach(function(data, i) {
				// 	var req = new XMLHttpRequest();
				//
			  //   req.open('GET', data.photos, true);
				// 	req.withCredentials = true;
				// 	req.send();
				//
				// 	req.onload = function (event) {
				// 		self.posts[i].photos = JSON.parse(event.target.responseText);
				// 	}
				// });
			};
		}
	</script>

	<style></style>
</list>
