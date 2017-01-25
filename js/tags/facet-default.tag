<facet-default>
	<li class="list-group-item">
		<a class="list-group-item-a list-group-item-a-{printType}" href="#" onclick="{click}">
			<div class="list-group-item-color list-group-item-color-{printType}">
				{name}
				<span class="badge">{item.total}</span>
			</div>
		</a>
	</li>

	<script>
		var self 		= this;
		self.store 		= searchStore;
		self.name 		= "";
		self.type 		= "";
		self.printType 	= self.type;

		self.on('update', function () {
			var splitTag = self.item.name.split("|");

			if(splitTag.length == 2){
				self.name 		= splitTag[0];
				self.type 		= splitTag[1];
				self.printType 	= self.type;
			}else{
				self.name = self.item.name;

				if(typeof facetLabels[self.parent.item.facet] != "undefined"){
                    self.printType = facetLabels[self.parent.item.facet];
                }
			}
		});

		this.click = function() {

			self.store.addFacetFilter(self.parent.item.facet, self.name, self.type);
		}.bind(this);
	</script>

	<style scoped>
    </style>
</facet-default>