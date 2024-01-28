package main

import (
    "fmt"
    "os"
    "os/exec"
    "strings"
    tea "github.com/charmbracelet/bubbletea"
)

type model struct {
    choices []string
    cursor int
}

func initialModel() model {
    var m model
    m.choices = ReadFile("/home/ouroboros/dev/projects/git/file-manager/input")

    return m
}

func (m model) Init() tea.Cmd {
    // Just return `nil`, which means "no I/O right now, please."
    return nil
}

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
    m.choices = ReadFile("/home/ouroboros/dev/projects/git/file-manager/input")
    switch msg := msg.(type) {

    // Is it a key press?
    case tea.KeyMsg:

        // Cool, what was the actual key pressed?
        switch msg.String() {

        // These keys should exit the program.
        case "ctrl+c", "q":
            return m, tea.Quit

        // The "up" and "k" keys move the cursor up
        case "up", "k":
            if m.cursor > 0 {
                m.cursor--
            }

        // The "down" and "j" keys move the cursor down
        case "down", "j":
            if m.cursor < len(m.choices)-1 {
                m.cursor++
            }

        // The "enter" key and the spacebar (a literal space) toggle
        // the selected state for the item that the cursor is pointing at.

        case "backspace":
            choice := ReadFile("/home/ouroboros/dev/projects/git/file-manager/currentdir")
            output := choice[0][:strings.LastIndex(choice[0],"/")]
            WriteFile("/home/ouroboros/dev/projects/git/file-manager/output", output)
            _,err := exec.Command("/bin/bash", "/home/ouroboros/dev/projects/git/file-manager/dirs.sh").Output()
            if ( err != nil) {
                fmt.Println("bad script")
            }

        case "enter", " ":
            WriteFile("/home/ouroboros/dev/projects/git/file-manager/output", m.choices[m.cursor])
            _,err := exec.Command("/bin/bash", "/home/ouroboros/dev/projects/git/file-manager/dirs.sh").Output()
            if ( err != nil) {
                fmt.Println("bad script")
            }

        }
    }

    // Return the updated model to the Bubble Tea runtime for processing.
    // Note that we're not returning a command.
    return m, nil
}

func (m model) View() string {
    // The header
    s := "What should we buy at the market?\n\n"

    // Iterate over our choices
    for i, choice := range m.choices {

        // Is the cursor pointing at this choice?
        cursor := " " // no cursor
        if m.cursor == i {
            cursor = ">" // cursor!
        }

        // Render the row
        s += fmt.Sprintf("%s %s\n", cursor, choice)
    }

    // The footer
    s += "\nPress q to quit.\n"

    // Send the UI for rendering
    return s
}

func main() {
    projdir := "/home/ouroboros/dev/projects/git/file-manager/"

    current_dir_file := projdir+"current_dir"
    output_dir := projdir + "output"
    //input_dir := projdir+"input"

    //WriteFile(input_dir,);
    WriteFile(current_dir_file,projdir);
    WriteFile(output_dir,projdir);
    p := tea.NewProgram(initialModel())
    if _, err := p.Run(); err != nil {
        fmt.Printf("Alas, there's been an error: %v", err)
        os.Exit(1)
    }
}
