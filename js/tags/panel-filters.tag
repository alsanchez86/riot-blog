<panel-filters>
	<div class="panel" if="{item.items.length}">
		<div id="heading-{i}" class="panel-heading" role="tab">
			<h4 class="panel-title">
				<a role="button" data-toggle="collapse" data-parent="#panel-filters" href="#collapse-{i}" aria-expanded="true" aria-controls="collapse-{i}">
          			{label}:
					&nbsp;
					<small>[{item.items.length}]</small>
        		</a>
			</h4>
		</div>

		<div id="collapse-{i}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-{i}">

			<div class="panel-body">
				<ul class="list-group">
					<facet each="{item, i in item.items}" data="{this}" if="{i < nFilters}"></facet>
				</ul>
			</div>

			<div class="panel-footer">
				<see-more seeless="{opts.seeless}" label="{opts.seemore}" if="{max < item.items.length}"></see-more>
			</div>
		</div>
	</div>

	<script>
		var self = this;

		/*if(typeof eval("i18n['" + self.item.facet + "']") == "undefined"){
			self.label = self.item.facet;
		}else{
			self.label = eval("i18n['" + self.item.facet + "']");
		}*/
		self.label = self.item.label.charAt(0).toUpperCase() + self.item.label.slice(1);
		//

		self.store 		= searchStore;
		self.max 		= 5; // numero máximo de filtros que se muestran con el panel plegado
		self.nFilters 	= self.max;

		this.seeMax = function() {

			self.nFilters = self.max;
            self.update();
		}.bind(this);

		this.seeAll = function() {

			self.nFilters = self.item.items.length;
            self.update();
		}.bind(this);
	</script>

	<style scoped>
    </style>
</panel-filters>
