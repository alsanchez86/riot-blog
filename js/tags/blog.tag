<blog>
	<virtual data-is="{page.id}"></virtual>

	<script>
    var self = this;

    self.pages = [
      {id: "list"},
			{id: "panel"}
    ]

		// default page: list
    self.page = self.pages[0]

    route(function(id) {
      self.page = self.pages.filter(function(r) { return r.id == id })[0] || self.pages[0];
      self.update();
    });

		route.stop();
		route.start();
		route.exec();
  </script>

  <style scoped>
  </style>
</blog>
