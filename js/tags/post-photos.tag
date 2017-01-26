<post-photos>
  <div name={opts.post} class="row">
    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3" each={photo, i in photos}>
      <img class="img-responsive img-responsive-max" src="{self.domain}{photo.image}">
    </div>
  </div>

  <script>
    self = this

    self.domain = "http://blog.agresebe.com/"
    self.url = self.opts.data
    self.photos = []

    self.on('mount', function() {
      self.Request();
  	})

    self.Request = function () {
  		var xhr = new XMLHttpRequest();

  		xhr.open("GET", self.url, true);
  		xhr.withCredentials = true;
      xhr.send();

  		xhr.onload = function () {
  			self.photos = JSON.parse(xhr.responseText)

        console.log(self.photos);
  			self.update()
  		};
  	}
  </script>

  <style></style>
</post-photos>
