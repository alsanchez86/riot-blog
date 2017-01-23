<filters>
	<div class="applied-tags" if="{filtersApplied()}">
		<h4 class="applied-tags-title">Filtros aplicados:</h4>

		<button class="btn-reset-tags" type="button" onclick="{resetFilters}">
			{opts.clearfilter}
			<span class="glyphicon glyphicon-remove-sign"></span>
		</button>

		<filter each="{item, i in store.filters}" data="{this}"></filter>

		<facet-applied each="{item, i in store.facetFilters}" data="{this}"></facet-applied>
	</div>

	<script>
		var self = this;
		self.store = searchStore;

		this.filtersApplied = function() {

			return self.store.filters.length + self.store.facetFilters.length > 0;
		}.bind(this);

		this.resetFilters = function() {

			self.store.resetFilters();
		}.bind(this);

		self.store.on('searched', function() {

			self.update();
		});
    </script>

    <style scoped>
    </style>
</filters>