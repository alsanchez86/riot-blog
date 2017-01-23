<filter>
    <button class="tag" type="button" onclick="{delete}">
        {item}
        <small>search</small>
        <span class="glyphicon glyphicon-remove"></span>
    </button>

	<script>
        var self = this;
        self.store  = searchStore;

        this.delete = function() {

            self.store.deleteFilter(false, self.item);
        }.bind(this);
	</script>

	<style scoped>
    </style>
</filter>