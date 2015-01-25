# Change Log

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