let s:root = expand('<sfile>:p:h')
let s:tasks = json_decode(join(readfile(s:root .. '/tasks.json')))

