# Change Log

## 1.1.0 (in alpha)
- Modules are now passed a `metadata` field that gives runtime information to the module.
- FS providers now fill an `FSID` field that gives the ID of the filesystem abstraction.
- FS providers now fill a `Loader` field determining what function should load the file. Defaults to a compatibility shim for `load`.
- FS providers now internally use a common method for pathing, making way for frontend support.
- FS providers no longer have to provide `IsFile` or `IsDirectory` methods, but these have been deprecated since 1.0.0.
- Added `G:GetMetadata` for retrieving metadata of a module.
- Added `G.Directory` reference to local directory object.
- Added `Directory:Import`, `Directory:ImportAs`, and `Directory:ImportAll` for importing loaded modules.
- `G:Get` now returns a second item, the metadata of the loaded module, if it exists.
- Removed `G.Config.FileExtensions`, replaced with `G.Config.Loaders`: it was undocumented anyways.
- Added support for custom Lua frontends, like MoonScript, with `G.Config.Loaders`.
- Improved LuaFileSystem fallbacks for Windows (notably for checking directory existence)
- Support modules now use public-style naming as they were supposed to in 1.0.
- Deprecated methods, these will be removed in 2.0:
	- `Directory:GetGrapheneCore`, use `Directory:GetGraphene` instead.
	- `G:ClearRebases`, use `G:ClearSubmodules` instead.

## 1.0.1
- Fixed version check with LOVE 0.9.0

## 1.0.0
- Renamed library to Graphene.
- `GetNamespaceCore` renamed to `GetGrapheneCore`.
- Recommended variable to reference the graphene core is now G.
- Based on Namespace 0.4.0-beta.
- New `gengraphene.lua` generator for slimming down the Graphene core.
- Now supports multiple file extensions; see `G.Config.FileExtensions`.
- API methods are now type checked to some degree.
- Rebasing rules have turned into Submodules, and `G:AddRebase` has been renamed to `G:AddSubmodule`.
- Added GenGraphine, a command line tool to generate smaller versions of Graphene.
- Added `G:AddAlias` for creating global aliasing rules.
- Exposed `G:CreateDirectory` to create Graphene directory objects.
- Directory init files (`_.lua` by default) can now be renamed, see `G.Config.InitFile`.
- Directory objects now have a `GrapheneGet` method that can be overloaded.
- Directory objects now have an `AddGrapheneSubmodule` method to allow infinite submodule nesting.
- Directory objects now have an `AddGrapheneAlias` method to allow nested aliasing.
- Directory objects now have a `CreateGrapheneSubdirectory` method to allow nested aliasing.
- Fixed self-referencing directory init files.
- Fixed directory objects being marked as closed but leaking anyways.
- Removed explicit hate support, it can be aliased as `love` for filesystem support.
- Removed explicit ROBLOX support, this might come back in the future.

## 0.4.0
- Case changed to PascalCase for public API.
- Added VFS unit test, since it's a little fragile.
- Vanilla Lua now has a non-LFS fallback.
- LOVE FS wrapper is now the highest priority.
- Parameters passed to loaded modules are now `(base, path)` instead of `(path, base)`
- Directories now have a `FullyLoad` member function to load all members of the namespace recursively.
- Added rebasing semantics with N:AddRebase, see the VFS unit test.
- Clearer documentation on all internal methods.

## 0.3.1
- Circular reference detection

## 0.3.0
- Directory loads now load `_.lua` in the directory if it exists.

## 0.2.1
- Namespaces in `.` now function properly.

## 0.2.0
- VFS now has lowest priority
- Pathing now works as expected
- `config.path` moved to FS provider's path variable
- By default, returns namespace unless `namespace.config.lib` is set to `false`.

## 0.1.0
- Initial release