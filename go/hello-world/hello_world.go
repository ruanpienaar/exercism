package greeting

const testVersion = 3
func HelloWorld(h string) string {
   if h == "" {
     return "Hello, World!"
   } else {
     return "Hello, "+h+"!"
   }
}
