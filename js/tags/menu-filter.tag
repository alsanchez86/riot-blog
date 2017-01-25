<menu-filter>
	<div class="btn-group" each="{item, i in items}">
    <button type="button" onclick="{click}" this="{item}">
      {item.label}
    </button>
  </div>

	<script>
		var self      = this;
		self.store 	  = searchStore;
    self.items    = [{
      label:  "Educación 2016",
      facets: [{
        facet:  "tags_ss",
        name:   "Educación",
        type:   "dCreativeWork"
      },
      {
        facet:  "anyo_s",
        name:   "2016",
        type:   ""
      }]
    },
    {
      label:  "Negocios en 2015",
      facets: [{
        facet:  "tags_ss",
        name:   "Negocios",
        type:   "dCreativeWork"
      },
      {
        facet:  "anyo_s",
        name:   "2015",
        type:   ""
      }]
    },
    {
      label:  "Seguridad en Madrid",
      facets: [{
        facet:  "tags_ss",
        name:   "Seguridad",
        type:   "dOthers"
      },
      {
        facet:  "tags_ss",
        name:   "Madrid",
        type:   "dPlace"
      }]
    }];

    self.click = function(event) {

      var item    = event.item;
      var facet   = item.item.facet;
      var name    = item.item.name;
      var type    = item.item.type;

      self.store.deleteAllFilters();
      self.store.addMultipleFacetFilter(item.item);
    }.bind(this);
	</script>

	<style scoped>
  </style>
</menu-filter>