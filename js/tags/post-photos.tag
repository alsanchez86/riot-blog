<post-photos>
  <div if={url} class="row">
    <div class="col-xs-3" each={photo, i in photos}>
      <img class="img-responsive img-responsive-max" src="{self.domain}{photo.image}">
    </div>
  </div>

  <script>
    self = this
    self.domain = "http://blog.agresebe.com/"
    self.url = self.opts.data
    self.photos = []

    self.on('mount', function() {
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
