// Program.cs
var builder = WebApplication.CreateBuilder(args);
// ADD THIS LINE:
builder.WebHost.UseUrls("http://*:8000"); 
var app = builder.Build();
app.MapGet("/", () => "Hello World from .NET 10 on RHEL!");
app.Run();
