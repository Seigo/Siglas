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
							
							var count_node = j('#def'+up).find('.count:first')
							count_node.hide()
							count_node.html( parseInt(count_node.html())+1 )
							count_node.fadeIn('slow')
						},
					error: function(a,b,c){
							flash_notice('Ops.. Voto Repetido ou Muitos votos seguidos');
							j('[name="madd-spinner"]').hide()
						}
					})
	}
	
	//			* FLAG *
	
	function flag_request( id, node ){
		flag = id
		load_and_run( flag_request_callback )
		try{ j(spinner).show() } catch(e){}
		node.parentNode.appendChild( spinner )
	}
	function flag_request_callback( ){
		if (user_id) {
			wait_modal_and_run("flagmsg")
			j('.defflag:first').html( j('#def'+flag+' > .definitionb:first').clone() )
		}
		else {
			flash_notice( "Ops.. você não está logado ou seu passe expirou, por favor faça Login ↗" )
			j('html,body').animate({ scrollTop: 0 })
		}
		setTimeout( "j('[name=\"madd-spinner\"]').hide()", 300)
	}
	function send_flag_proxy(elem){
		var pai = j(elem).parents('div')
		var pre = pai.find('input:radio:checked.pre')
		var obs = false
		
		// A default complaint?
		if( pre.size() == 1 ){
			obs = pre.val();
		}
  	else {
			var custom = pai.find('input:radio:checked.custom')
  		if ( custom.size() == 1 ) {
				obs = custom.next().val()
			}
  	}
		if(typeof(obs) == 'string' && obs.length < 1){
			flash_error('É necessária uma justificativa')
		}else{
			flag_request_send(obs)
		}
		j.closeDOMWindow()
	}
	function flag_request_send(obs){
		//var obs = prompt('Por favor um breve comentário sobre o motivo da sinalização (spam, erro, ..)') 
		if(obs){
			j.ajax({
				url: '/ajax/flag',
				data: {
					definition_id: flag,
					obs: obs
				}, // FIXME ugly parameter reference
				success: function(data){
					j('[name="madd-spinner"]').hide()
					flash_notice('Obrigado pelo alerta, verificaremos assim que possível');
					j('#def' + flag + '>.feedbackb>.report').addClass('selected')
					j('[name="madd-spinner"]').hide()
				},
				error: function(a, b, c){
					flash_notice('Ops.. Alerta Repetido ou Muitos seguidos');
					j('[name="madd-spinner"]').hide()
				}
			})
		}
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
	
	// Never use directly //Assumes jQuery is present
	function flash_notice( msg ){
		j('#notib').html( msg ).fadeIn()
		setTimeout( "j('#notib').fadeOut()", 5000 )
	}
	
	// Never use directly //Assumes jQuery is present
	function flash_error( msg ){
		j('#errob').html( msg ).fadeIn()
		setTimeout( "j('#errob').fadeOut()", 5000 )
	}
	
	// Never use directly
	function wait_modal_and_run( id_div ){
		if( typeof(j) != 'undefined' && typeof( j('body').openDOMWindow ) != 'undefined' && j('#'+id_div+":hidden").size() > 0 ){
			j('#'+id_div).openDOMWindow({ eventType:'click' })
    	j.openDOMWindow({
        windowSourceID:'#'+id_div,
				borderColor: '#D3E1F9',
				//windowBGColor: '',
				height:350,
				width:500
			})
		}else{
			//this trick is needed because the callback from the modal is not usable
			setTimeout("wait_modal_and_run( '"+id_div+"' )", 200)
		}
	}
	
	
	
	//			* BASE *
	 
	function load_and_run( callback, arg ){
		if( typeof($) == 'function' ){
			// This means jQuery is loaded
			callback( (typeof( arg ) != 'undefined' ? arg : true))
		}else{
			LazyLoad.js('/javascripts/jquery-1.4.2.js', function(arg){
				j=$;
				LazyLoad.js('/javascripts/jquery.DOMWindow.js');
				callback( (typeof( arg ) != 'undefined' ? arg : true) );
			}, arg)
			
		}
	}
	