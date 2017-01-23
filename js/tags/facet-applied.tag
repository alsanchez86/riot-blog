<facet-applied>
    <button class="tag tag-{type}" type="button" onclick="{delete}">
        {name}
        <small>{type}</small>
        <span class="glyphicon glyphicon-remove"></span>
    </button>

	<script>
        var self = this;
        self.store  = searchStore;
        self.name   = "";
        self.type   = "";

        self.on('update', function () {

            var splitTag = self.item.value.split("|");

            if(splitTag.length == 2){
                self.name = splitTag[0];
                self.type = splitTag[1];
            }else{
                self.name = self.item.value;

                if(typeof facetLabels[self.item.facet] != "undefined"){
                    self.type = facetLabels[self.item.facet];
                }
            }
        });

        this.delete = function() {
            self.store.deleteFilter(true, self.item);
        }.bind(this);
	</script>

	<style scoped>
    </style>
</facet-applied>