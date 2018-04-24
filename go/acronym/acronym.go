package acronym
import(
    //"fmt"
    "strings"
)

const testVersion = 2

func Abbreviate(s string) string {
    var replacer = strings.NewReplacer(
        ":", " ",
        "-", " ")
    s = replacer.Replace(s)
    var tokens []string = strings.Split(s, " ")
    var acronym string
    for i := 0; i<len(tokens); i++ {
        var t string = tokens[i]
        if(t != ""){

            //HyperText

            acronym += strings.ToUpper(string(t[0]))
        }
    }
    return acronym
}
