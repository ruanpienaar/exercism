package accumulate

func Accumulate(input []string, converter func(string) string) []string {
    return_str := []string{}
    for _, v := range input {
        return_str = append(return_str, converter(v))
    }
    return return_str
    
}