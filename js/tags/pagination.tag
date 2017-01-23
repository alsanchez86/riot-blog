<pagination>
	<div if="{visible()}">
		<ul class="pagination">
			<li class="arrow" if="{activedPrev()}">
				<a href="#" aria-label="Previous" onclick="{clickPrev}">
					<span class="glyphicon"></span>
				</a>
			</li>

			<li each="{items}" class="{active: active}">
				<a href="#" onclick="{click}">{count}</a>
			</li>

			<li class="arrow" if="{activedNext()}">
				<a href="#" aria-label="Next" onclick="{clickNext}">
					<span class="glyphicon"></span>
				</a>
			</li>
		</ul>
	</div>

	<script>
		var self = this;

		self.store    = searchStore;
        self.items    = [];
        self.initPage = 1;

        this.visible = function() {

            return self.store.results.opts.numFound > self.store.pageSize;
        }.bind(this);

        this.activedPrev = function() {

            return self.store.currentPage != self.initPage;
        }.bind(this);

        this.activedNext = function() {

            var nPages = Math.ceil(self.store.results.opts.numFound / self.store.pageSize);
            return self.store.currentPage != nPages;
        }.bind(this);

        this.getItems = function() {

            var i       = self.initPage;
            var nPages  = Math.ceil(self.store.results.opts.numFound / self.store.pageSize);

            self.items = []; // reset array

            while (i <= nPages) {

                self.items.push({count: i, active: i == self.store.currentPage});
                i++;
            }
        }.bind(this);

        this.click = function(e) {

            self.store.setPage(parseInt(e.target.textContent));
        }.bind(this);

        this.clickPrev = function() {

            self.store.setPage(parseInt(self.store.currentPage - 1));
        }.bind(this);

        this.clickNext = function() {

            self.store.setPage(parseInt(self.store.currentPage + 1));
        }.bind(this);

        self.store.on('searched', function() {

            self.getItems ();
            self.update();
        });
	</script>

	<style scoped>
    </style>
</pagination>