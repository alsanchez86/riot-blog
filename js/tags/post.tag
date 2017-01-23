<post>
	<div class="container">
		<breadcrumb></breadcrumb>

		<div class="post-content">
			<p>
				Fecha:&nbsp;
				<strong>26 de mayo de 2015</strong>
				&nbsp;|&nbsp;
				Autor:&nbsp;
				<strong>Juan Antonio Prieto</strong>
			</p>

			<header>
				<h1>WEB SEMÁNTICA VS TECNOLOGÍAS SEMÁNTICAS EN XIMDEX CMS</h1>
			</header>

			<p>
				Desde que empezamos las primeras líneas de código del CMS Ximdex apostamos por el paradigma de la web semántica para lograr un mayor nivel de abstracción de los contenidos, datos y aplicaciones web que gestionamos así como para facilitar tareas automáticas en el tratamiento de la información. Sin embargo, aún más importante es el garantizar la máxima escalabilidad de los contenidos publicados, lo que nos obligó a buscar un compromiso en el uso de estas técnicas.
			</p>

			<p>
				Para ello hemos aplicado una distinción clara entre el paradigma de la "Web Semántica", que la entendemos como una visión más o menos utópica de la web donde todos los enlaces acarrean el "porqué" del enlace (proporcionado por su significado asociado, significado que es compartido y está descrito en ontologías -lo que lo hace tratable de forma automática y realizar inferencias-), y el uso de "Tecnologías Semánticas", que entendemos nos permite "escoger" selectivamente ciertos componentes del paradigma de la web semántica como, por ejemplo, vocabularios relativamente simples que únicamente describen personas o lugares y en lenguajes más simples como RDF, lo que limita las operaciones que podemos realizar sobre las entidades pero nos permite un tratamiento mucho más directo, sin arriesgar otros valores como la escalabilidad.
			</p>

			<img class="img-responsive img-responsive-center" src="./images/Tudecides.jpg">

			<!-- 16:9 aspect ratio -->
			<div class="embed-responsive embed-responsive-16by9">
  				<iframe class="embed-responsive-item" width="560" height="315" src="https://www.youtube.com/embed/TCts6YVSX-c" frameborder="0" allowfullscreen></iframe>
			</div>

			<p>
				Desde que empezamos las primeras líneas de código del CMS Ximdex apostamos por el paradigma de la web semántica para lograr un mayor nivel de abstracción de los contenidos, datos y aplicaciones web que gestionamos así como para facilitar tareas automáticas en el tratamiento de la información. Sin embargo, aún más importante es el garantizar la máxima escalabilidad de los contenidos publicados, lo que nos obligó a buscar un compromiso en el uso de estas técnicas.
			</p>
		</div>
	</div>

	<script>
		var self 	= this;
		//var get 	= getParameterByName('search');

		self.store = searchStore;

		/*if(this.opts["data-tipo"]){
			self.store.searchAction = this.opts["data-tipo"];
		}*/

		/*if(self.store.searchAction == "searchNews"){
			this.sectiontitle = i18n.titulo_noticias;
		}else{
			this.sectiontitle = i18n.titulo_general;
		}*/

		// if (get) self.store.addFilter(get);



		// self.store.getPost(); // hacemos la query con el tipo de busqueda "self.store.searchAction"




        /*this.placeholder 	= i18n.buscar;
        this.selectPageSize = i18n.mostrar_resultados_por_pagina;
        this.resultsfound 	= i18n.resultados_encontrados;
        this.clearfilter 	= i18n.limpiar_filtros;
        this.seemore 		= i18n.ver_mas;
        this.seeless 		= i18n.ver_menos;
        this.appliedfilters = i18n.filtros_aplicados;*/

        /*self.store.on('searched', function() {

        	self.update();
        });*/

        /*function getParameterByName(name) {
        	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        	results = regex.exec(location.search);
        	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        };*/
    </script>

    <style scoped>
    </style>
</post>