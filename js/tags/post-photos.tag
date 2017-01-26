<post-photos>
  <div if={url} class="row">
    <div class="col-xs-3" each={photo, i in photos}>
      <img class="img-responsive img-responsive-max" src="">
    </div>
  </div>

  <script>
    self = this
    self.url = self.opts.data
    self.photos = []

    self.on('mount', function() {
  		// console.log (self.url)
      Request();
  	})

    function Request() {
  		var xhr = new XMLHttpRequest();

  		xhr.open("GET", self.url, true);
  		xhr.withCredentials = true;

  		xhr.onload = function () {
  			self.photos = JSON.parse(xhr.responseText)
  			self.update()
  		};

  		xhr.send();
  	}
  </script>

  <style></style>
</post-photos>
