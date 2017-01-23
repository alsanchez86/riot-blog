<search-result>
    <article class="post-search-result">
        <p class="post-date" if="{item.date && item.author}">
            <!-- {dateLabel}: -->
            <span class="icomoon icomoon-calendar"></span>
            &nbsp;
            <strong>{item.date}</strong>
            &nbsp;&nbsp;|&nbsp;&nbsp;
            <!-- {authorLabel}:&nbsp; -->
            <span class="icomoon icomoon-user"></span>
            &nbsp;
            <strong>{item.author}</strong>
        </p>

        <div class="row">
            <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
                <img class="img-responsive img-responsive-center" src="http://ximg.es/300x400/CCC/fff">
            </div>

            <div class="col-xs-8 col-sm-9 col-md-9 col-lg-9">
                <header>
                    <h3>
                        <a href="{item.url}">{item.title}</a>
                        <span if="{type}">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                        <small if="{type}">{type}</small>
                    </h3>
                </header>

                <p class="text-indent">
                    <!-- <post-raw content="{item.text}"></post-raw> -->
                    {item.text}

                    <a href="{item.url}">
                        <i>[..]</i>
                    </a>
                </p>

                <result-tag each="{item, i in item.tags}" data="{this}"></result-tag>
            </div>
        </div>
    </article>

	<script>
        var self = this;
        self.store          = searchStore;
        // self.dateLabel      = i18n.fecha;
        // self.authorLabel    = i18n.autor;
        self.dateLabel      = "FECHA";
        self.authorLabel    = "AUTOR";
        self.type           = "";

        self.on("update", function(){

            var pathWithoutFile = location.pathname.substr(0, location.pathname.lastIndexOf('/')+1);

            if (typeof self.item.type !== "undefined" && self.item.type.length) {
                self.type = self.item.type[0];
            }
        });
	</script>

	<style scoped>
    </style>
</search-result>