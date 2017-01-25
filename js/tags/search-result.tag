<search-result>
    <article class="post-search-result">
        <p class="post-date" if="{item.date && item.author}">
            <!-- {dateLabel}: -->
            <span class="icomoon icomoon-calendar"></span>
            &nbsp;
            <strong>{item.date}</strong>            
        </p>

        <div class="row">
            <div if="{visible()}" class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
                <a href="{item.url}">
                    <img class="img-responsive img-responsive-max" src="{item.thumb}" alt="{item.title}" title="{item.title}">
                </a>
            </div>

            <div class="{"col-xs-8 col-sm-9 col-md-9 col-lg-9": visible(), "col-xs-12": !visible()}">
                <header>
                    <h3>
                        <a href="{item.url}">
                            {item.title}
                        </a>

                        <span if="{type}">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                        <small if="{type}">{type}</small>
                    </h3>
                </header>

                <p class="text-indent">
                    <raw content="{item.entradilla}"/>
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

        this.visible = function() {

            return self.item.thumb != "" && self.item.thumb != "/404.html" && self.item.thumb != null;
        }.bind(this);

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
