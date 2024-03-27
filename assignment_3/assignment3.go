package main

import (
	"fmt"
	"strings"
	"unicode"
)

func CaesarCipher(m string, shift int) string {
	m = strings.ToUpper(m)
	var result []rune
	for _, c := range m {
		if unicode.IsLetter(c) {
			result = append(result, ((c-'A'+rune(shift))%26)+'A')
		}
	}
	return string(result)
}

func CaesarCipherList(m []string, shift int, channel chan<- string) {
	for _, s := range m {
		channel <- CaesarCipher(s, shift)
	}
}

func main() {
	messages := []string{"Csi2520", "Csi2120", "3 Paradigms", "Go is 1st", "Prolog is 2nd", "Scheme is 3rd", "uottawa.ca", "csi/elg/ceg/seg", "800 King Edward"}
	channel := make(chan string)

	for i := 0; i < 3; i++ {
		start := i * len(messages) / 3
		end := (i + 1) * len(messages) / 3
		if i == 2 {
			end = len(messages)
		}
		go CaesarCipherList(messages[start:end], 2, channel)
	}

	for range messages {
		fmt.Println(<-channel)
	}
	close(channel)
}
