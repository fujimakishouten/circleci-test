package main

import (
	"fmt"
	"os"
)

func main() {
	for _, argument := range os.Args {
		if argument == "-v" || argument == "--version" {
			fmt.Println("0.1.0")
			os.Exit(0)
		}
	}

	fmt.Println("Fight dayo!")
}
