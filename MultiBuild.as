void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("zlib");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"."
	});

	properties.files({
		"./*.h",
		"./*.c"
	});

	{
		MultiBuild::ScopedFilter _(project, "project.compiler:VisualCpp");
		properties.disable_warnings({ "4267", "4996", "4391" });
	}	

	{
		MultiBuild::ScopedFilter _(project, "config.platform:Windows");
		properties.defines({ "_CRT_SECURE_NO_WARNINGS", "_CRT_NONSTDC_NO_DEPRECATE" });
	}
}