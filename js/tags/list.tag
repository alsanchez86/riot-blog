<list>
	<section>
		<header>
			<h1>Posts</h1>
		</header>

		<article each={item, i in data}>
			<header>
				<h3>{item.title}</h3>
			</header>

			<p>{item.body}</p>

			<post-photos data="{item.photos}"></post-photos>

			<footer>
				<p>{item.author.firstName} {item.author.lastName}</p>
			</footer>
		</article>
	</section>

	<script>
		self = this

		self.data = []
		self.url = "http://blog.agresebe.com/api/posts"

		self.on('mount', function() {
			self.Request();
		})

		self.Request = function() {
			var xhr = new XMLHttpRequest();

			xhr.open("GET", self.url, true);
			xhr.withCredentials = true;

			xhr.onload = function () {
				self.data = JSON.parse(xhr.responseText)
				self.update()
			};

			xhr.send();
		}
	</script>

	<style></style>
</list>
