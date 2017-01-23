<facet>
	<li class="list-group-item">
		<a class="list-group-item-a list-group-item-a-{type}" href="#" onclick="{click}">
			<div class="list-group-item-color list-group-item-color-{type}">
				{name}
				<span class="badge">{item.total}</span>
			</div>
		</a>
	</li>

	<script>
		var self 	= this;
		self.store 	= searchStore;
		self.name 	= "";
		self.type 	= "";

		self.on('update', function () {
			var splitTag = self.item.name.split("|");

			if(splitTag.length == 2){
				self.name = splitTag[0];
				self.type = splitTag[1];
			}else{
				self.name = self.item.name;
			}
		});

		this.click = function() {

			self.store.addFacetFilter(self.parent.item.facet, self.name, self.type);
			self.store.trigger('offCanvas');
		}.bind(this);
	</script>

	<style scoped>
    </style>
</facet>