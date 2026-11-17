$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add('http://localhost:8765/')
$listener.Start()
Write-Host 'Rozpis kuchyne bezi na http://localhost:8765. Zavrenim okna server vypnete.'
try {
  while ($listener.IsListening) {
    $ctx = $listener.GetContext()
    $name = [System.Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath).TrimStart('/')
    if (!$name) { $name = 'index.html' }
    $allowed = @('index.html','style.css','app.js','sw.js','manifest.webmanifest','icon.svg')
    if ($name -notin $allowed) { $ctx.Response.StatusCode = 404; $ctx.Response.Close(); continue }
    $path = Join-Path $root $name
    $types = @{'.html'='text/html; charset=utf-8'; '.css'='text/css; charset=utf-8'; '.js'='text/javascript; charset=utf-8'; '.svg'='image/svg+xml'; '.webmanifest'='application/manifest+json'}
    $ctx.Response.ContentType = $types[[System.IO.Path]::GetExtension($path)]
    $bytes = [System.IO.File]::ReadAllBytes($path)
    $ctx.Response.ContentLength64 = $bytes.Length
    $ctx.Response.OutputStream.Write($bytes,0,$bytes.Length)
    $ctx.Response.Close()
  }
} finally { $listener.Stop(); $listener.Close() }
