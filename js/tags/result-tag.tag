<result-tag>
	<button type="button" class="tag tag-{item.type}" onclick="{click}">
		{item.name}
		<small>{item.type}</small>
	</button>

	<script>
		var self 	= this;
		self.store 	= searchStore;

		this.click = function() {

			self.store.addFacetFilter(self.item.facet, self.item.name, self.item.type);
		}.bind(this);
	</script>

	<style scoped>

    </style>
</result-tag>