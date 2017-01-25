<blog>
	<virtual data-is="{page.id}"></virtual>

	<script>
    var self = this;

    self.data = [
      {id: "list"},
      {id: "post"},
			{id: "panel"}
    ]

		// default page
    self.page = self.data[0]

    route(function(id) {
      self.page = self.data.filter(function(r) { return r.id == id })[0] || self.data[0]
      self.update()
    })
  </script>

  <style scoped>
  </style>
</blog>
