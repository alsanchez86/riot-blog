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
	var self = this
	self.data = []
	self.url = "http://blog.agresebe.com/api/posts"

	self.on('mount', function() {
		Request();
	})

	function Request() {
		// https://zinoui.com/blog/cross-domain-ajax-request
		// XMLHttpRequest
		var xhr = new XMLHttpRequest();

		xhr.open("GET", self.url, true);
		xhr.withCredentials = true;

		xhr.onload = function () {
			// console.log(xhr.responseText);
			self.data = JSON.parse(xhr.responseText)
			self.update()
		};

		xhr.send();

		// $.ajax({
		// 	url: "http://blog.agresebe.com/api/posts",
		// 	// data: myData,
		// 	type: 'GET',
		// 	crossDomain: true,
		// 	dataType: 'jsonp',
		// 	xhrFields: {
		// 		withCredentials: true
	// 		},
		// 	success: function() {
		// 		alert("Success");
		// 	}
		// });
	}
	</script>

	<style></style>
</list>
