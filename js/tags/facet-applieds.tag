<facet-applieds>
	<div class="applied-tags" if="{filtersApplied()}">
		<h4 class="applied-tags-title hidden-xs">Filtros aplicados:</h4>

		<!-- btn resetear filtros -->
		<button class="btn-reset-tags" type="button" onclick="{resetFilters}">
			{opts.clearfilter}
			<span class="glyphicon glyphicon-remove-sign"></span>
		</button>
		<!-- / btn resetear filtros -->

		<!-- faceta aplicada -->
		<facet-applied each="{item, i in store.facetFilters}" data="{this}"></facet-applied>
		<!-- / faceta aplicada -->

		<!-- faceta tipo búsqueda aplicada -->
		<facet-search-applied each="{item, i in store.filters}" data="{this}"></facet-search-applied>
		<!-- / faceta tipo búsqueda aplicada -->
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
</facet-applieds>