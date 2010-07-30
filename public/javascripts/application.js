var spinner = new Image();
	spinner.name = "madd-spinner"
	spinner.src = "/images/ajax-loader.gif"
	
	
	//			* DEF FEEDBACK *
	
	
	function up_request( id, node ){
		//FIXME bad pratice, could be done by getMyJQuery?
		up = id
		load_and_run( up_request_callback )
		try{ j(spinner).show() } catch(e){}
		node.parentNode.appendChild( spinner )
	}
	function up_request_callback( id ){
		j.ajax({
					url: '/ajax/up',
					data:{definition_id:up}, // FIXME ugly parameter reference
					
					success: function(data) {
							j('[name="madd-spinner"]').hide()
						  flash_notice('Obrigado por Votar');
							j('#def'+up+'>.feedbackb>.up').addClass('selected')
							j('[name="madd-spinner"]').hide()
						},
					error: function(a,b,c){
							flash_notice('Ops.. Voto Repetido ou Muitos votos seguidos');
							j('[name="madd-spinner"]').hide()
						}
					})
	}
	
	
	function flag_request( id, node ){
		flag = id
		load_and_run( flag_request_callback )
		try{ j(spinner).show() } catch(e){}
		node.parentNode.appendChild( spinner )
	}
	function flag_request_callback( id){
		if (user_id) {
			var obs = prompt('Por favor um breve comentário sobre o motivo da sinalização (spam, erro, ..)') 
			if(obs){
				j.ajax({
					url: '/ajax/flag',
					data: {
						definition_id: flag,
						obs: obs
					}, // FIXME ugly parameter reference
					success: function(data){
						j('[name="madd-spinner"]').hide()
						flash_notice('Obrigado por Votar');
						j('#def' + flag + '>.feedbackb>.report').addClass('selected')
						j('[name="madd-spinner"]').hide()
					},
					error: function(a, b, c){
						flash_notice('Ops.. Voto Repetido ou Muitos votos seguidos');
						j('[name="madd-spinner"]').hide()
					}
				})
			}
		}
		else {
			flash_notice( "Ops.. você não está logado ou seu passe expirou, por favor faça Login ↗" )
			j('html,body').animate({ scrollTop: 0 })
		}
		setTimeout( "j('[name=\"madd-spinner\"]').hide()", 300)
	}
	
	
	//			* ADD DEF *
	
	
	function prepare_add(elem){
		elem.attributes.onclick.value = ''
		load_and_run( prepare_add_done )
		try{ j(spinner).show() } catch(e){}
		elem.parentNode.appendChild( spinner )
	}
	// FIXME Do primeiro click em diante ele buga e não aparece nada 
	function prepare_add_done(){
		if( user_id ){
			j('#madd').slideUp( '', function(){ 
							j('#addf').slideDown( '', function(){
										j('html,body').animate({
											 		scrollTop: $('#footer').offset().top }) } ) })
		}else{
			flash_notice( "Ops.. você não está logado ou seu passe expirou, por favor faça Login ↗" )
			j('html,body').animate({ scrollTop: 0 })
		}
		j('[name="madd-spinner"]').hide()
	}
	
	
	
	//			* VISUAL *
	
	function flash_notice( msg ){
		//Assumes jQuery is present
		j('#notib').html( msg ).fadeIn()
		setTimeout( "j('#notib').fadeOut()", 5000 )
	}
	
	function flash_error( msg ){
		//Assumes jQuery is present
		j('#errob').html( msg ).fadeIn()
		setTimeout( "j('#errob').fadeOut()", 5000 )
	}
	
	
	
	//			* BASE *
	 
	function load_and_run( callback, arg ){
		if( typeof($) == 'function' ){
			// This means jQuery is loaded
			callback( (typeof( arg ) != 'undefined' ? arg : true))
		}else{
			LazyLoad.load('/javascripts/jquery-1.4.2.js', function(arg){ j=$; callback( (typeof( arg ) != 'undefined' ? arg : true) )}, arg)
		}
	}