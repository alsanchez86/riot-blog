<see-more>
	<button onclick="{toggle}">
    {printLabel()}
    &nbsp;
    <span class="glyphicon glyphicon-{type}-sign"></span>
    <!--
      plus
      minus
    -->
	</button>

	<script>
		var self    = this;
		self.store 	= searchStore;
		self.show 	= false;
    self.label  = self.opts.label;
    self.type   = "plus";

    this.on("update",function(){
        if (!self.opts.label)
            self.label = self.opts.label;
    });

    this.printLabel = function() {
      if (!self.label || self.label == ""){
        return self.opts.label;
      }else{
        return self.label;
      }
    }.bind(this);

		this.toggle = function() {
      self.show 	= !self.show;
      self.label 	= self.show ? self.opts.seeless : self.opts.label;
      self.type   = self.show ? "minus" : "plus";

      if (self.show) {
      	self.parent.seeAll();
      }else{
      	self.parent.seeMax();
      }
		}.bind(this);
	</script>

	<style scoped>
    </style>
</see-more>