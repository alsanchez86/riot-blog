<result-tag>
	<button type="button" class="tag tag-{item.type}" onclick="{click}">
		{item.name}
		<small>{type}</small>
	</button>

	<script>
		var self 		= this;
		self.store 		= searchStore;
		self.type       = self.item.type;
		self.printType 	= self.type != 'year' ? self.type.substring(1) : self.type;

		this.click = function() {

			self.store.addFacetFilter(self.item.facet, self.item.name, self.item.type);
		}.bind(this);
	</script>

	<style scoped>
    </style>
</result-tag>
