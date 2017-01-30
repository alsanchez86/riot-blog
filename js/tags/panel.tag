<panel>
	<div class="panel">
		<div class="confirmation" show="{complete}">
			<h3>
				<span class="glyphicon glyphicon-ok"></span>
				Succefully
			</h3>
		</div>

		<div class="form-group">
			<label for="post-title">Title:</label>
			<input id="post-title" name="title" type="text" class="form-control" placeholder="Title">
		</div>

		<div class="form-group">
			<label for="post-body">Body:</label>
			<textarea id="post-body" name="body" refs="body" class="form-control" rows="3"></textarea>
		</div>

		<div class="text-right">
			<button type="button" class="btn {disabled: sending}" onclick="{addPost}">Add Post</button>
		</div>
	</div>

	<script>
		var self = this;

		self.title = "";
		self.body = "";
		self.sending = false;
		self.resource = "http://blog.agresebe.com/api/posts?format=json";

		self.addPost = function () {
			self.complete = false;
			self.sending = true;
			self.data = {};
			self.title = $.trim($("#post-title").val());
			self.body = $.trim($("#post-body").val());
			self.data["title"] = self.title;
			self.data["body"] = self.body;
			self.data = JSON.stringify(self.data);

			var xhr = new XMLHttpRequest();

			xhr.open("POST", self.resource, true);
			xhr.withCredentials = true;
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-type", "application/json");
			xhr.send(self.data);

			xhr.onload = function () {
				self.sending = false;

				if (xhr.status == "200" || xhr.status == "201") {
					self.complete = true;
				}
				self.update();
			}
		}
	</script>

	<style scoped></style>
</panel>
