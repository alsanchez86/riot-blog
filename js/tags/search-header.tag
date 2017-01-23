<search-header>
    <form action="#" method="GET" onsubmit="{search}">
        <div class="search-header">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <div class="input-group">
                        <input type="text" name="inputSearch" class="form-control" placeholder="{opts.placeholder}...">

                        <span class="input-group-btn">
                            <button type="button" onclick="{search}">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <select class="form-control" onchange="{setPageSize}">
                        <option each="{item, i in options}" value="{item}" __selected="{selected(item)}">
                            {printPageSizeText(item)}
                        </option>
                    </select>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <p class="total-results">
                        <strong>{totalSearch}</strong>
                        &nbsp;
                        <span>{opts.resultsfound}.</span>
                        &nbsp;
                        <span class="glyphicon glyphicon-info-sign"></span>
                    </p>
                </div>
            </div>
        </div>
    </form>

	<script>
        var self            = this;
        self.store          = searchStore;
        self.options        = [5, 10, 20, 40];
        self.totalSearch    = 0;

        this.search = function() {

            var inputVal = $(self.inputSearch).val();

            $(self.inputSearch).val("");
            if (!inputVal || inputVal == '') return false;
            self.store.addFilter(inputVal);
        }.bind(this);

        this.selected = function(item) {

            return item == self.store.pageSize;
        }.bind(this);

        this.setPageSize = function(e) {

            self.store.setPageSize(parseInt(e.target.value));
        }.bind(this);

        this.printPageSizeText = function(item) {

            return self.opts.selectpagesize.replace("%%%",item);
        }.bind(this);

        self.store.on('searched', function() {

            self.totalSearch = self.store.results.opts.numFound;
            self.update();
        });
	</script>

	<style scoped>
    </style>
</search-header>