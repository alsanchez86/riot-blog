<blog>
	<div class="row">
		<!-- <div class="col-xs-8">
			<breadcrumb aplyclass="miga-foro"></breadcrumb>
		</div> -->

		<!-- <div class="col-xs-4"> -->
		<div class="col-xs-12">
			<div class="text-right">
				<button id="btn-offcanvas-2" class="btn-offcanvas hidden-sm hidden-md hidden-lg" data-toggle="offcanvas" data-offcanvas-priority="1">
        			Filtros&nbsp;
        			<span class="glyphicon glyphicon-list-alt"></span>
    			</button>
			</div>
		</div>
	</div>

	<div id="row-offcanvas-2" class="row-offcanvas row-offcanvas-right row">
		<aside class="sidebar-offcanvas col-xs-12 col-sm-3 col-md-3 col-lg-3">
			<div id="panel-filters" class="panel-filters panel-group" role="tablist" aria-multiselectable="true">
				<panel-filters seeless="{seeless}" seemore="{seemore}" each="{item, i in store.results.facets}" data="{this}"></panel-filters>
			</div>
		</aside>

		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
			<!-- search-header -->
			<search-header sectiontitle="{sectiontitle}" resultsfound="{resultsfound}" selectpagesize="{selectPageSize}" placeholder="{placeholder}"></search-header>
			<!-- / search-header -->

			<!-- center bar -->
			<div class="center-bar">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<header>
							<h1>
								<span class="icomoon icomoon-bookmarks"></span>
								&Uacute;LTIMOS POST AÑADIDOS
							</h1>
						</header>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<pagination></pagination>
					</div>
				</div>
			</div>
			<!-- / center bar -->

			<!-- filtros aplicados -->
			<filters appliedfilters="{appliedfilters}" clearfilter="{clearfilter}"></filters>
			<!-- / filtros aplicados -->

			<!-- resultados búsqueda -->
			<search-result each="{item, i in store.results.news}" data="{this}"></search-result>
			<!-- / resultados búsqueda -->

			<div class="center-bar" if="{visible()}">
				<pagination></pagination>
			</div>
		</div>
	</div>

	<script>
		var self 	= this;
		var get 	= getParameterByName('search');

		self.store = searchStore;

		if(this.opts["data-tipo"]){
			self.store.searchAction = this.opts["data-tipo"];
		}

		/*if(self.store.searchAction == "searchNews"){
			this.sectiontitle = i18n.titulo_noticias;
		}else{
			this.sectiontitle = i18n.titulo_general;
		}*/

		if (get) self.store.addFilter(get);
		self.store.init(); // hacemos la query con el tipo de busqueda "self.store.searchAction"

        /*
        this.placeholder 	= i18n.buscar;
        this.selectPageSize = i18n.mostrar_resultados_por_pagina;
        this.resultsfound 	= i18n.resultados_encontrados;
        this.clearfilter 	= i18n.limpiar_filtros;
        this.seemore 		= i18n.ver_mas;
        this.seeless 		= i18n.ver_menos;
        this.appliedfilters = i18n.filtros_aplicados;
        */

        this.placeholder 	= "Buscar texto";
        this.selectPageSize = "Mostrar %%% resultados por página";
        this.resultsfound 	= "Resultados encontrados";
        this.clearfilter 	= "Resetear filtros";
        this.seemore 		= "Ver más";
        this.seeless 		= "Ver menos";
        this.appliedfilters = "Filtros aplicados";

        this.visible = function() {

            return self.store.results.opts.numFound > self.store.pageSize;
        }.bind(this);

        self.store.on('searched', function() {

        	self.update();
        });

        function getParameterByName(name) {
        	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        	results = regex.exec(location.search);
        	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        };
    </script>

    <style scoped>
    </style>
</blog>