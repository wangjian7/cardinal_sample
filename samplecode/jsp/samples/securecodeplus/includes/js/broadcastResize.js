function retrieveFrameIdAndHeight() {
	var hashValue = window.location.hash.substring(1);

	if ((hashValue == null) || (hashValue.length == 0)) return;

	var pairs = hashValue.split('&');
	var height = 0;
	var width = 0;
	var msg = "";
		
	if ((pairs != null) && (pairs.length > 0)) {

		for(var i = 0; i < pairs.length; i++) {

			var pair = pairs[i].split('=');

			if ((pair != null) && (pair.length > 0)) {

				if (pair[0] == 'width') {

					if (validateInput(pair[1]) && pair[1] > 0) {
						width = parseInt(pair[1], 10);		
					}
				} else if (pair[0] == 'height') {
				
					if (validateInput(pair[1]) && pair[1] > 0) {
						height = parseInt(pair[1], 10);
					}
					
				}else if (pair[0] == 'msg') {
					
					if (validateInput(pair[1])) {
						msg = pair[1];

					}
				}
			}
		}

		// TODO: look @ browser support fo isNaN
		if (isNaN(height) == false && isNaN(width) == false && msg != undefined && msg != "") {
			parent.parent.CentinelSetupForgotPassword(height, width, msg);
		} else if(isNaN(height) == false && isNaN(width) == false) {
			parent.parent.CentinelResizeModal(height, width);
		}
	}

}

function validateInput(val){
	if ((val != null) && (val != undefined)) {
		return true;
	}else{
		return false;
	}
}