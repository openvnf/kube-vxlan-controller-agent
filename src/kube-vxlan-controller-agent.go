package main

import (
    "fmt"
    "os"
    "os/signal"
    "syscall"
)

var version string
var git_sha string

func main() {
    if len(os.Args) > 1 && os.Args[1] == "version" {
        fmt.Printf("Version %s (git-%s)\n", version, git_sha)
        os.Exit(0)
    }

    c := make(chan os.Signal, 1)
    signal.Notify(c, os.Interrupt, syscall.SIGTERM)
    <-c
    fmt.Println("Done.")
}
