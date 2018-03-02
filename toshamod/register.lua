local S = technic.getter

function technic.register_spinner(data)
	data.typename = "spinning"
	data.machine_name = "spinner"
	data.machine_desc = S("%s Spinner")
	technic.register_base_machine(data)
end
