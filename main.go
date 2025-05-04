package main

import (
	"encoding/json"
	"fmt"
	"os"
)

func main() {
	var args struct {
		Name string `json:"name"`
	}

	if err := json.NewDecoder(os.Stdin).Decode(&args); err != nil {
		fmt.Fprintf(os.Stderr, "Invalid input: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("Hello, %s! This is a plugin.\n", args.Name)
}
