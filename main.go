package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"

	"gopkg.in/yaml.v3"
)

func main() {
	input, err := io.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error reading input: %v\n", err)
		os.Exit(1)
	}

	var args struct {
		Name string `json:"name" yaml:"name"`
	}

	// Try JSON first
	if err := json.Unmarshal(input, &args); err != nil {
		// If JSON fails, try YAML
		if yamlErr := yaml.Unmarshal(input, &args); yamlErr != nil {
			fmt.Fprintf(os.Stderr, "Invalid input: JSON error: %v, YAML error: %v\n", err, yamlErr)
			os.Exit(1)
		}
	}

	fmt.Printf("Hello, %s! This is a plugin.\n", args.Name)
}
