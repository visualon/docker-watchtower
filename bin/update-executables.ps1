Get-ChildItem *.sh -Recurse `
  | Where-Object { $_.FullName -notlike '*\node_modules\*' } `
  | ForEach-Object {
    git update-index --chmod=+x (Resolve-Path $_.FullName -Relative)
  }
