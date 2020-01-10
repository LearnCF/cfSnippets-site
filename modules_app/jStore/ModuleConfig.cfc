component {
	this.title = "jStore";
	this.author = "Michael Born <mike@learncf.dev>";

	function configure(){
		settings = {

		};

		interceptors = [{
			class = "modules_app.jStore.interceptors.InitMappings",
			properties	= {},
			name			= "InitMappings@jStore"
		}];
	}
}